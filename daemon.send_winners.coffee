photos = [
  "5703ddf15b50cc689223ce18"
  "56f033f74c0ecbdb8b9c08fc"
  "56efaaa6d965107b33baf547"
  "56e9a0c5201fee3f6b02cb2d"
  "56e324317df24b7654e7c6dd"

]

mongoose     = require 'mongoose'
config       = require "./config.json"
mailer       = require "./mailer.coffee"
path         = require "path"
juice        = require "juice2"

# database connection
mongoose.connect(config.db.path + config.db.name)
db = mongoose.connection

db.on 'error', (err)->
  console.log "Error connection to database: ", err
db.once 'open', ()->
  console.log "Connected to db!"

  PreregisterModel = require('./schemas/preregister.coffee').get mongoose

  PreregisterModel.find {looks: {$in: photos}}, (err, records)->
    juice path.join(__dirname, '/src/html/winners/kh.html'), (err, html)->
      console.log(err) if err
      
      for record in records
        v = record.email
        if /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test v
          for ph in photos
            if record.looks.indexOf(ph) isnt -1
              template = html.replace /\{\{ID\}\}/gi, ph
              mailer.sendCustomMail {to: v, subject: 'Приглашаем в МЕГУ для получения приза', template: template}, (err)->
                console.log(err) if err

