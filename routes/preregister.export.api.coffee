fs     = require 'fs'
path   = require "path"
juice  = require 'juice2'
moment = require 'moment'
excel  = require 'msexcel-builder'
async  = require 'async'

exports.init = (app, model, mailer, photo_model, card_model, weight_model, transactions_model, sms)->
  app.get "/api/preregister/csv", (req, res, next)->
    console.log "start process ", moment().format("DD.MM.YY HH:mm:ss")
    async.parallel {
      init: (cb)->
        ts = new Date().valueOf()
        res.send {name: 'export_users_' + ts + '.xls'}
        cb null, ts
      preregisters: (cb)->
        model.find({weight: {$exists: true}}).sort({'created_at': -1}).exec (err, preregisters)->
          cb null, preregisters
      photos: (cb)->
        photo_model.find {}, (err, photos)->
          hash = {}
          for photo in photos
            hash[photo._id] = photo
          cb null, hash
    }, (err, results)->
      ts = results.init
      file_name = path.join(__dirname, '../', '/dist/csv/export_users_' + ts + '.xls')

      preregisters = results.preregisters
      photos = results.photos
      
      workbook = excel.createWorkbook(path.join(__dirname, '../', '/dist/csv'), 'export_users_' + ts + '.xls')
      sheet1 = workbook.createSheet('sheet1', 12, 150000)
      
      sheet1.set 1, 1, 'Имя'
      sheet1.set 2, 1, 'Фамилия'
      sheet1.set 3, 1, 'Телефон'
      sheet1.set 4, 1, 'E-mail'
      sheet1.set 5, 1, 'Мега'
      sheet1.set 6, 1, 'Первая активность'
      sheet1.set 7, 1, 'Общий сданный вес'
      sheet1.set 8, 1, 'Карт выдано'
      sheet1.set 9, 1, 'Зарегистрирован'
      sheet1.set 10, 1, 'Расшареное фото'
      sheet1.set 11, 1, 'Баланс'
      sheet1.set 12, 1, 'Загружено фото'

      # str = 2

      async.eachSeries preregisters, (p, callback)->
        str = preregisters.indexOf(p) + 2

        first_active = switch
          when p.initial_active isnt undefined then ia_hash[p.initial_active]
          when (p.weight.length is 0) and (p.looks.length is 0) then "тизер"
          when (p.weight.length is 0) or ((p.looks.length isnt 0) and ((new Date(p.weight[0].created_at) - new Date(photos[p.looks[0]].created_at)) > 0)) then "фото"
          

          # when (p.weight.length is 0) or ((p.looks.length isnt 0) and p.weight[0].created_at.toDate() > p.looks[0].created_at.toDate() then "фото"
          when true then "вес"

        has_share = false
        for l in p.looks
          has_share = has_share || photos[l].is_shared if photos[l] isnt undefined
        # for photo in photos
        #   has_share = has_share || (photo.is_shared && (p.looks.indexOf(photo._id+"") isnt -1))

        if ((first_active isnt "вес") or (p.getMegaByLogin(p.weight[0].whos) isnt "УДАЛИТЬ"))
          sheet1.set 1, str, p.fname
          sheet1.set 2, str, p.lname
          sheet1.set 3, str, p.phone
          sheet1.set 4, str, if p.email is undefined then "" else p.email
          sheet1.set 5, str, if first_active is "вес" then p.getMegaByLogin(p.weight[0].whos) else p.getMega(p.mega)
          sheet1.set 6, str, first_active
          sheet1.set 7, str, p.totalWeight(p.weight)
          sheet1.set 8, str, p.transactions.length
          sheet1.set 9, str, moment(p.created_at).format("DD.MM.YY HH:mm:ss")
          sheet1.set 10, str, has_share
          sheet1.set 11, str, p.realBalance p.balance, p.transactions
          sheet1.set 12, str, p.looks.length
        else
          p.remove()

        async.setImmediate callback
      , ()->
        workbook.save ()->
          console.log "end process ", moment().format("DD.MM.YY HH:mm:ss")

  app.get "/api/preregister/weight/csv", (req, res, next)->
    ts = new Date().valueOf()
    file_name = path.join(__dirname, '../', '/dist/csv/export_weight_' + ts + '.xls')

    res.send {name: 'export_weight_' + ts + '.xls'}   

    model.find().sort({'created_at': -1}).exec (err, preregisters)->
      workbook = excel.createWorkbook(path.join(__dirname, '../', '/dist/csv/'), 'export_weight_' + ts + '.xls')
      sheet1 = workbook.createSheet('sheet1', 7, 200000)
      
      sheet1.set 1, 1, 'Вес'
      sheet1.set 2, 1, 'Имя'
      sheet1.set 3, 1, 'Фамилия'
      sheet1.set 4, 1, 'Телефон'
      sheet1.set 5, 1, 'E-mail'
      sheet1.set 6, 1, 'Мега'
      sheet1.set 7, 1, 'Время операции'

      str = 2
      for p in preregisters
        for w in p.weight
          if moment(w.created_at).isAfter moment("09.03.16 12:00", "DD.MM.YY HH:ss")

            sheet1.set 1, str, w.weight
            sheet1.set 2, str, p.fname
            sheet1.set 3, str, p.lname
            sheet1.set 4, str, p.phone
            sheet1.set 5, str, if p.email is undefined then "" else p.email
            sheet1.set 6, str, p.getMegaByLogin(w.whos)
            sheet1.set 7, str, moment(w.created_at).format("DD.MM.YY HH:mm:ss")

            str = str+1

      workbook.save ()->
        console.log "ok"

  app.get "/api/preregister/transaction/csv", (req, res, next)->
    card_hash = {}

    ts = new Date().valueOf()
    file_name = path.join(__dirname, '../', '/dist/csv/export_result_prizes_' + ts + '.xls')

    res.send {name: 'export_result_prizes_' + ts + '.xls'}  

    model.find().sort({'created_at': -1}).exec (err, preregisters)->
      workbook = excel.createWorkbook(path.join(__dirname, '../', '/dist/csv/'), 'export_result_prizes_' + ts + '.xls')
      sheet1 = workbook.createSheet('sheet1', 9, 200000)
      
      sheet1.set 1, 1, 'Номер карты'
      sheet1.set 2, 1, 'Дата и время'
      sheet1.set 3, 1, 'ID точки'
      sheet1.set 4, 1, 'Телефон'
      sheet1.set 5, 1, 'Фамилия'
      sheet1.set 6, 1, 'Имя'
      sheet1.set 7, 1, 'E-mail'
      sheet1.set 8, 1, 'Сумма'
      sheet1.set 9, 1, 'МЕГА / IKEA'

      str = 2
      async.eachSeries preregisters, (p, callback)->
        _str = str
        str = str + p.transactions.length
        transactions = []
        for t in p.transactions
          if moment(t.created_at).isAfter(moment("09.03.16 12:00", "DD.MM.YY HH:mm")) and card_hash[t.card_number] is undefined
            card_hash[t.card_number] = true

            sheet1.set 1, _str, t.card_number
            sheet1.set 2, _str, moment(t.created_at).format("DD.MM.YY HH:mm:ss")
            sheet1.set 3, _str, p.getMegaByLogin(t.whos).replace /promoter_([0-9])/gi, "mobile_$1"
            sheet1.set 4, _str, p.phone
            sheet1.set 5, _str, p.lname
            sheet1.set 6, _str, p.fname
            sheet1.set 7, _str, if p.email is undefined then "" else p.email
            sheet1.set 8, _str, t.sum
            sheet1.set 9, _str, if t.is_ikea then "IKEA" else "МЕГА"

            _str = _str + 1
            transactions.push t

        p.transactions = transactions
        p.save ()->
          async.setImmediate callback

      , ()->
        workbook.save ()->
          console.log "ok"   

  app.get "/api/preregister/supervisor/csv", (req, res, next)->
    card_hash = {}

    ts = new Date().valueOf()
    file_name = path.join(__dirname, '../', '/dist/csv/export_result_supervisior_' + ts + '.xls')

    res.send {name: 'export_result_supervisior_' + ts + '.xls'}

    model.find().sort({'created_at': -1}).exec (err, preregisters)->
      workbook = excel.createWorkbook(path.join(__dirname, '../', '/dist/csv/'), 'export_result_supervisior_' + ts + '.xls')
      sheet1 = workbook.createSheet('sheet1', 5, 200000)
      
      sheet1.set 1, 1, 'ID точки'
      sheet1.set 2, 1, 'Тип активности'
      sheet1.set 3, 1, 'Дата и время'
      sheet1.set 4, 1, 'Сумма'
      sheet1.set 5, 1, 'Карта'

      str = 2
      for p in preregisters
        for t in p.transactions
          if moment(t.created_at).isAfter(moment("09.03.16 12:00", "DD.MM.YY HH:mm")) and card_hash[t.card_number] is undefined
            card_hash[t.card_number] = true

            sheet1.set 1, str, p.getMegaByLogin(t.whos).replace /promoter_([0-9])/gi, "mobile_$1"
            sheet1.set 2, str, "Снял"
            sheet1.set 3, str, moment(t.created_at).format("DD.MM.YY HH:mm:ss")
            sheet1.set 4, str, t.sum
            sheet1.set 5, str, t.card_number

            str = str + 1

        for w in p.weight
          if moment(w.created_at).isAfter moment("09.03.16 12:00", "DD.MM.YY HH:mm")

            sheet1.set 1, str, p.getMegaByLogin(w.whos).replace /promoter_([0-9])/gi, "mobile_$1"
            sheet1.set 2, str, "Внёс"
            sheet1.set 3, str, moment(w.created_at).format("DD.MM.YY HH:mm:ss")
            sheet1.set 4, str, w.weight
            sheet1.set 5, str, ""

            str = str+1

      workbook.save ()->
        console.log "ok"