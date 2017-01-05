moment = require "moment"

exports.init = (app, model, preregisters, photos, transactions, weight)->
  app.get "/api/dashboard", app.get("isAdminMiddleware"), (req, res, next)->
    now = moment().format("DD.MM.YY HH")
    model.findOne {created_at: now}, (err, record)->
      if record
        res.send {dashboard: record}
      else
        preregisters.count (err, members_count)->
          transactions.find {created_at: {$gte: moment("09.03.16 12:00", "DD.MM.YY HH:mm").format()}, whos: {$nin: [ /^promoter_\d/g, /^mobile_\d/g ]}}, (err, transactions)->
            photos.count (err, photos_count)->
              weight.find {created_at: {$gte: moment("09.03.16 12:00", "DD.MM.YY HH:mm").format()}, whos: {$nin: [ /^promoter_\d/g, /^mobile_\d/g ]}}, (err, ws)->
                sum_w = 0
                sum_w = sum_w + parseFloat(w.weight, 10) for w in ws

                sum_t = 0
                sum_t = sum_t + parseInt(t.sum, 10) for t in transactions

                m = new model {created_at: moment().format("DD.MM.YY HH"), members_count: members_count, photos_count: photos_count, money_paid: sum_t, total_weight: sum_w.toFixed(0)}
                m.save (err)->
                  res.send {dashboard: m}