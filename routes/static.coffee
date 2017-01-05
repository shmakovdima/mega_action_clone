moment = require 'moment'
config = require '../config.json'

require 'moment-range'

exports.init = (app)->
  
  app.get "/", (req, res, next)->
    delete require.cache[require.resolve('../config.startdate.json')]
    startdate = require '../config.startdate.json'
    sd_moment = moment startdate.date_start + " 12:00", "DD.MM.YYYY HH:mm"
    res.locals.dates_count = moment.range(moment(), sd_moment).diff('days')+1

    isTimer = moment().isBefore(sd_moment)

    res.locals.head = if isTimer then config.head.timer else config.head.index

    res.render (if isTimer then "timer" else "index"), res.locals

  app.get "/admin", (req, res, next)->
    delete require.cache[require.resolve('../config.startdate.json')]
    res.locals.startdate = require '../config.startdate.json'

    res.locals.head = config.head.admin

    cat = req.session.category
    view_name = switch
      when cat is 2 then "admin"
      when cat is 1 then "promouter"
      when cat is 3 then "expert"
      when cat is 4 then "moderator"
      when true then "guest"

    res.render "admin/" + view_name, res.locals

  app.get "/admin/users", app.get("isAdminMiddleware"), (req, res, next)->
    res.locals.head = config.head.admin
    res.render "admin/users", res.locals

  app.get "/admin/photo", app.get("isAdminMiddleware"), (req, res, next)->
    res.locals.head = config.head.admin
    res.render "admin/photo", res.locals

  app.get "/admin/weight", app.get("isAdminMiddleware"), (req, res, next)->
    res.locals.head = config.head.admin
    res.render "admin/weight", res.locals

  app.get "/admin/card", app.get("isAdminMiddleware"), (req, res, next)->
    res.locals.head = config.head.admin
    res.render "admin/card", res.locals

  app.get "/admin/winner", app.get("isAdminMiddleware"), (req, res, next)->
    res.locals.head = config.head.admin
    res.render "admin/winner", res.locals

  app.get "/admin/uploaded", app.get("isAdminMiddleware"), (req, res, next)->
    res.locals.head = config.head.admin
    res.render "admin/uploaded", res.locals

  app.get "/admin/search", app.get("isAdminMiddleware"), (req, res, next)->
    res.locals.head = config.head.admin
    res.render "admin/search", res.locals

  app.get "/mainpage", (req, res, next)->
    res.locals.head = config.head.index
    res.render "index", res.locals    

  app.get "/about", (req, res, next)->
    res.locals.head = config.head.index
    res.render "about", res.locals

  app.get "/photo", (req, res, next)->
    res.locals.head = config.head.index
    res.locals.og_url = ""
    res.locals.og_image = ""
    res.render "photo", res.locals
  app.get "/photo/:id", (req, res, next)->
    res.locals.head = config.head.index
    res.locals.og_url = "http://change.megamall.ru/photo/" + req.params.id
    res.locals.og_image = "http://change.megamall.ru/api/photo/" + req.params.id + "/share.png"
    res.render "photo", res.locals

  app.get "/calculate", (req, res, next)->
    res.locals.head = config.head.index
    res.render "calculate", res.locals          

  app.get "/winners", (req, res, next)->
    res.locals.head = config.head.index
    res.render "winners", res.locals 
  app.get "/winners/:id", (req, res, next)->
    res.locals.head = config.head.index
    res.render "winners", res.locals 

  app.use (req, res, next)->
    res.status 404

    res.locals.head = config.head['404']

    if req.accepts('html')
      res.render '404', res.locals
    else if req.accepts('json')
      res.send { error: 'Not found' }