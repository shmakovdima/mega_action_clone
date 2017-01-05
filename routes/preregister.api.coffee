fs         = require 'fs'
path       = require "path"
juice      = require 'juice2'
moment     = require 'moment'
excel      = require 'msexcel-builder'
async      = require 'async'
requestify = require 'requestify'

blocked = [
  "mega_sa"
  "mobile_sa"
  "mega_om"
  "mobile_om"
  "mega_no"
  "mobile_no"
  "mega_pa"
  "mobile_pa"
  "mega_dy"
  "mobile_dy"
  "mega_ka"
  "mobile_ka"
  "mega_uf"
  "mobile_uf"
  "mega_ad"
  "mobile_ad"
]
blocked_cards = [
  "mega_ad"
  "mobile_ad"
]

exports.init = (app, model, mailer, photo_model, card_model, weight_model, transactions_model, sms)->
  app.get "/api/preregister", app.get("isAdminMiddleware"), (req, res, next)->
    if req.query.phone.length is 0
      page = if req.query.page is undefined then 1 else req.query.page
      start_date = moment(req.query.start_date, "DD.MM.YY")
      query = 
        created_at:
          $gte: start_date.format()
          $lte: start_date.set("date", start_date.get("date")+1).format()
    else
      page = 1
      query = 
        phone: req.query.phone
    model.find(query).limit(25).skip(25*(page-1)).sort({'created_at': -1}).exec (err, preregisters)->
      model.count query, (err, c)->
        if err then res.send(err) else res.send({total: c, preregisters: preregisters})

  app.post "/api/preregister", (req, res, next)->
    req.body.created_at = new Date()
    m = new model(req.body).save (err, mod)->
      if err 
        res.send({"!err": err}) 
      else 
        if err then res.send({"!err": err}) else res.send mod
        v = mod.email
        if /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test v
          res.locals.user = mod
          juice path.join(__dirname, '../', '/src/html/mail.html'), (err, html)->
            mailer.sendNoReply req.body.email, html, (err)->
              console.log(err) if err

  app.put "/api/preregister/:id", app.get("isAdminMiddleware"), (req, res, next)->
    model.findById req.params.id, (err, record)->
      if err || !record
        res.send 404
      else
        for key, val of req.body
          record[key] = val
        record.save (err)->
          if err then res.send({"!err": err}) else res.send record

  app.delete "/api/preregister/:id", app.get("isAdminMiddleware"), (req, res, next)->
    model.findById req.params.id, (err, record)->
      if err || !record
        res.send 404
      else
        record.remove (err)->
          if err then res.send(err) else res.send 200

  app.get "/api/preregister_new", app.get("isAdminMiddleware"), (req, res, next)->
    if (req.query.phone is undefined) or (req.query.phone.length is 0)
      query = {}
      page = req.query.page

      if (req.query.date_start isnt undefined) and (req.query.date_start.length isnt 0)
        start_date = moment(req.query.date_start + " 00:00:00", "DD.MM.YYYY HH:mm:ss").format()
      else
        start_date = moment("09.03.2016 00:00:00", "DD.MM.YYYY HH:mm:ss").format()
      
      if (req.query.date_end isnt undefined) and (req.query.date_end.length isnt 0)
        end_date = moment(req.query.date_end + " 23:59:59", "DD.MM.YYYY HH:mm:ss").format()
      else
        end_date = moment("10.10.2020 23:59:59", "DD.MM.YYYY HH:mm:ss").format()

      if (req.query.mega isnt undefined) and (parseInt(req.query.mega, 10) isnt -1)
        query.mega = parseInt req.query.mega, 10

      query.created_at = 
        $gte: start_date
        $lte: end_date
        
    else
      page = 1
      query = 
        phone: req.query.phone
    model.find(query).limit(25).skip(25*(page-1)).sort({'created_at': -1}).exec (err, preregisters)->
      model.count query, (err, c)->
        if err then res.send(err) else res.send({total: c, preregisters: preregisters})

  app.put "/api/preregister_new/:id", app.get("isAdminMiddleware"), (req, res, next)->
    model.findById req.params.id, (err, record)->
      if err || !record
        res.send 404
      else
        for key, val of req.body
          record[key] = val
        record.save (err)->
          if err then res.send({"!err": err}) else res.send record

  app.delete "/api/preregister_new/:id", app.get("isAdminMiddleware"), (req, res, next)->
    model.findById req.params.id, (err, record)->
      if err || !record
        res.send 404
      else
        record.remove (err)->
          if err then res.send(err) else res.send 200

  app.get "/api/preregister/find", app.get("isPromouterMiddleware"), (req, res, next)->
    model.findOne req.query, (err, preregister)->
      res.send if err then {"!err": err} else {"preregister": preregister}

  app.get "/api/preregister/find/admin", app.get("isAdminMiddleware"), (req, res, next)->
    model.findOne req.query, (err, preregister)->
      if !preregister then res.send(404) else photo_model.find {_id: {$in: preregister.looks}}, (err, photos)->
        res.send if err then {"!err": err} else {"preregister": preregister, "photos": photos}

  app.get "/api/preregister/:id/weight", app.get("isPromouterMiddleware"), (req, res, next)->
    model.findById req.params.id, (err, record)->
      result = []
      for w in record.weight
        mega = record.getMega(w.mega)
        result.push {mega: mega, weight: w.weight, created_at: w.created_at}
      res.send result

  app.post "/api/preregister/:id/weight", app.get("isPromouterMiddleware"), (req, res, next)->
    req.body.created_at = new Date()
    req.body.mega = req.session.mega
    req.body.whos = req.session.login

    model.findById req.params.id, (err, record)->
      if err 
        res.send {"!err": err}
      else
        today_income = 0
        now = moment().format("DD.MM.YYYY")
        for w in record.weight
          w_date = moment(w.created_at).format("DD.MM.YYYY")
          if w_date is now
            today_income += w.weight*100

        weight = new weight_model req.body
        weight.owner = req.params.id
        weight.save()

        record.weight.push req.body

        if blocked.indexOf(req.session.login.toLowerCase()) is -1
          record.balance += if today_income >= 500 then 0 else (if (today_income + req.body.weight*100) > 500 then 500-today_income else req.body.weight*100)
          record.balance = 1500 if record.balance > 1500
          record.verify_code = 100000 + Math.floor(Math.random()*899999) if record.verify_code is undefined
        
        record.save (err)->
          text = switch
            when blocked.indexOf(req.session.login.toLowerCase()) isnt -1 then 'Blagodarim vas za vklad ' + req.body.weight + ' kg. Uchastvui v konkurse i vuigrai 3000 rub.  ili 100.000 rub.! Podrobonsti na http://change.megamall.ru'
            when req.body.weight*100 >= 500 then 'Blagodarim vas za vklad ' + req.body.weight + ' kg. Vash balans: ' + record.realBalance(record.balance, record.transactions) + ' rub. Maximalnyi bonus - 500 rub v sutki, 1500 rub za ves period. Podrobonsti na http://change.megamall.ru'
            when record.realBalance(record.balance, record.transactions) < 250 then 'Zachisleno: ' + req.body.weight + ' kg. Balans: ' + record.realBalance(record.balance, record.transactions) + ' rub. Sdaite ' + (250 - record.realBalance(record.balance, record.transactions)) / 100 + ' kg do 9.04.2016 i poluchite kartu "MEGA podarok" v MEGE. http://change.megamall.ru '
            when record.realBalance(record.balance, record.transactions) >= 250 then 'Zachisleno: ' + req.body.weight + ' kg. Balans: ' + record.realBalance(record.balance, record.transactions) + ' rub. Poluchite kartu "MEGA podarok" v MEGE, kod: ' + record.verify_code + ' http://change.megamall.ru '
          sms.send record.phone, text
          if err 
            res.send({"!err": err}) 
          else 
            v = record.email
            res.send if err then {"!err": err} else record
            if /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test v
              real_balance = record.realBalance(record.balance, record.transactions)
              template_name = switch
                when blocked.indexOf(req.session.login.toLowerCase()) isnt -1 then 'mail_nocart'
                when real_balance < 250 then 'mail_balance'
                when real_balance < 500 then 'mail_balance_more_2500'
                when true then 'mail_balance_more_5000'

              juice path.join(__dirname, '../', 'src/html/' + template_name + '.html'), (err, html)->
                console.log err
                balance = real_balance
                rest = ((250-balance)/100).toFixed(2)
                name = record.fname + ' ' + record.lname
                wrapped_html = html.replace(/\{\{NAME\}\}/gi, name).replace(/\{\{WEIGHT\}\}/gi, req.body.weight).replace(/\{\{REST\}\}/gi, rest).replace(/\{\{BALANCE\}\}/gi, balance).replace(/\{\{CODE\}\}/gi, record.verify_code)
                mailer.sendNoReply record.email, wrapped_html, (err)->
                  console.log(err) if err

  app.post "/api/preregister/:id/transaction", app.get("isPromouterMiddleware"), (req, res, next)->   
    if blocked_cards.indexOf(req.session.login) is -1
      req.body.created_at = new Date()
      req.body.mega = req.session.mega
      req.body.whos = req.session.login

      query = {number: req.body.card_number, is_active: true}
      card_model.findOne query, (err, card)->
        if err or !card
          res.sendStatus 403
        else
          req.body.sum = 500 if card.owner > 500
          model.findById req.params.id, (err, record)->
            real_balance = record.balance 
            for t in record.transactions
              real_balance -= t.sum

            if real_balance - req.body.sum < -2
              res.send {"!err": "Not enough money"}
            else
              record.transactions.push req.body
              record.save (err, data)->
                res.send if err then {"!err": err} else data
              
              card.is_active = false
              card.recipient = req.params.id
              card.save()

              req.body.owner = record._id
              m = new transactions_model req.body
              m.save()
    else
      res.send 404

  app.get "/api/preregister/:id/verify", app.get("isPromouterMiddleware"), (req, res, next)->
    model.findById req.params.id, (err, record)->
      res.send if parseInt(req.query.code, 10) is record.verify_code then 200 else {"!err": "Wrong code"}
    
  app.post "/api/preregister/:id/verify", app.get("isPromouterMiddleware"), (req, res, next)-> 
    model.findById req.params.id, (err, record)->
      record.verify_code = 100000 + Math.floor(Math.random()*899999)
      sms.send record.phone, "Vash noviy kod " + record.verify_code + ", #megamenaysya"
      record.save()
      res.send 200
    

  app.post "/api/preregister/has", (req, res, next)->
    model.findOne {phone: req.body.phone}, (err, preregister)->
      res.send if err then {"!err": err} else {"has": !!preregister}

  app.post "/api/preregister/look", (req, res, next)->
    model.findOne {phone: req.body.phone}, (err, preregister)->
      preregister.looks.push req.body.photo_id
      preregister.save()
      photo_model.findById req.body.photo_id, (err, photo)->
        photo.status = 1
        photo.owner = {fname: preregister.fname, lname: preregister.lname}
        photo.mega = preregister.mega
        photo.save()
      res.send preregister

  app.get "/api/preregister/balance", (req, res, next)->
    model.findOne {phone: req.query.phone}, (err, preregister)->
      res.send if err or !preregister then 404 else {balance: preregister.realBalance(preregister.balance, preregister.transactions)}

  app.get "/api/preregister/totalWeight", app.get("isAdminMiddleware"), (req, res, next)->
    model.find {}, (err, records)->
      tw = 0
      for record in records
        for weight in record.weight
          tw = tw + weight.weight
      res.send {"tw": tw.toFixed(2)}

  # app.get "/api/preregister/totalWeightByDate", app.get("isAdminMiddleware"), (req, res, next)->
  #   result = []
  #   pasteRes = (date, sum)->
  #     for r in result
  #       if r.date is date
  #         return r.sum += sum
  #     result.push {"date": date, "sum": sum}
  #   weight_model.find {created_at: {$gte: moment("09.03.2016 12:00", "DD.MM.YYYY HH:mm").format()}}, (err, weights)->
  #     for weight in weights
  #       if !/^promoter_/g.test(weight.whos) and !/^mobile_\d/gi.test(weight.whos)
  #         pasteRes moment(weight.created_at).format("DD.MM.YYYY"), weight.weight
  #     res.send {"result": result}

  app.get "/api/preregister/weight/find", app.get("isAdminMiddleware"), (req, res, next)->
    page = if req.query.page is undefined then 1 else req.query.page

    start_date = moment(req.query.date_start + " 00:00", "DD.MM.YYYY HH:ss").format()
    end_date = moment(req.query.date_end + " 23:59", "DD.MM.YYYY HH:ss").format()

    weight_query = 
      created_at: 
        $gte: start_date
        $lte: end_date

    weight_query.whos = req.query.mega if parseInt(req.query.mega, 10) isnt -1

    data = []
    if req.query.phone.length is 0
      weight_model.find(weight_query).limit(100).skip(100*(page-1)).sort({'created_at': -1}).exec (err, weights)->
        owners = []

        for w in weights
          owners.push w.owner

        model.find {_id: {$in: owners}}, (err, records)->
          for w in weights
            for r in records
              if w.owner is r._id+""
                data.push
                  fname: r.fname
                  lname: r.lname
                  phone: r.phone
                  weight: w.weight
                  created_at: w.created_at
                  whos: w.whos
                  _id: w._id 
                break
          weight_model.count weight_query, (err, c)->
            res.send {weights: data, total: c}
    else
      model.findOne({phone: req.query.phone}).exec (err, r)->
        if !r
          res.send {weights: data, total: 0}
        else
          weight_query.owner = r._id
          weight_model.find(weight_query).limit(100).skip(100*(page-1)).sort({'created_at': -1}).exec (err, weights)->
            if !weights
              res.send {weights: data, total: 0}
            else
              for w in weights
                data.push
                  fname: r.fname
                  lname: r.lname
                  phone: r.phone
                  weight: w.weight
                  created_at: w.created_at
                  whos: w.whos
                  _id: w._id 
              weight_model.count weight_query, (err, c)->
                res.send {weights: data, total: c}

  app.put "/api/preregister/weight/find/:id", app.get("isAdminMiddleware"), (req, res, next)->
    weight_model.findOne {_id: req.params.id}, (err, we)->
      we.weight = req.body.weight
      we.whos = req.body.whos
      we.save ()->
        res.send 200

      model.findOne {_id: we.owner}, (err, record)->
        for w in record.weight
          if moment(w.created_at).isSame we.created_at
            record.balance = record.balance - w.weight*100 + req.body.weight*100
            w.weight = req.body.weight
            w.whos = req.body.whos
            break
        record.save()

  app.delete "/api/preregister/weight/find/:id", app.get("isAdminMiddleware"), (req, res, next)->
    weight_model.findOne {_id: req.params.id}, (err, we)->

      model.findOne {_id: we.owner}, (err, record)->
        for i, w of record.weight
          if moment(w.created_at).isSame req.body.created_at
            record.balance = record.balance - w.weight*100
            record.weight.splice i, 1
            break
        record.save()

      we.remove ()->
        res.send 200

  app.post "/api/preregister/weight/find/", app.get("isAdminMiddleware"), (req, res, next)->
    model.findOne {phone: req.body.phone}, (err, record)->
      if err 
        res.send {"!err": err}
      else
        req.body.created_at = new Date()
        req.body.mega = record.getNumberByLogin(req.body.whos)
        req.body.whos = req.body.whos

        today_income = 0
        now = moment().format("DD.MM.YYYY")
        for w in record.weight
          w_date = moment(w.created_at).format("DD.MM.YYYY")
          if w_date is now
            today_income += w.weight*100

        weight = new weight_model req.body
        weight.owner = record._id
        weight.save()

        record.weight.push req.body

        record.balance += if today_income >= 500 then 0 else (if (today_income + req.body.weight*100) > 500 then 500-today_income else req.body.weight*100)
        record.balance = 1500 if record.balance > 1500
        record.verify_code = 100000 + Math.floor(Math.random()*899999) if record.verify_code is undefined
        record.save (err)->
          text = switch
            when req.body.weight*100 >= 500 then 'Blagodarim vas za vklad ' + req.body.weight + ' kg. Vash balans: ' + record.realBalance(record.balance, record.transactions) + ' rub. Maximalnyi bonus - 500 rub v sutki, 1500 rub za ves period. Podrobonsti na http://change.megamall.ru'
            when record.realBalance(record.balance, record.transactions) < 250 then 'Zachisleno: ' + req.body.weight + ' kg. Balans: ' + record.realBalance(record.balance, record.transactions) + ' rub. Sdaite ' + (250 - record.realBalance(record.balance, record.transactions)) / 100 + ' kg do 9.04.2016 i poluchite kartu "MEGA podarok" v MEGE. http://change.megamall.ru '
            when record.realBalance(record.balance, record.transactions) >= 250 then 'Zachisleno: ' + req.body.weight + ' kg. Balans: ' + record.realBalance(record.balance, record.transactions) + ' rub. Poluchite kartu "MEGA podarok" v MEGE, kod: ' + record.verify_code + ' http://change.megamall.ru '
          sms.send record.phone, text
          if err 
            res.send({"!err": err}) 
          else 
            v = record.email
            res.send if err then {"!err": err} else record
            if /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test v
              real_balance = record.realBalance(record.balance, record.transactions)
              template_name = switch
                when real_balance < 250 then 'mail_balance'
                when real_balance < 500 then 'mail_balance_more_2500'
                when true then 'mail_balance_more_5000'

              juice path.join(__dirname, '../', 'src/html/' + template_name + '.html'), (err, html)->
                balance = real_balance
                rest = ((250-balance)/100).toFixed(2)
                name = record.fname + ' ' + record.lname
                wrapped_html = html.replace(/\{\{NAME\}\}/gi, name).replace(/\{\{REST\}\}/gi, rest).replace(/\{\{BALANCE\}\}/gi, balance).replace(/\{\{CODE\}\}/gi, record.verify_code)
                mailer.sendNoReply record.email, wrapped_html, (err)->
                  console.log(err) if err

  app.get "/api/preregister/transaction/find", app.get("isAdminMiddleware"), (req, res, next)->
    page = if req.query.page is undefined then 1 else req.query.page

    start_date = moment(req.query.date_start + " 00:00", "DD.MM.YYYY HH:ss").format()
    end_date = moment(req.query.date_end + " 23:59", "DD.MM.YYYY HH:ss").format()

    t_query = 
      created_at: 
        $gte: start_date
        $lte: end_date

    t_query.whos = req.query.mega if parseInt(req.query.mega, 10) isnt -1
    t_query.card_number = req.query.card_number if !!req.query.card_number and parseInt(req.query.card_number, 10) isnt 0

    data = []
    if req.query.phone.length is 0
      transactions_model.find(t_query).limit(100).skip(100*(page-1)).sort({'created_at': -1}).exec (err, transactions)->
        owners = []

        for t in transactions
          owners.push t.owner

        model.find {_id: {$in: owners}}, (err, records)->
          for t in transactions
            for r in records
              if t.owner is r._id+""
                data.push
                  fname: r.fname
                  lname: r.lname
                  phone: r.phone
                  sum: t.sum
                  created_at: t.created_at
                  card_number: t.card_number
                  whos: t.whos
                  _id: t._id 
                break
          transactions_model.count t_query, (err, c)->
            res.send {transactions: data, total: c}
    else
      model.findOne({phone: req.query.phone}).exec (err, r)->
        if !r
          res.send {transactions: [], total: 0}
        else
          t_query.owner = r._id
          transactions_model.find(t_query).limit(100).skip(100*(page-1)).sort({'created_at': -1}).exec (err, transactions)->
            if !transactions
              res.send {transactions: data, total: 0}
            else
              for t in transactions
                data.push
                  fname: r.fname
                  lname: r.lname
                  phone: r.phone
                  sum: t.sum
                  created_at: t.created_at
                  card_number: t.card_number
                  whos: t.whos
                  _id: t._id 
              transactions_model.count t_query, (err, c)->
                res.send {transactions: data, total: c}

  app.put "/api/preregister/transaction/find/:id", app.get("isAdminMiddleware"), (req, res, next)->
    transactions_model.findOne {_id: req.params.id}, (err, tr)->
      card_model.update {number: tr.card_number}, {$set: {is_active: true}}, (err, n)->
        card_model.update {number: req.body.card_number}, {$set: {is_active: false}}, (err, n)->
          ok = 1

      tr.card_number = req.body.card_number
      tr.whos = req.body.whos
      tr.save ()->
        res.send 200

      model.findOne {_id: tr.owner}, (err, record)->
        for t in record.transactions
          if moment(t.created_at).isSame tr.created_at
            t.card_number = req.body.card_number
            t.whos = req.body.whos
            t.sum = tr.sum
            break
        record.save()

  app.delete "/api/preregister/transaction/find/:id", app.get("isAdminMiddleware"), (req, res, next)->
    transactions_model.findOne {_id: req.params.id}, (err, tr)->
      card_model.update {number: tr.card_number}, {$set: {is_active: true}}, (err, n)->
        ok = 1

      model.findOne {_id: tr.owner}, (err, record)->
        for i, t of record.transactions
          if moment(t.created_at).isSame tr.created_at
            record.transactions.splice i, 1
            break
        record.save()

      tr.remove ()->
        res.send 200

  app.post "/api/preregister/transaction/find/", app.get("isAdminMiddleware"), (req, res, next)->
    model.findOne {phone: req.body.phone}, (err, record)->
      if err 
        res.send {"!err": err}
      else
        req.body.created_at = new Date()
        req.body.mega = record.getNumberByLogin(req.body.whos)

        query = {number: req.body.card_number, is_active: true}
        card_model.findOne query, (err, card)->
          if err or !card
            res.send 403
          else
            req.body.sum = if card.owner > 500 then 500 else 250

            real_balance = record.balance 
            for t in record.transactions
              real_balance -= t.sum

            if real_balance - req.body.sum < -2
              res.send {"!err": "Not enough money"}
            else
              record.transactions.push req.body
              record.save()
              
              card.is_active = false
              card.recipient = record._id
              card.save()

              req.body.owner = record._id
              m = new transactions_model req.body
              m.save (err, data)->
                res.send if err then {"!err": err} else data

  # CSV

  app.get "/api/preregister/csv", app.get("isAdminMiddleware"), (req, res, next)->
    requestify.get("http://change.megamall.ru:5000/api/preregister/csv").then (response)->
      res.send response.getBody()

  app.get "/api/preregister/weight/csv", app.get("isAdminMiddleware"), (req, res, next)->
    requestify.get("http://change.megamall.ru:5000/api/preregister/weight/csv").then (response)->
      res.send response.getBody()

  app.get "/api/preregister/transaction/csv", app.get("isAdminMiddleware"), (req, res, next)->
    requestify.get("http://change.megamall.ru:5000/api/preregister/transaction/csv").then (response)->
      res.send response.getBody()

  app.get "/api/preregister/supervisor/csv", app.get("isAdminMiddleware"), (req, res, next)->
    requestify.get("http://change.megamall.ru:5000/api/preregister/supervisor/csv").then (response)->
      res.send response.getBody()