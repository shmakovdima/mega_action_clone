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
  WeightModel = require('./schemas/weight.coffee').get mongoose
  WeightGraphModel = require('./schemas/weight.graph.coffee').get mongoose

  WeightGraphModel.remove {}, ()->
    result = []
    pasteRes = (date, sum)->
      for r in result
        if r.date is date
          return r.sum += sum
      result.push {"date": date, "sum": sum}
    WeightModel.find {created_at: {$gte: moment("09.03.2016 12:00", "DD.MM.YYYY HH:mm").format()}}, (err, weights)->
      for weight in weights
        if !/^promoter_/g.test(weight.whos) and !/^mobile_\d/gi.test(weight.whos)
          pasteRes moment(weight.created_at).format("DD.MM.YYYY"), weight.weight
      for r in result
        wg = new WeightGraphModel {day: r.date, weight: r.sum}
        wg.save()

