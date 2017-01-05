easyimage  = require 'easyimage'
path       = require 'path'
juice      = require "juice2"
moment     = require "moment"
fs         = require "fs"
excel      = require 'msexcel-builder'
requestify = require 'requestify'

exports.init = (app, model, preregisters, imager, mailer)->
  app.get "/api/photo/", (req, res, next)->
    getPhotos = (start_arr=[], filters={})->
      page = if req.query.page is undefined then 1 else req.query.page
      filters.status = 3
      if req.query.filters isnt undefined
        if req.query.filters.mega isnt undefined
          filters.mega = parseInt req.query.filters.mega, 10
        if req.query.filters.isPretty isnt undefined
          filters.isPretty = parseInt(req.query.filters.isPretty, 10) is 1

        d = parseInt req.query.filters.date, 10
        date_start = switch
          when d is 0 then moment("09.03.16 12:00", "DD.MM.YY HH:mm").format()
          when d is 1 then moment("09.03.16 12:00", "DD.MM.YY HH:mm").format()
          when d is 2 then moment("16.03.16 00:00", "DD.MM.YY HH:mm").format()
          when d is 3 then moment("23.03.16 00:00", "DD.MM.YY HH:mm").format()
          when d is 4 then moment("30.03.16 00:00", "DD.MM.YY HH:mm").format()
        date_end = switch
          when d is 0 then moment("09.04.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
          when d is 1 then moment("15.03.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
          when d is 2 then moment("22.03.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
          when d is 3 then moment("29.03.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
          when d is 4 then moment("09.04.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
        filters.created_at=
          $gte: date_start
          $lte: date_end

      model.find(filters).limit(20).skip(20*(page-1)).sort({'updated_at': -1, 'created_at': -1}).exec (err, photos)->
        model.count {status: 3, created_at: {$gte: date_start, $lte: date_end}}, (err, c)->
          if err then res.send(err) else res.send({total: c, photos: start_arr.concat(photos)})

    if req.query.start_id is undefined
      getPhotos()
    else
      model.findOne {_id: req.query.start_id}, (err, record)->
        if err then res.send(err) else getPhotos [record], {_id: {$ne: req.query.start_id}}


  app.post "/api/photo", (req, res, next)->
    req.body.status = 0
    req.body.created_at = new Date()
    m = new model(req.body).save (err, mod)->
      if err then res.send({"!err": err}) else res.send mod

  app.get "/api/photo/expert", app.get("isExpertMiddleware"), (req, res, next)->
    page = if req.query.page is undefined then 1 else req.query.page
    model.find({status: 1}).limit(20).skip(20*(page-1)).sort({'created_at': -1}).exec (err, photos)->
      model.count {status: 1}, (err, c)->
        if err then res.send(err) else res.send({total: c, photos: photos})

  app.put "/api/photo/expert", app.get("isExpertMiddleware"), (req, res, next)->
    model.update {_id: req.body._id}, {status: 2, comment: req.body.comment, isPretty: req.body.isPretty, mayWin: req.body.mayWin, comment_by: req.session.login}, (err)->
      res.send if err then {"!err": err} else 200

  app.get "/api/photo/moderator", app.get("isModeratorMiddleware"), (req, res, next)->
    page = if req.query.page is undefined then 1 else req.query.page
    status = parseInt(req.query.status,10)
    model.find({status: status, owner: {$exists: true}}).limit(20).skip(20*(page-1)).sort({'created_at': -1}).exec (err, photos)->
      model.count {status: status}, (err, c)->
        if err then res.send(err) else res.send({total: c, photos: photos})

  editPhotoHandler = (req, res, next)->
    model.update {_id: req.body._id}, {$set: {status: req.body.status, comment: req.body.comment, isPretty: req.body.isPretty, mayWin: req.body.mayWin, updated_at: new Date()}}, (err)->
      res.send if err then {"!err": err} else 200  
      if parseInt(req.body.status, 10) is 3
        preregisters.findOne {looks: {$all: [req.body._id]}}, (err, record)->
          v = record.email
          if /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test v
            juice path.join(__dirname, '../', '/src/html/expert.html'), (err, html)->
              console.log(err) if err
              id = req.body._id
              src = req.body.src
              author = switch
                when req.body.comment_by is "olga1" then "Ольга Шелест"
                when req.body.comment_by is "olga2" then "Ольга Мальцева"
                when req.body.comment_by is "katya1" then "Екатерина Климова"
                when true then "Великий эксперт"

              mailer.sendNoReply v, html.replace(/\{\{ID\}\}/gi, id).replace(/\{\{SRC\}\}/gi, src).replace(/\{\{AUTHOR\}\}/gi, author).replace(/\{\{COMMENT\}\}/gi, req.body.comment), (err)->
                console.log(err) if err

  app.put "/api/photo/moderator", app.get("isModeratorMiddleware"), editPhotoHandler

  app.get "/api/photo/admin", app.get("isAdminMiddleware"), (req, res, next)->
    page = if req.query.page is undefined then 1 else req.query.page
    model.find({status: 3}).limit(20).skip(20*(page-1)).sort({'created_at': -1}).exec (err, photos)->
      model.count {status: 3}, (err, c)->
        if err then res.send(err) else res.send({total: c, photos: photos}) 

  app.get "/api/photo/winners/", (req, res, next)->
    getPhotos = (start_arr=[], filters={})->
      page = if req.query.page is undefined then 1 else req.query.page
      filters.is_winner = true
      filters.status = 3
      if req.query.filters isnt undefined
        if req.query.filters.mega isnt undefined
          filters.mega = parseInt req.query.filters.mega, 10
        if req.query.filters.isPretty isnt undefined
          filters.isPretty = parseInt(req.query.filters.isPretty, 10) is 1

        d = parseInt req.query.filters.date, 10
        date_start = switch
          when d is 0 then moment("09.03.16 12:00", "DD.MM.YY HH:mm").format()
          when d is 1 then moment("09.03.16 12:00", "DD.MM.YY HH:mm").format()
          when d is 2 then moment("16.03.16 00:00", "DD.MM.YY HH:mm").format()
          when d is 3 then moment("23.03.16 00:00", "DD.MM.YY HH:mm").format()
          when d is 4 then moment("30.03.16 00:00", "DD.MM.YY HH:mm").format()
        date_end = switch
          when d is 0 then moment("09.04.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
          when d is 1 then moment("15.03.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
          when d is 2 then moment("22.03.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
          when d is 3 then moment("29.03.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
          when d is 4 then moment("09.04.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
        filters.created_at=
          $gte: date_start
          $lte: date_end

      model.find(filters).limit(20).skip(20*(page-1)).sort({'updated_at': -1, 'created_at': -1}).exec (err, photos)->
        model.count {status: 3, is_winner: true, created_at: {$gte: date_start, $lte: date_end}}, (err, c)->
          if err then res.send(err) else res.send({total: c, photos: start_arr.concat(photos)})

    if req.query.start_id is undefined
      getPhotos()
    else
      model.findOne {_id: req.query.start_id}, (err, record)->
        if err then res.send(err) else getPhotos [record], {_id: {$ne: req.query.start_id}}    

  app.get "/api/photo/winner", app.get("isAdminMiddleware"), (req, res, next)->
    page = if req.query.page is undefined then 1 else req.query.page
    d = parseInt req.query.date, 10
    date_start = switch
      when d is 0 then moment("09.03.16 12:00", "DD.MM.YY HH:mm").format()
      when d is 1 then moment("09.03.16 12:00", "DD.MM.YY HH:mm").format()
      when d is 2 then moment("16.03.16 00:00", "DD.MM.YY HH:mm").format()
      when d is 3 then moment("23.03.16 00:00", "DD.MM.YY HH:mm").format()
      when d is 4 then moment("30.03.16 00:00", "DD.MM.YY HH:mm").format()
    date_end = switch
      when d is 0 then moment("09.04.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
      when d is 1 then moment("15.03.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
      when d is 2 then moment("22.03.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
      when d is 3 then moment("29.03.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
      when d is 4 then moment("09.04.16 23:59:59", "DD.MM.YY HH:mm:ss").format()
    query = 
      $or: [{
        status: 3
        is_winner: false
        created_at:
          $gte: date_start
          $lte: date_end
      }, {
        status: 3
        is_winner: {$exists: false}
        created_at:
          $gte: date_start
          $lte: date_end
      }]
    winners_query = 
      status: 3
      is_winner: true
      created_at:
        $gte: date_start
        $lte: date_end

    res_photos = []
    res_winners = []

    if req.query.owner.length is 0
      model.find(query).limit(15).skip(15*(page-1)).sort({'mayWin': -1, 'is_shared': -1, 'created_at': -1}).exec (err, photos)->
        model.find(winners_query).limit(15).sort({'mayWin': -1, 'is_shared': -1, 'created_at': -1}).exec (err, winners)->
          ids = []
          for p in photos
            ids.push p._id
          for w in winners
            ids.push w._id

          preregisters.find {looks: {$exists: true, $in: ids}}, (err, preregisters)->
            for p in photos
              for pr in preregisters
                if pr.looks.indexOf(p._id+"") isnt -1
                  res_photos.push 
                    "_id": p._id
                    "phone": pr.phone
                    "created_at": p.created_at
                    "mayWin": p.mayWin
                    "is_shared": p.is_shared
                    "src": p.src
            for w in winners
              for pr in preregisters
                if pr.looks.indexOf(w._id+"") isnt -1
                  res_winners.push 
                    "_id": w._id
                    "phone": pr.phone
                    "created_at": w.created_at
                    "mayWin": w.mayWin
                    "is_shared": w.is_shared
                    "src": w.src

            model.count query, (err, c)->
              if err then res.send(err) else res.send({total: c, photos: res_photos, winners: res_winners})  
    else
      model.findOne {_id: req.query.owner}, (err, photo)->
        model.find(winners_query).limit(15).sort({'mayWin': -1, 'is_shared': -1, 'created_at': -1}).exec (err, winners)->
          if photo
            preregisters.findOne {looks: {$exists: true, $in: [photo._id]}}, (err, preregister)->
              if photo.is_winner
                res.send {total: 1, winners: winners, photos: []}
              else
                res.send {total: 1, photos: [{"_id": photo._id, "phone": preregister.phone, "created_at": photo.created_at, "mayWin": photo.mayWin, "is_shared": photo.is_shared, "src": photo.src}], winners: winners}
          else
            res.send {total: 0, winners: winners, photos: []}
  app.post "/api/photo/winner/:id", app.get("isAdminMiddleware"), (req, res, next)->
    model.update {_id: req.params.id}, {$set: {is_winner: true}}, (err, n)->
      res.send if err then {"!err": err} else 200

  app.delete "/api/photo/winner/:id", app.get("isAdminMiddleware"), (req, res, next)->
    model.update {_id: req.params.id}, {$set: {is_winner: false}}, (err, n)->
      res.send if err then {"!err": err} else 200

  app.put "/api/photo/admin", app.get("isAdminMiddleware"), editPhotoHandler 

  app.get "/api/photo/:id/share", (req, res, next)->
    type = req.query.type
    title = encodeURIComponent "Эксперт моды оценил мой лук!"
    link_to = encodeURIComponent "http://change.megamall.ru/photo/" + req.params.id
    description = encodeURIComponent "Получи совет от одного из экспертов моды проекта “Меняйся”! Загрузи свой лук на change.megamall.ru и получи шанс выиграть одну из карт “МЕГА Подарок” на 3000 р.!"
    image = "http://change.megamall.ru/api/photo/" + req.params.id + "/share.png"

    url = switch
      when type is "ok" then "http://www.odnoklassniki.ru/dk?st.cmd=addShare&st.s=1&st.comments=" + description + "&st._surl=" + link_to
      when type is "tw" then "http://twitter.com/share?text=" + description + "&url=" + link_to + "&counturl=" + link_to
      when type is "fb" then "http://www.facebook.com/sharer.php?s=100&p[title]=" + title + "&p[summary]=" + description + "&p[url]=" + link_to + "&p[images][0]=" + image
      when type is "vk" then "http://vkontakte.ru/share.php?url=" + link_to + "&title=" + title + "&description=" + description + "&image=" + image + "&noparse=true"
    
    res.redirect url
    
    model.update {_id: req.params.id}, {$set: {is_shared: true}}, (err, r)->
      console.log(err) if err

  app.get "/api/photo/:id/share.png", (req, res, next)->
    model.findOne {_id: req.params.id}, (err, photo)->
      imager.processPic photo, res

  app.get "/api/photo/uploaded/admin", app.get("isAdminMiddleware"), (req, res, next)->
    query = {}

    page = req.query.filters.page

    if (req.query.filters.date_start isnt undefined) and (req.query.filters.date_start.length isnt 0)
      start_day = moment(req.query.filters.date_start + " 00:00:00", "DD.MM.YYYY HH:mm:ss").format()
    else
      start_day = moment("09.03.2016 00:00:00", "DD.MM.YYYY HH:mm:ss").format()
    
    if (req.query.filters.date_end isnt undefined) and (req.query.filters.date_end.length isnt 0)
      end_day = moment(req.query.filters.date_end + " 23:59:59", "DD.MM.YYYY HH:mm:ss").format()
    else
      end_day = moment("10.10.2020 23:59:59", "DD.MM.YYYY HH:mm:ss").format()

    query = 
      created_at:
        $gte: start_day
        $lte: end_day

    if (req.query.filters.isPretty isnt undefined) and (req.query.filters.isPretty isnt "-1")
      query.isPretty = if req.query.filters.isPretty is "0" then false else true

    if (req.query.filters.status isnt undefined) and (req.query.filters.status isnt "-2")
      query.status = parseInt req.query.filters.status, 10

    if (req.query.filters.id isnt undefined) and (req.query.filters.id.length isnt 0)
      query.created_at = new Date moment(parseInt(req.query.filters.id, 10) + 1456779600000, 'x').toISOString()

    if (req.query.filters.phone is undefined) or (req.query.filters.phone.length is 0)
      model.find(query).limit(20).skip(20*(page-1)).sort({'updated_at': -1, 'created_at': -1}).exec (err, photos)->
        if photos is undefined
          res.send {total: 0, photos: []}
        else
          model.count query, (err, c)->
            res.send {total: c, photos: photos}
    else
      preregisters.findOne {phone: req.query.filters.phone}, (err, record)->
        query._id = 
          $in: record.looks
        model.find query, (err, photos)->
          res.send {total: 1, photos: photos}

  app.put "/api/photo/uploaded/admin", app.get("isAdminMiddleware"), (req, res, next)->
    model.update {_id: req.body.id}, {$set: {comment: req.body.comment, status: parseInt(req.body.status, 10), isPretty: if req.body.isPretty is "0" then false else true}}, (err, n)->
      res.send 200

  app.delete "/api/photo/uploaded/admin", app.get("isAdminMiddleware"), (req, res, next)->
    model.findOne {_id: req.body.id}, (err, record)->
      record.remove()
      res.send 200

  app.post "/api/photo/:id/rotate", app.get("isModeratorMiddleware"), (req, res, next)->
    model.findOne {_id: req.params.id}, (err, record)->
      easyimage.rotate(
        src: path.join(__dirname, '../', '/dist/uploaded_images/' + record.src)
        dst: path.join(__dirname, '../', '/dist/uploaded_images/' + record.src)
        degree: parseInt req.body.degree, 10
      ).then ()->
        easyimage.rotate(
          src: path.join(__dirname, '../', '/dist/uploaded_images/mini-' + record.src)
          dst: path.join(__dirname, '../', '/dist/uploaded_images/mini-' + record.src)
          degree: parseInt req.body.degree, 10
        ).then ()->
          res.send 200
        , ()->
          res.send 200

  app.post "/api/photo/:id/rotate_expert", app.get("isExpertMiddleware"), (req, res, next)->
    model.findOne {_id: req.params.id}, (err, record)->
      easyimage.rotate(
        src: path.join(__dirname, '../', '/dist/uploaded_images/' + record.src)
        dst: path.join(__dirname, '../', '/dist/uploaded_images/' + record.src)
        degree: parseInt req.body.degree, 10
      ).then ()->
        easyimage.rotate(
          src: path.join(__dirname, '../', '/dist/uploaded_images/mini-' + record.src)
          dst: path.join(__dirname, '../', '/dist/uploaded_images/mini-' + record.src)
          degree: parseInt req.body.degree, 10
        ).then ()->
          res.send 200
        , ()->
          res.send 200

  app.get "/api/photo/csv", app.get("isAdminMiddleware"), (req, res, next)->
    requestify.get("http://change.megamall.ru:5000/api/photo/csv").then (response)->
      res.send response.getBody()

  app.get "/api/photo/csv2", app.get("isAdminMiddleware"), (req, res, next)->
    requestify.get("http://change.megamall.ru:5000/api/photo/csv2").then (response)->
      res.send response.getBody()