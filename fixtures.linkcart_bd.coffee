mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2310025241842, phone: '+79265648448', mega: 'mega_bd'}
  {card: 2310025241867, phone: '+79672750850', mega: 'mega_bd'}
  {card: 2310025241883, phone: '+79686354004', mega: 'mega_bd'}
  {card: 2310025241909, phone: '+79036116384', mega: 'mega_bd'}
  {card: 2310025241925, phone: '+79161996409', mega: 'mega_bd'}
  {card: 2310025241941, phone: '+79647188964', mega: 'mega_bd'}
  {card: 2310025241958, phone: '+79688686452', mega: 'mega_bd'}
  {card: 2310025241982, phone: '+79636946620', mega: 'mega_bd'}
  {card: 2310025241990, phone: '+79067155185', mega: 'mega_bd'}
  {card: 2310025242014, phone: '+79057781681', mega: 'mega_bd'}
  {card: 2310025241354, phone: '+79162503598', mega: 'mega_bd'}
  {card: 2310025241370, phone: '+79857244073', mega: 'mega_bd'}
  {card: 2310025241388, phone: '+79162983559', mega: 'mega_bd'}
  {card: 2310025241404, phone: '+79263459015', mega: 'mega_bd'}
  {card: 2310025241412, phone: '+79645310459', mega: 'mega_bd'}
  {card: 2310025241438, phone: '+79261915709', mega: 'mega_bd'}
  {card: 2310025241453, phone: '+79057645777', mega: 'mega_bd'}
  {card: 2310025241479, phone: '+79260515186', mega: 'mega_bd'}
  {card: 2310025241487, phone: '+79099477810', mega: 'mega_bd'}
  {card: 2310025241503, phone: '+79660804191', mega: 'mega_bd'}
  {card: 2310025241529, phone: '+79652999055', mega: 'mega_bd'}
  {card: 2310025241545, phone: '+79099747617', mega: 'mega_bd'}
  {card: 2310025241560, phone: '+79258506365', mega: 'mega_bd'}
  {card: 2310025241586, phone: '+79261254520', mega: 'mega_bd'}
  {card: 2310025241602, phone: '+79166872144', mega: 'mega_bd'}
  {card: 2310025241610, phone: '+79661071151', mega: 'mega_bd'}
  {card: 2310025241636, phone: '+79250325381', mega: 'mega_bd'}
  {card: 2310025241651, phone: '+79067252585', mega: 'mega_bd'}
  {card: 2310025240836, phone: '+79039622769', mega: 'mega_bd'}
  {card: 2310025240141, phone: '+79772981093', mega: 'mega_bd'}
  {card: 2310025240810, phone: '+79250728199', mega: 'mega_bd'}
  {card: 2310025240828, phone: '+79265179216', mega: 'mega_bd'}
  {card: 2310025240315, phone: '+79654213649', mega: 'mega_bd'}
  {card: 2310025240109, phone: '+79150084991', mega: 'mega_bd'}
  {card: 2310025240299, phone: '+79654213643', mega: 'mega_bd'}
  {card: 2310025240083, phone: '+79164959625', mega: 'mega_bd'}
  {card: 2310025240067, phone: '+79166814253', mega: 'mega_bd'}
  {card: 2310025240273, phone: '+79261611847', mega: 'mega_bd'}
  {card: 2310025240257, phone: '+79032277251', mega: 'mega_bd'}
  {card: 2310025240240, phone: '+79636763766', mega: 'mega_bd'}
  {card: 2310025240216, phone: '+79031320351', mega: 'mega_bd'}
  {card: 2310025240208, phone: '+79998324649', mega: 'mega_bd'}
  {card: 2310025240190, phone: '+79296342623', mega: 'mega_bd'}
  {card: 2310025240166, phone: '+79262734062', mega: 'mega_bd'}
  {card: 2310025240174, phone: '+79699419071', mega: 'mega_bd'}
  {card: 2310025240885, phone: '+79099420717', mega: 'mega_bd'}
  {card: 2310025240059, phone: '+79100191069', mega: 'mega_bd'}
  {card: 2310025240851, phone: '+79039622769', mega: 'mega_bd'}
  {card: 2310025240869, phone: '+79039622769', mega: 'mega_bd'}
  {card: 2310025241859, phone: '+79265648448', mega: 'mega_bd'}
  {card: 2310025241875, phone: '+79672750850', mega: 'mega_bd'}
  {card: 2310025241891, phone: '+79686354004', mega: 'mega_bd'}
  {card: 2310025241917, phone: '+79036116384', mega: 'mega_bd'}
  {card: 2310025241933, phone: '+79647188964', mega: 'mega_bd'}
  {card: 2310025241966, phone: '+79688686452', mega: 'mega_bd'}
  {card: 2310025241974, phone: '+79636946620', mega: 'mega_bd'}
  {card: 2310025242006, phone: '+79067155185', mega: 'mega_bd'}
  {card: 2310025241347, phone: '+79057781681', mega: 'mega_bd'}
  {card: 2310025241362, phone: '+79162503598', mega: 'mega_bd'}
  {card: 2310025241396, phone: '+79162983559', mega: 'mega_bd'}
  {card: 2310025241420, phone: '+79645310459', mega: 'mega_bd'}
  {card: 2310025241446, phone: '+79261915709', mega: 'mega_bd'}
  {card: 2310025241461, phone: '+79057645777', mega: 'mega_bd'}
  {card: 2310025241495, phone: '+79099477810', mega: 'mega_bd'}
  {card: 2310025241511, phone: '+79660804191', mega: 'mega_bd'}
  {card: 2310025241537, phone: '+79652999055', mega: 'mega_bd'}
  {card: 2310025241552, phone: '+79099747617', mega: 'mega_bd'}
  {card: 2310025241578, phone: '+79258506365', mega: 'mega_bd'}
  {card: 2310025241594, phone: '+79261254520', mega: 'mega_bd'}
  {card: 2310025241628, phone: '+79661071151', mega: 'mega_bd'}
  {card: 2310025241644, phone: '+79250325381', mega: 'mega_bd'}
  {card: 2310025240158, phone: '+79067252585', mega: 'mega_bd'}
  {card: 2310025240844, phone: '+79039622769', mega: 'mega_bd'}
  {card: 2310025240133, phone: '+79772981093', mega: 'mega_bd'}
  {card: 2310025240125, phone: '+79265179216', mega: 'mega_bd'}
  {card: 2310025240117, phone: '+79654213649', mega: 'mega_bd'}
  {card: 2310025240091, phone: '+79150084991', mega: 'mega_bd'}
  {card: 2310025240307, phone: '+79654213643', mega: 'mega_bd'}
  {card: 2310025240075, phone: '+79164959625', mega: 'mega_bd'}
  {card: 2310025240281, phone: '+79261611847', mega: 'mega_bd'}
  {card: 2310025240265, phone: '+79032277251', mega: 'mega_bd'}
  {card: 2310025240232, phone: '+79636763766', mega: 'mega_bd'}
  {card: 2310025240224, phone: '+79031320351', mega: 'mega_bd'}
  {card: 2310025240182, phone: '+79296342623', mega: 'mega_bd'}
  {card: 2310025240877, phone: '+79699419071', mega: 'mega_bd'}
  {card: 2310025240042, phone: '+79100191069', mega: 'mega_bd'}
  {card: 2310025240844, phone: '+79039622769', mega: 'mega_bd'}
  {card: 2310025240844, phone: '+79039622769', mega: 'mega_bd'}
]


###{card: , phone: "+7", mega: "mega_om"}###



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