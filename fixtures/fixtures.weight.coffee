mongoose     = require 'mongoose'
config       = require "./config.json"

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
  WeightModel = require('./schemas/weight.coffee').get mongoose
  PreRegisterModel = require('./schemas/preregister.coffee').get mongoose

  WeightModel.remove {}, ()->
    PreRegisterModel.find {}, (err, records)->
      i = 0
      for record in records
        for w in record.weight
          model = new WeightModel {owner: record._id, mega: w.mega, created_at: w.created_at, weight: w.weight, whos: w.whos}
          model.save (err, mod)->
            console.log err, i
            i = i+1

