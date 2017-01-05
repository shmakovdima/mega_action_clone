mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2100527855058, phone: "+79087963679", mega: "mega_om"}
  {card: 2100553892546, phone: "+79081196707", mega: "mega_om"}
  {card: 2100583502644, phone: "+79081196707", mega: "mega_om"}
  {card: 2100513493844, phone: "+79507949796", mega: "mega_om"}
  {card: 2100567054602, phone: "+79507949796", mega: "mega_om"}
  {card: 2100582046286, phone: "+79081126326", mega: "mega_om"}
  {card: 2100535604822, phone: "+79081126326", mega: "mega_om"}
  {card: 2100523069497, phone: "+79620367130", mega: "mega_om"}
  {card: 2100581717347, phone: "+79620367130", mega: "mega_om"}
  {card: 2100579703918, phone: "+79087968438", mega: "mega_om"}

  {card: , phone: "+7", mega: "mega_om"}
  {card: , phone: "+7", mega: "mega_om"}
  {card: , phone: "+7", mega: "mega_om"}
  {card: , phone: "+7", mega: "mega_om"}

]

{card: , phone: "+7", mega: "mega_om"}

    
 
Баранова Татьяна  9136117411  2310027842076
Внукова Танзиля 9503374666  2310027843009
    2310027843017
Внуков Станислав    2310027843462
    2310027843470
Грибков Вадим 9514183723  2310027842100
    2310027842092
Грибкова Татьяна  9045856280  2310027842118
    2310027842126
Малкова Софья 9236831441  2310027842134
    2310027841516
Малкова Татьяна 9609872677  2310027841524
    2310027841508
Идрисова Какайра  9514015568  2310027843496
    2310027843488
Коновалов Валерий 9081021849  2310027843421
    2310027843413
Ускова Ирина  9081065612  2310027843447
    2310027843439
Поставский Борис  9131496091  2310027843371
Поставская Маргарита  9131495825  2310027843405
    2310027843397
Коршунова Вероника  9043295705  2310027536470
Сагина Гульнара 9502174085  2310027843512
    2310027843454
Пивазян Геворг  9831124040  2310027843348
    2310027843389
Марухян Аня 9618833238  2310027843330
Ожуг Евгения  9507979821  2310027843686
    2310027843694
Казакова Валентина  9514282088  2310027843660
    2310027843678
Бузина Надежда  9088081104  2310027842068
    2310027842050
Копейкин Сергей 9043224258  2310027841953
    2310027841961
Палецкая Алена  9507919774  2310027841870
    2310027841979
Палецкий Андрей 9507919880  2310027842084

        


# database connection
mongoose.connect(config.db.path + config.db.name)
db = mongoose.connection

db.on 'error', (err)->
  console.log "Error connection to database: ", err
db.once 'open', ()->
  console.log "Connected to db!"

  # Schemas loading
  PreRegisterModel = require('./schemas/preregister.coffee').get mongoose
  CardModel = require('./schemas/cards.coffee').get mongoose
  TransactionsModel = require('./schemas/transactions.coffee').get mongoose

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

  createTransactions = (message, user_id, card_number, sum, whos, cb)->
    model = new TransactionsModel
      owner: user_id
      sum: sum
      card_number: card_number
      mega: getMega whos
      whos: whos
      created_at: new Date()
    model.save (err, m)->
      message += "Successfully created transaction " + user_id + " " + card_number + " record! "
      cb(message, m, model)

  getPreregister = (message, phone, cb)->
    PreRegisterModel.findOne {phone: phone}, (err, pr)->
      if !pr
        console.log message + "User " + phone + " is not found!" + "\n"
      else
        message += "User " + phone + " is found! "
        cb message, pr, pr

  getCard = (message, number, prereg, cb)->
      CardModel.findOne {number: number}, (err, f_card)->
        if !f_card
          console.log message + "Card " + number + " is not found!" + "\n"
        else        
          if f_card.is_active
            message += "Card " + number + " is found and active! "

            real_balance = prereg.balance
            real_balance -= t.sum for t in prereg.transactions  
            if real_balance >= (if f_card.owner > 500 then 500 else 250)
              message += "Balance of user " + prereg.phone + " is enough! Balance before transaction is: " + real_balance + " "
              f_card.is_active = false
              f_card.recipient = prereg._id
              f_card.save ()->
                message += "Card " + number + " is found and not active now! Recipient " + prereg._id + " "
                cb message, f_card, f_card, false
            else
              console.log message + "Balance of user " + prereg.phone + " is not enough! Balance is: " + real_balance + " need " + (if f_card.owner > 500 then 500 else 250) + "\n"
          else
            message += "Card " + number + " is found and not active! "
            cb message, f_card, f_card, true
  users_iterator = (user)->
    phone = user.phone
    card = user.card
    mega = user.mega
    message = ""
    getPreregister message, phone, (message, p, prereg)->
      getCard message, card, prereg, (message, card_data, card_model, was_active)->
        if !was_active
          createTransactions message, prereg._id, card_model.number, (if card_model.owner > 500 then 500 else 250), mega, (message, tr_data)->
            prereg.transactions.push tr_data
            prereg.save (err)->
              console.log message + "Successfully add transaction " + card_model.number + " to " + prereg.fname + " " + prereg.lname + " record!" + "\n"
        else
          console.log message + "Card " + card + " already linked to user " + phone + "\n"

  for user in data
    users_iterator user