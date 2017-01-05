config   = require "./config.json"
request  = require "request"

exports.send = (phone, text)->
  url = config.sms.path + "?user=" + config.sms.login + "&type=3&password=" + config.sms.password + "&to=" + phone.replace(/\+/gi, "") + "&text=" + escape(text) + "&from=MEGA" 
  request.get {url: url}, (err, httpResponse, body)->
    