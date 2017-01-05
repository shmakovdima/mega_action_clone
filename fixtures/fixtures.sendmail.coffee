fs     = require 'fs'
path   = require "path"
juice  = require 'juice2'
mailer = require "./mailer.coffee"
mongoose     = require 'mongoose'
config       = require "./config.json"

getSalt = ()->
  return Math.round((new Date().valueOf() * Math.random())) + ''

# database connection
mongoose.connect(config.db.path + config.db.name)
db = mongoose.connection

getHandler = (v, html)->
  ()->
    mailer.sendResult v, html, (err)->
        if err then console.log(v, "error", err) else console.log(v, "success", err)
db.on 'error', (err)->
  console.log "Error connection to database: ", err
db.once 'open', ()->
  console.log "Connected to db!"

  PreRegisterModel = require('./schemas/preregister.coffee').get mongoose

  PreRegisterModel.find {email: {$ne: ""}}, (err, preregisters)->
    juice path.join(__dirname, '/src/html/result_week.html'), (err, html)->
      console.log(err) if err
      i = 0
      for p in preregisters
        v = p.email
        if /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test v
          setTimeout getHandler(v, html), 24000*i
          i++