async  = require "async"
moment = require "moment"

pasteRes = (result, date, sum)->
  for r in result
    if r.date is date
      r.graph += sum
      return r.sum += sum
  result.push {"date": date, "sum": sum, "graph": sum}

exports.init = (app, model, weight_model)->
  app.get "/api/weight/", app.get("isAdminMiddleware"), (req, res, next)->
    result = []
    weight_model.find {created_at: {$gte: moment("09.03.2016 12:00", "DD.MM.YYYY HH:mm").format()}, whos: {$nin: [ /^promoter_\d/g, /^mobile_\d/g ]}}, (err, weights)->
      async.eachSeries weights, (weight, callback)->
        pasteRes result, moment(weight.created_at).format("DD.MM.YYYY"), weight.weight
        async.setImmediate callback
      , ()->
        model.find {}, (err, records)->
          for rec in records
            date = rec.day
            for r in result
              if r.date is date         
                r.graph = rec.weight
          res.send {"result": result}

  app.get "/api/weight/graph", (req, res, next)->
    model.find {}, (err, records)->
      res.send {"weight": records}

  app.put "/api/weight/graph", (req, res, next)->
    model.findOne {day: req.body.day}, (err, m)->
      if !m
        n_m = new model
          day: req.body.day
          weight: req.body.weight
        n_m.save ()->
          ok = 1
      else
        model.update {day: req.body.day}, {$set: {weight: req.body.weight}}, (err, n)->
          ok = 1
    res.send 200
