mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {lname: 'Столярова Полина  ', fname: 'Теплый Стан',  phone: '+79035117202', weight: 6.07, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Кириченко татьяна ', fname: 'Теплый Стан',  phone: '+79261143801', weight: 5.072, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Афанасьева Галина', fname: 'Теплый Стан',  phone: '+79165764552', weight: 5.075, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Афанасьев Алексей ', fname: 'Теплый Стан',  phone: '+79663182032', weight: 5.095, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Коринфская Наталя ', fname: 'Теплый Стан',  phone: '+79684201436', weight: 4.28, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Аминова Саглара ', fname: 'Теплый Стан',  phone: '+79250453651', weight: 5, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Аминов Джотар ', fname: 'Теплый Стан',  phone: '+79266797243', weight: 1.785, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Ёлкина Надежда', fname: 'Теплый Стан',  phone: '+79259993788', weight: 5.21, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Иванова Валерия', fname: 'Теплый Стан',  phone: '+79647099417', weight: 5.06, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Иванова Нонна', fname: 'Теплый Стан',  phone: '+79164115537', weight: 5, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Исьаева Екатерина', fname: 'Теплый Стан',  phone: '+79067354279', weight: 5.45, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Шинкарюк Андрей', fname: 'Теплый Стан',  phone: '+79166524002', weight: 5.105, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Шинкарюк Ольга', fname: 'Теплый Стан',  phone: '+79165836067', weight: 5.7, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Кулишова Светлана', fname: 'Теплый Стан',  phone: '+79163505783', weight: 4.67, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Абрамов Кирилл', fname: 'Теплый Стан',  phone: '+79265539885', weight: 2.39, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Румянцева Елена', fname: 'Теплый Стан',  phone: '+79032430648', weight: 5.025, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Румянцева Мария', fname: 'Теплый Стан',  phone: '+79643221534', weight: 6.03, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Бабий Юлянна', fname: 'Теплый Стан',  phone: '+79857875327', weight: 5.145, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Рухнина Мария', fname: 'Теплый Стан',  phone: '+79035142934', weight: 2.32, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Кривова Тамара', fname: 'Теплый Стан',  phone: '+79857715623', weight: 3.05, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Апимова Наталия', fname: 'Теплый Стан',  phone: '+79168523232', weight: 5.055, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Апимова Людмила', fname: 'Теплый Стан',  phone: '+79165002657', weight: 5.16, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Кузнецова Людмила', fname: 'Теплый Стан',  phone: '+79858520746', weight: 6.085, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Векикурчева Светлана', fname: 'Теплый Стан',  phone: '+79261781629', weight: 10.82, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Ботинцева Елена', fname: 'Теплый Стан',  phone: '+79852693911', weight: 5.39, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Чайка Светлана', fname: 'Теплый Стан',  phone: '+79262260657', weight: 6, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Шука Полина', fname: 'Теплый Стан',  phone: '+79152431601', weight: 5.06, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Шука Иван', fname: 'Теплый Стан',  phone: '+79262229144', weight: 4.85, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Соросина Галина', fname: 'Теплый Стан',  phone: '+79663590778', weight: 4.26, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Хоромаев Гиргорий', fname: 'Теплый Стан',  phone: '+79037641234', weight: 5.135, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Каминева Людмила', fname: 'Теплый Стан',  phone: '+79037228616', weight: 5, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Каминев Виталий', fname: 'Теплый Стан',  phone: '+79636142104', weight: 5.18, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Ярыгина Нина', fname: 'Теплый Стан',  phone: '+79856009101', weight: 5.06, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Ярыгина Наталия', fname: 'Теплый Стан',  phone: '+79067580194', weight: 5.07, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Ганьшина Анастасия', fname: 'Теплый Стан',  phone: '+79057170116', weight: 5.285, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Данилова Кира', fname: 'Теплый Стан',  phone: '+79253242510', weight: 5.03, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Ревковская Анна', fname: 'Теплый Стан',  phone: '+79150010042', weight: 4.07, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Аксёнова Наталия', fname: 'Теплый Стан',  phone: '+79160049278', weight: 5, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Илюшина Евгения', fname: 'Теплый Стан',  phone: '+79104302752', weight: 5.06, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Жипин Сергей', fname: 'Теплый Стан',  phone: '+79162413768', weight: 5.015, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Япочнина Полина', fname: 'Теплый Стан',  phone: '+79169184964', weight: 5.155, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Василенко Игорь', fname: 'Теплый Стан',  phone: '+79161683774', weight: 5.165, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Соколов Алексей', fname: 'Теплый Стан',  phone: '+79265662502', weight: 5.185, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Туренко Василий', fname: 'Теплый Стан',  phone: '+79265209262', weight: 2.66, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Тониевский Борись', fname: 'Теплый Стан',  phone: '+79269078877', weight: 4.335, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Шардына Даря', fname: 'Теплый Стан',  phone: '+79067421417', weight: 4.215, created_at: '26.03.2016', mega: 'mega_ts'}
  {lname: 'Новикова Татьяна', fname: 'Теплый Стан',  phone: '+79166942203', weight: 5.2, created_at: '26.03.2016', mega: 'mega_ts'}
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
      when mega_login is "mega_ts" then 6
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