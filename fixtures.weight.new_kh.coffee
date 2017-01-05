mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {lname: 'КАЗАРЯН АНУШ', fname: 'Химки',  phone: '+79150876535', weight: 2.79, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МЯГИШЕВА ОКСАНА', fname: 'Химки',  phone: '+79057820269', weight: 5.78, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'СЕРГЕЕВА ЛАРИСА', fname: 'Химки',  phone: '+79153294836', weight: 4.59, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ШОРОШИН АНАТОЛИЙ', fname: 'Химки',  phone: '+79060688656', weight: 5.15, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ШОРОШИНА ИННА', fname: 'Химки',  phone: '+79672214953', weight: 4.02, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МУРГА РАЗИЯ', fname: 'Химки',  phone: '+79096692016', weight: 5.5, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'АБДУЛАЕВ ГУЛЬКА', fname: 'Химки',  phone: '+79263212980', weight: 5.8, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ОВЧИННИКОВА НАТАЛЬЯ', fname: 'Химки',  phone: '+79266302497', weight: 5.57, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ОВЧИННИКОВ АЛЕКСАНДР', fname: 'Химки',  phone: '+79262625446', weight: 5.71, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'КУЛЕНКО РОМАН', fname: 'Химки',  phone: '+79850005598', weight: 4.87, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'КОМОЛОВА АННА', fname: 'Химки',  phone: '+79163375564', weight: 3.76, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МАЩЕНКО ИРИНА', fname: 'Химки',  phone: '+79854907753', weight: 3.73, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'КРЫЛОВ МИХАИЛ ', fname: 'Химки',  phone: '+79295918027', weight: 5.52, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'АПОНАСОВА ТАТЬЯНА', fname: 'Химки',  phone: '+79057337285', weight: 5.09, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'АЛЕКСЕЕВА СОФИЯ', fname: 'Химки',  phone: '+79164582548', weight: 2.7, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'СУРОВА ИРИНА', fname: 'Химки',  phone: '+79101606363', weight: 5.36, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'СУРОВ ИГОРЬ', fname: 'Химки',  phone: '+79101641435', weight: 5.15, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'СУРОВА АЛЕНА', fname: 'Химки',  phone: '+79167996441', weight: 5.08, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ПАНТУХОВ ГРИГОРИЙ', fname: 'Химки',  phone: '+79266345858', weight: 3.88, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ШУКУРОВ ШАРАФ', fname: 'Химки',  phone: '+79258895000', weight: 4.56, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МОИСЕЕВА НАДЕЖДА', fname: 'Химки',  phone: '+79161001692', weight: 5.04, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МОИСЕЕВ ДМИТРИЙ', fname: 'Химки',  phone: '+79166409084', weight: 5.8, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'САДЫКОВА ЭЛЬМИРА', fname: 'Химки',  phone: '+79057503630', weight: 5.05, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МУСАЕВ ДАМИР', fname: 'Химки',  phone: '+79257290532', weight: 2.5, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МОЛИНА ИРИНА', fname: 'Химки',  phone: '+79164781555', weight: 5.32, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ДВОЙНИКОВ АЛЕКСАНДР', fname: 'Химки',  phone: '+79269686125', weight: 5.38, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ДВОЙНИКОВА ЕЛЕНА', fname: 'Химки',  phone: '+79772670554', weight: 3.06, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'КАТЕРБУЗОВА ИРИНА', fname: 'Химки',  phone: '+79852749320', weight: 3.32, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ГАРИПОВА ИРИНА', fname: 'Химки',  phone: '+79036168318', weight: 5.66, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ГАРИПОВ РУСТЕН', fname: 'Химки',  phone: '+79163100282', weight: 5.37, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МАТВЕЕВА ТАТЬЯНА', fname: 'Химки',  phone: '+79160892394', weight: 5.55, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МИРОНОВА ЛИДИЯ', fname: 'Химки',  phone: '+79858174597', weight: 5.03, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МАКСИМЕНКО ДЕНИС', fname: 'Химки',  phone: '+79372557740', weight: 5.46, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'КУРБОНОВА АЛИНА', fname: 'Химки',  phone: '+79261200639', weight: 3.94, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'МАКСИМЕНКО ЕКАТЕРИНА', fname: 'Химки',  phone: '+79372557730', weight: 3.59, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'БОЙКО ИЛЬЯ', fname: 'Химки',  phone: '+79372293600', weight: 2.65, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ШАРОНОВА ОЛЬГА', fname: 'Химки',  phone: '+79032784349', weight: 5.05, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'ШАРОНОВ НИКОЛАЙ', fname: 'Химки',  phone: '+79645732251', weight: 2.58, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'САФРОНЕНКО ТАТЬЯНА', fname: 'Химки',  phone: '+79651281617', weight: 5.11, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'СТРУЧКОВА ВИКТОРИЯ', fname: 'Химки',  phone: '+79261608696', weight: 5.58, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'СУСЛИНА ЕЛЕНА', fname: 'Химки',  phone: '+79055208812', weight: 2.02, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'СЕРЯПИНА МАРИНА', fname: 'Химки',  phone: '+79629238302', weight: 5.27, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'СЕРЯПИН МАКСИМ', fname: 'Химки',  phone: '+79031872525', weight: 3.85, created_at: '26.03.2016', mega: 'mega_kh'}
  {lname: 'СКРЯБИНА ВЕРА', fname: 'Химки',  phone: '+79167451830', weight: 3.74, created_at: '26.03.2016', mega: 'mega_kh'}
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

  createWeight = (message, record, weight, created_at, mega, cb)->
    _data = 
      weight: weight
      created_at: moment(created_at, "DD.MM.YYYY").format()
      mega: getMega mega
      whos: mega
      owner: record._id

    model = new WeightModel _data
    model.save ()->
      message += "Created weight for record " + record.phone + ": " + weight + "kg "

      today_income = 0
      now = created_at
      for w in record.weight
        w_date = moment(w.created_at).format("DD.MM.YYYY")
        if w_date is now
          today_income += w.weight*100

      message += "Current total income of " + record.phone + " is " + today_income + " "
      
      record.weight.push _data

      record.balance += if today_income >= 500 then 0 else (if (today_income + weight*100) > 500 then 500-today_income else weight*100)
      record.balance = 1500 if record.balance > 1500

      record.save ()->
        message += "User " + record.phone + " saved with new weight " + weight + "kg " 
        cb message

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

  users_iterator = (user, cb)->
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
        cb()

  i = 0
  l = data.length

  sync_function = ()->
    if i<l
      users_iterator data[i], sync_function
      i++

  sync_function()