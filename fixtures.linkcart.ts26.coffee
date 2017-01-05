mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2100506977603, phone: '+79035117202', mega: 'mega_ts'}
  {card: 2100506988753, phone: '+79261143801', mega: 'mega_ts'}
  {card: 2100506922309, phone: '+79165764552', mega: 'mega_ts'}
  {card: 2100506982683, phone: '+79663182032', mega: 'mega_ts'}
  {card: 2100506994525, phone: '+79250453651', mega: 'mega_ts'}
  {card: 2100506996956, phone: '+79259993788', mega: 'mega_ts'}
  {card: 2100506872489, phone: '+79647099417', mega: 'mega_ts'}
  {card: 2100506871079, phone: '+79164115537', mega: 'mega_ts'}
  {card: 2100506869441, phone: '+79067354279', mega: 'mega_ts'}
  {card: 2100506867980, phone: '+79166524002', mega: 'mega_ts'}
  {card: 2100506867782, phone: '+79165836067', mega: 'mega_ts'}
  {card: 2100506861872, phone: '+79032430648', mega: 'mega_ts'}
  {card: 2100506859572, phone: '+79643221534', mega: 'mega_ts'}
  {card: 2100506852399, phone: '+79857875327', mega: 'mega_ts'}
  {card: 2100506849023, phone: '+79168523232', mega: 'mega_ts'}
  {card: 2100506847098, phone: '+79165002657', mega: 'mega_ts'}
  {card: 2100506845100, phone: '+79261781629', mega: 'mega_ts'}
  {card: 2100506843762, phone: '+79852693911', mega: 'mega_ts'}
  {card: 2100506843755, phone: '+79262260657', mega: 'mega_ts'}
  {card: 2100506839352, phone: '+79152431601', mega: 'mega_ts'}
  {card: 2100506835040, phone: '+79037641234', mega: 'mega_ts'}
  {card: 2100506832360, phone: '+79037228616', mega: 'mega_ts'}
  {card: 2100506821852, phone: '+79636142104', mega: 'mega_ts'}
  {card: 2100506818579, phone: '+79856009101', mega: 'mega_ts'}
  {card: 2100506815684, phone: '+79067580194', mega: 'mega_ts'}
  {card: 2100506808655, phone: '+79057170116', mega: 'mega_ts'}
  {card: 2100506808051, phone: '+79253242510', mega: 'mega_ts'}
  {card: 2100506801472, phone: '+79160049278', mega: 'mega_ts'}
  {card: 2100509491045, phone: '+79104302752', mega: 'mega_ts'}
  {card: 2100509494466, phone: '+79162413768', mega: 'mega_ts'}
  {card: 2100509489769, phone: '+79169184964', mega: 'mega_ts'}
  {card: 2100509488991, phone: '+79161683774', mega: 'mega_ts'}
  {card: 2100509488281, phone: '+79265662502', mega: 'mega_ts'}
  {card: 2100509479302, phone: '+79166942203', mega: 'mega_ts'}
  {card: 2100506977122, phone: '+79035117202', mega: 'mega_ts'}
  {card: 2100506987206, phone: '+79261143801', mega: 'mega_ts'}
  {card: 2100506989088, phone: '+79165764552', mega: 'mega_ts'}
  {card: 2100506978495, phone: '+79663182032', mega: 'mega_ts'}
  {card: 2100506993252, phone: '+79684201436', mega: 'mega_ts'}
  {card: 2100506994280, phone: '+79250453651', mega: 'mega_ts'}
  {card: 2100506995232, phone: '+79259993788', mega: 'mega_ts'}
  {card: 2100506873080, phone: '+79647099417', mega: 'mega_ts'}
  {card: 2100506872113, phone: '+79164115537', mega: 'mega_ts'}
  {card: 2100506871062, phone: '+79067354279', mega: 'mega_ts'}
  {card: 2100506867966, phone: '+79166524002', mega: 'mega_ts'}
  {card: 2100506866211, phone: '+79165836067', mega: 'mega_ts'}
  {card: 2100506864545, phone: '+79163505783', mega: 'mega_ts'}
  {card: 2100506861575, phone: '+79032430648', mega: 'mega_ts'}
  {card: 2100506860158, phone: '+79643221534', mega: 'mega_ts'}
  {card: 2100506855284, phone: '+79857875327', mega: 'mega_ts'}
  {card: 2100506849771, phone: '+79857715623', mega: 'mega_ts'}
  {card: 2100506848774, phone: '+79168523232', mega: 'mega_ts'}
  {card: 2100506848019, phone: '+79165002657', mega: 'mega_ts'}
  {card: 2100506845322, phone: '+79858520746', mega: 'mega_ts'}
  {card: 2100506845247, phone: '+79261781629', mega: 'mega_ts'}
  {card: 2100506844011, phone: '+79852693911', mega: 'mega_ts'}
  {card: 2100506842000, phone: '+79262260657', mega: 'mega_ts'}
  {card: 2100506839581, phone: '+79152431601', mega: 'mega_ts'}
  {card: 2100506837754, phone: '+79262229144', mega: 'mega_ts'}
  {card: 2100506837006, phone: '+79663590778', mega: 'mega_ts'}
  {card: 2100506834111, phone: '+79037641234', mega: 'mega_ts'}
  {card: 2100506827212, phone: '+79037228616', mega: 'mega_ts'}
  {card: 2100506822217, phone: '+79636142104', mega: 'mega_ts'}
  {card: 2100506818562, phone: '+79856009101', mega: 'mega_ts'}
  {card: 2100506816278, phone: '+79067580194', mega: 'mega_ts'}
  {card: 2100506810115, phone: '+79057170116', mega: 'mega_ts'}
  {card: 2100506807368, phone: '+79253242510', mega: 'mega_ts'}
  {card: 2100506804459, phone: '+79150010042', mega: 'mega_ts'}
  {card: 2100506803681, phone: '+79160049278', mega: 'mega_ts'}
  {card: 2100509493186, phone: '+79104302752', mega: 'mega_ts'}
  {card: 2100509490383, phone: '+79162413768', mega: 'mega_ts'}
  {card: 2100509490086, phone: '+79169184964', mega: 'mega_ts'}
  {card: 2100509489110, phone: '+79161683774', mega: 'mega_ts'}
  {card: 2100509485631, phone: '+79265662502', mega: 'mega_ts'}
  {card: 2100509483019, phone: '+79265209262', mega: 'mega_ts'}
  {card: 2100509479678, phone: '+79269078877', mega: 'mega_ts'}
  {card: 2100509480988, phone: '+79067421417', mega: 'mega_ts'}
  {card: 2100509477469, phone: '+79166942203', mega: 'mega_ts'}
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