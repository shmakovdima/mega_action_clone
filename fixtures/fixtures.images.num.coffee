mongoose     = require 'mongoose'
config       = require "./config.json"

# database connection
mongoose.connect(config.db.path + config.db.name)
db = mongoose.connection

db.on 'error', (err)->
  console.log "Error connection to database: ", err
db.once 'open', ()->
  console.log "Connected to db!"

  # Schemas loading
  PhotoModel = require('./schemas/photos.coffee').get mongoose

  PhotoModel.find({}).sort({created_at: 1}).exec (err, photos)->
    i = 1
    for p in photos
      p._id = i
      p.save()
      console.log i
