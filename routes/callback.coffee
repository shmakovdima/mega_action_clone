exports.init = (app, mailer)->
  app.post "/api/callback", (req, res, next)->
    text = req.body.text.replace /\\n/gi, "<br />"
    text += "От учётной записи " + req.body.mega if req.body.mega isnt undefined
    mailer.sendSupport req.body.email, req.body.name, text, ()->
      res.send 200 
    