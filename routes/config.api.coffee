fs = require 'fs'
exports.init = (app)->

  app.post "/api/config/startdate", app.get("isAdminMiddleware"), (req, res, next)->
    fs.writeFile "config.startdate.json", JSON.stringify(req.body, null, 2), (err)->
      res.send 200