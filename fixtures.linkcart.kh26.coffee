mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2100537370329, phone: '+79060688656', mega: 'mega_kh'}
  {card: 2100578719200, phone: '+79060688656', mega: 'mega_kh'}
  {card: 2100546379214, phone: '+79672214953', mega: 'mega_kh'}
  {card: 2100586360944, phone: '+79096692016', mega: 'mega_kh'}
  {card: 2100575893422, phone: '+79096692016', mega: 'mega_kh'}
  {card: 2100573097082, phone: '+79263212980', mega: 'mega_kh'}
  {card: 2100536217953, phone: '+79263212980', mega: 'mega_kh'}
  {card: 2100558597040, phone: '+79266302497', mega: 'mega_kh'}
  {card: 2100568115074, phone: '+79266302497', mega: 'mega_kh'}
  {card: 2100552676475, phone: '+79262625446', mega: 'mega_kh'}
  {card: 2100571400143, phone: '+79262625446', mega: 'mega_kh'}
  {card: 2100528570448, phone: '+79850005598', mega: 'mega_kh'}
  {card: 2100524098335, phone: '+79163375564', mega: 'mega_kh'}
  {card: 2100585104297, phone: '+79854907753', mega: 'mega_kh'}
  {card: 2100549275759, phone: '+79295918027', mega: 'mega_kh'}
  {card: 2100532230055, phone: '+79295918027', mega: 'mega_kh'}
  {card: 2100542999218, phone: '+79057337285', mega: 'mega_kh'}
  {card: 2100537470999, phone: '+79057337285', mega: 'mega_kh'}
  {card: 2100597438328, phone: '+79164582548', mega: 'mega_kh'}
  {card: 2100522665966, phone: '+79101606363', mega: 'mega_kh'}
  {card: 2100534634318, phone: '+79101606363', mega: 'mega_kh'}
  {card: 2100561755444, phone: '+79101641435', mega: 'mega_kh'}
  {card: 2100576455537, phone: '+79101641435', mega: 'mega_kh'}
  {card: 2100557599793, phone: '+79167996441', mega: 'mega_kh'}
  {card: 2100561464285, phone: '+79167996441', mega: 'mega_kh'}
  {card: 2100592366220, phone: '+79266345858', mega: 'mega_kh'}
  {card: 2100552753701, phone: '+79258895000', mega: 'mega_kh'}
  {card: 2100552785283, phone: '+79161001692', mega: 'mega_kh'}
  {card: 2100523166905, phone: '+79161001692', mega: 'mega_kh'}
  {card: 2100591531629, phone: '+79166409084', mega: 'mega_kh'}
  {card: 2100550899333, phone: '+79166409084', mega: 'mega_kh'}
  {card: 2100534718339, phone: '+79057503630', mega: 'mega_kh'}
  {card: 2100573618621, phone: '+79057503630', mega: 'mega_kh'}
  {card: 2100533435961, phone: '+79257290532', mega: 'mega_kh'}
  {card: 2100541620083, phone: '+79164781555', mega: 'mega_kh'}
  {card: 2100545732331, phone: '+79164781555', mega: 'mega_kh'}
  {card: 2100562653978, phone: '+79269686125', mega: 'mega_kh'}
  {card: 2100534507889, phone: '+79269686125', mega: 'mega_kh'}
  {card: 2100551569280, phone: '+79772670554', mega: 'mega_kh'}
  {card: 2100534366950, phone: '+79852749320', mega: 'mega_kh'}
  {card: 2100533231051, phone: '+79036168318', mega: 'mega_kh'}
  {card: 2100550829828, phone: '+79036168318', mega: 'mega_kh'}
  {card: 2100553558924, phone: '+79163100282', mega: 'mega_kh'}
  {card: 2100563816075, phone: '+79163100282', mega: 'mega_kh'}
  {card: 2100599122485, phone: '+79160892394', mega: 'mega_kh'}
  {card: 2100530902763, phone: '+79160892394', mega: 'mega_kh'}
  {card: 2100599122485, phone: '+79160892394', mega: 'mega_kh'}
  {card: 2100530902763, phone: '+79160892394', mega: 'mega_kh'}
  {card: 2100597976693, phone: '+79858174597', mega: 'mega_kh'}
  {card: 2100579746977, phone: '+79858174597', mega: 'mega_kh'}
  {card: 2100536671779, phone: '+79372557740', mega: 'mega_kh'}
  {card: 2100547225848, phone: '+79372557740', mega: 'mega_kh'}
  {card: 2100598884322, phone: '+79261200639', mega: 'mega_kh'}
  {card: 2100532100280, phone: '+79372557730', mega: 'mega_kh'}
  {card: 2100590659973, phone: '+79372557730', mega: 'mega_kh'}
  {card: 2100575849221, phone: '+79372293600', mega: 'mega_kh'}
  {card: 2100562251648, phone: '+79032784349', mega: 'mega_kh'}
  {card: 2100594836707, phone: '+79032784349', mega: 'mega_kh'}
  {card: 2100547627352, phone: '+79645732251', mega: 'mega_kh'}
  {card: 2100596142219, phone: '+79651281617', mega: 'mega_kh'}
  {card: 2100553006424, phone: '+79651281617', mega: 'mega_kh'}
  {card: 2100566869030, phone: '+79261608696', mega: 'mega_kh'}
  {card: 2100589561560, phone: '+79261608696', mega: 'mega_kh'}
  {card: 2100579653947, phone: '+79629238302', mega: 'mega_kh'}
  {card: 2100530492882, phone: '+79629238302', mega: 'mega_kh'}
  {card: 2100541530979, phone: '+79031872525', mega: 'mega_kh'}
  {card: 2100563250220, phone: '+79167451830', mega: 'mega_kh'}
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