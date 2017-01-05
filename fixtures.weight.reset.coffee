mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

# database connection
mongoose.connect(config.db.path + config.db.name)
db = mongoose.connection

db.on 'error', (err)->
  console.log "Error connection to database: ", err
db.once 'open', ()->
  console.log "Connected to db!"

  # Schemas loading
  PreRegisterModel = require('./schemas/preregister.coffee').get mongoose
  WeightModel = require('./schemas/weight.coffee').get mongoose

  decreaseBalance = (w, callback)->
    PreRegisterModel.findOne {_id: w.owner}, (err, p)->
      p.balance -= w.weight*100
      p.save ()->
        console.log JSON.stringify(p, null, 2) + "\n"
        callback()

  WEIGHT = []
  i = 0
  iterate_weight = ()->
    if i < WEIGHT.length
      w = WEIGHT[i]
      i += 1
      console.log JSON.stringify(w, null, 2)
      decreaseBalance w, iterate_weight
  
  WeightModel.find {created_at: {$gte: moment("30.03.2016 00:00", "DD.MM.YYYY HH:mm").format()}, whos: {$in: ['mega_sa', 'mobile_sa']}}, (err, weights)->
    WEIGHT = weights
    iterate_weight()