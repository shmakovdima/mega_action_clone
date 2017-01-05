crypto = require 'crypto'

getSalt = ()->
  return Math.round((new Date().valueOf() * Math.random())) + ''

exports.init = (app, model)->

  app.get "/api/users", app.get("isAdminMiddleware"), (req, res, next)->
    model.find (err, users)->
      if err then res.send(err) else res.send(users)

  app.post "/api/users", app.get("isAdminMiddleware"), (req, res, next)->
    data = req.body
    data.salt = getSalt()
    data.password = crypto.createHmac('sha1', data.salt).update(data.password).digest('hex')
    data.category = 1
    new model(data).save (err)->
      if err then res.send(err) else res.send m

  app.put "/api/users/:id", app.get("isAdminMiddleware"), (req, res, next)->
    model.findById req.params.id, (err, record)->
      if err || !rerecords
        res.send 404
      else
        record.login = req.body.login
        record.password = crypto.createHmac('sha1', record.salt).update(req.body.password).digest('hex')
        record.save (err)->
          if err then res.send(err) else res.send record

  app.delete "/api/users/:id", app.get("isAdminMiddleware"), (req, res, next)->
    model.findById req.params.id, (err, record)->
      if err || !rerecords
        res.send 404
      else
        record.remove (err)->
          if err then res.send(err) else res.send 200

  app.post "/api/users/logout", (req, res, next)->
    req.session.category = 0
    res.send 200

  app.post "/api/users/login", (req, res, next)->
    model.findOne {login: req.body.login.replace(/\s/gi, "")}, (err, record)->
      if !record
        res.send 502
      else
        if record.password is crypto.createHmac('sha1', record.salt).update(req.body.password.toLowerCase().replace(/\s/gi, "")).digest('hex')
          req.session.category = record.category
          req.session.mega = record.mega
          req.session.login = record.login
          res.send 200
        else
          res.send 502

# sudo apt-get install libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++