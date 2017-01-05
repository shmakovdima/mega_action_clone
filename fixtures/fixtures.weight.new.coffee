mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {fname: "Аристарх", lname: "Германович", phone: "+79774667169", weight: 2.2, created_at: "10.03.2016", mega: "mega_dy"}
  {fname: "Аристарх", lname: "Германович", phone: "+78989898989", weight: 2, created_at: "10.03.2016", mega: "mega_dy"}
  {fname: "Аристарх", lname: "Германович", phone: "+78989898989", weight: 2, created_at: "12.03.2016", mega: "mega_sa"}
  {fname: "Аристарх", lname: "Германович", phone: "+78989898989", weight: 1, created_at: "12.03.2016", mega: "mega_ts"}
  {fname: "Аристарх", lname: "Германович", phone: "+78989898989", weight: 2, created_at: "10.03.2016", mega: "mega_ro"}
  {fname: "Аристарх", lname: "Германович", phone: "+78989898989", weight: 2, created_at: "10.03.2016", mega: "mega_dy"}
]



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

  getMega = (mega_login)->
    mega_login = mega_login.toUpperCase()
    res = switch
      when mega_login is "MEGA_TS" then 0
      when mega_login is "MEGA_BD" then 1
      when mega_login is "MEGA_KH" then 2
      when mega_login is "MEGA_DY" then 3
      when mega_login is "MEGA_PA" then 4
      when mega_login is "MEGA_AD" then 5
      when mega_login is "MEGA_EK" then 6
      when mega_login is "MEGA_KA" then 7
      when mega_login is "MEGA_NN" then 8
      when mega_login is "MEGA_NO" then 9
      when mega_login is "MEGA_OM" then 10
      when mega_login is "MEGA_RO" then 11
      when mega_login is "MEGA_SA" then 12
      when mega_login is "MEGA_UF" then 13
      when mega_login is "MOBILE_TS" then 14
      when mega_login is "MOBILE_BD" then 14
      when mega_login is "MOBILE_KH" then 14
      when mega_login is "MOBILE_DY" then 14
      when mega_login is "MOBILE_PA" then 14
      when mega_login is "MOBILE_EK" then 14
      when mega_login is "MOBILE_OM" then 14
      when mega_login is "MOBILE_RO" then 14
      when mega_login is "MOBILE_SA" then 14
      when mega_login is "MOBILE_UF" then 14

  createWeight = (message, record, weight, created_at, mega)->
    data = 
      weight: weight
      created_at: moment(created_at, "DD.MM.YYYY").format()
      mega: getMega mega
      whos: mega
      owner: record._id

    model = new WeightModel data
    model.save ()->
      message += "Created weight for record " + record.phone + ": " + weight + "kg "
      record.weight.push data

      today_income = 0
      now = created_at
      for w in record.weight
        w_date = moment(w.created_at).format("DD.MM.YYYY")
        if w_date is now
          today_income += w.weight*100

      record.balance += if today_income >= 500 then 0 else (if (today_income + req.body.weight*100) > 500 then 500-today_income else req.body.weight*100)
      record.balance = 1500 if record.balance > 1500

      record.save ()->
        message += "User " + record.phone + " saved with new weight " + weight + "kg " 

  createPreregister = (message, lname, fname, phone, created_at, mega, cb)->
    model = new PreRegisterModel
      fname: fname
      lname: lname
      mega: getMega mega
      phone: phone
      created_at: moment(created_at, "DD.MM.YYYY").format()
    model.save (err, m)->
      message += "Successfully created user " + fname + " " + lname + " " + phone + " record!"
      cb(message, m, model)

  getPreregister = (message, phone, fname, lname, created_at, mega, cb)->
    PreRegisterModel.findOne {phone: phone}, (err, pr)->
      if !pr
        message += "User " + phone + " is not found! " + "\n"
        createPreregister message, lname, fname, phone, created_at, mega, (message, p, prereg)->
          cb message, p, prereg
      else
        message += "User " + phone + " is found! "
        cb message, pr, pr

  users_iterator = (user)->
    phone = user.phone
    mega = user.mega
    fname = user.fname
    lname = user.lname
    created_at = user.created_at
    weight = user.weight
    message = ""
    getPreregister message, phone, fname, lname, created_at, mega, (message, p, prereg)->
      createWeight message, prereg, weight, created_at, mega, (message)->
        console.log message + "\n\n"

  for user in data
    users_iterator user