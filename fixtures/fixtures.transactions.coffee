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
  TransactionsModel = require('./schemas/transactions.coffee').get mongoose
  PreRegisterModel = require('./schemas/preregister.coffee').get mongoose

  TransactionsModel.remove {}, ()->
    PreRegisterModel.find {}, (err, records)->
      i = 0
      for record in records
        for t in record.transactions
          model = new TransactionsModel {owner: record._id, mega: t.mega, created_at: t.created_at, sum: t.sum, whos: t.whos, card_number: t.card_number}
          model.save (err, mod)->
            console.log err, i
            i = i+1

