mongoose     = require 'mongoose'
config       = require "./config.json"
crypto       = require 'crypto'

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
  PreRegisterModel = require('./schemas/preregister.coffee').get mongoose
  PhotoModel = require('./schemas/photos.coffee').get mongoose
  UsersModel = require('./schemas/users.coffee').get mongoose

  createPromouter = (login, password, mega=14)->
    salt = getSalt()
    model = new UsersModel
      login: login.toLowerCase()
      salt: salt
      category: 1
      mega: mega
      password: crypto.createHmac('sha1', salt).update(password.toLowerCase()).digest('hex')
    model.save (err)->
      console.log if !err then ("Successfully created " + login + " record!") else err

  createPromoutermobile = (login, password, mega=14)->
    salt = getSalt()
    model = new UsersModel
      login: login.toLowerCase()
      salt: salt
      category: 1
      mega: mega
      password: crypto.createHmac('sha1', salt).update(password.toLowerCase()).digest('hex')
    model.save (err)->
      console.log if !err then ("Successfully created " + login + " record!") else err

  # admin
  admin_salt = getSalt()
  expert_salt = getSalt()
  moderator_salt = getSalt()

  UsersModel.remove {}, ()->

    admin = new UsersModel
      login: 'admin'
      salt: admin_salt
      password: crypto.createHmac('sha1', admin_salt).update('as210100').digest('hex')
      category: 2
    admin.save (err)->
      console.log if !err then "Successfully created admin record!" else "Something went wrong!"

    expert = new UsersModel
      login: 'expert'
      salt: expert_salt
      password: crypto.createHmac('sha1', expert_salt).update('as210100').digest('hex')
      category: 3
    expert.save (err)->
      console.log if !err then "Successfully created expert record!" else "Something went wrong!"

    OLGA1 = new UsersModel
      login: 'OLGA1'.toLowerCase()
      salt: expert_salt
      password: crypto.createHmac('sha1', expert_salt).update('PAkPmm'.toLowerCase()).digest('hex')
      category: 3
    OLGA1.save (err)->
      console.log if !err then "Successfully created expert record!" else "Something went wrong!"

    OLGA2 = new UsersModel
      login: 'OLGA2'.toLowerCase()
      salt: expert_salt
      password: crypto.createHmac('sha1', expert_salt).update('2YA7eQ'.toLowerCase()).digest('hex')
      category: 3
    OLGA2.save (err)->
      console.log if !err then "Successfully created expert record!" else "Something went wrong!"

    KATYA1 = new UsersModel
      login: 'KATYA1'.toLowerCase()
      salt: expert_salt
      password: crypto.createHmac('sha1', expert_salt).update('LWcFbd'.toLowerCase()).digest('hex')
      category: 3
    KATYA1.save (err)->
      console.log if !err then "Successfully created expert record!" else "Something went wrong!"

    moderator = new UsersModel
      login: 'MODERATOR1'.toLowerCase()
      salt: moderator_salt
      password: crypto.createHmac('sha1', moderator_salt).update('Y53pAP'.toLowerCase()).digest('hex')
      category: 4
    moderator.save (err)->
      console.log if !err then "Successfully created moderator record!" else "Something went wrong!"

    createPromouter "MEGA_TS", "99T47AEC", 0
    createPromouter "MEGA_BD", "4L3P4FR9", 1
    createPromouter "MEGA_KH", "39RF7WA3", 2
    createPromouter "MEGA_DY", "X7C43E4K", 3
    createPromouter "MEGA_PA", "WJ4999TU", 4
    createPromouter "MEGA_AD", "4HLC39A3", 5
    createPromouter "MEGA_EK", "JDS345DS", 6
    createPromouter "MEGA_KA", "77AW93MY", 7
    createPromouter "MEGA_NN", "499WF3AN", 8
    createPromouter "MEGA_NO", "LTH949X4", 9
    createPromouter "MEGA_OM", "479WUAF9", 10
    createPromouter "MEGA_RO", "M94NR7M9", 11
    createPromouter "MEGA_SA", "CNA797E9", 12
    createPromouter "MEGA_UF", "J44M4C3M", 13



    createPromoutermobile "MOBILE_TS", "9J3USD46", 0
    createPromoutermobile "MOBILE_BD", "GKSDG43G", 1
    createPromoutermobile "MOBILE_KH", "DSG43SD3", 2
    createPromoutermobile "MOBILE_DY", "GHDSA63G", 3
    createPromoutermobile "MOBILE_PA", "ZH32J45F", 4
    createPromoutermobile "MOBILE_EK", "DFS54HF5", 6
    createPromoutermobile "MOBILE_OM", "8FASJF9F", 10
    createPromoutermobile "MOBILE_RO", "GDS5SGSF", 11
    createPromoutermobile "MOBILE_SA", "SDF364SG", 12
    createPromoutermobile "MOBILE_UF", "4H5J3J35", 13


    console.log "ok"

     
     
     

     
     
     
     
     
     
     