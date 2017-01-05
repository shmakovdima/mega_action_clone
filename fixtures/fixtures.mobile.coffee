mongoose     = require 'mongoose'
config       = require "./config.json"
crypto       = require 'crypto'

getSalt = ()->
  return Math.round((new Date().valueOf() * Math.random())) + ''

# database connection
mongoose.connect(config.db.path + config.db.name)
db = mongoose.connection

db.on 'error', (err)->
  console.log "Error connection to database: ", err
db.once 'open', ()->
  console.log "Connected to db!"

  # Schemas loading
  PreRegisterModel = require('./schemas/preregister.coffee').get mongoose
  PhotoModel = require('./schemas/photos.coffee').get mongoose
  UsersModel = require('./schemas/users.coffee').get mongoose

  createPromouter = (login, password, mega=14)->
    salt = getSalt()
    model = new UsersModel
      login: login.toLowerCase()
      salt: salt
      category: 1
      mega: mega
      password: crypto.createHmac('sha1', salt).update(password.toLowerCase()).digest('hex')
    model.save (err)->
      console.log if !err then ("Successfully created " + login + " record!") else err


