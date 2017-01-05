mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2100531971812, phone: '+79519085878', mega: 'mega_nn'}
  {card: 2100550095223, phone: '+79519085878', mega: 'mega_nn'}
  {card: 2100538243301, phone: '+79524478002', mega: 'mega_nn'}
  {card: 2100593592499, phone: '+79092971152', mega: 'mega_nn'}
  {card: 2100523662360, phone: '+79101054095', mega: 'mega_nn'}
  {card: 2100560126597, phone: '+79101054095', mega: 'mega_nn'}
  {card: 2100528164401, phone: '+79101054094', mega: 'mega_nn'}
  {card: 2100558092255, phone: '+79101054094', mega: 'mega_nn'}
  {card: 2100515004161, phone: '+79063682299', mega: 'mega_nn'}
  {card: 2100581642540, phone: '+79063682299', mega: 'mega_nn'}
  {card: 2100570143966, phone: '+79056641155', mega: 'mega_nn'}
  {card: 2100512411085, phone: '+79056641155', mega: 'mega_nn'}
  {card: 2100536550036, phone: '+79092849277', mega: 'mega_nn'}
  {card: 2100568908805, phone: '+79092849277', mega: 'mega_nn'}
  {card: 210561220812, phone: '+79308169870', mega: 'mega_nn'}
  {card: 2100592532182, phone: '+79308169870', mega: 'mega_nn'}
  {card: 2100593789066, phone: '+79051903000', mega: 'mega_nn'}
  {card: 2100546946119, phone: '+79051903000', mega: 'mega_nn'}
  {card: 2100559287711, phone: '+79202978897', mega: 'mega_nn'}
  {card: 2100513264970, phone: '+79101201922', mega: 'mega_nn'}
  {card: 2100543809950, phone: '+79101201922', mega: 'mega_nn'}
  {card: 2100524668262, phone: '+79101362129', mega: 'mega_nn'}
  {card: 2100579551922, phone: '+79101362129', mega: 'mega_nn'}
  {card: 2100538918971, phone: '+79524433000', mega: 'mega_nn'}
  {card: 2100577255334, phone: '+79524433000', mega: 'mega_nn'}
  {card: 2100578046283, phone: '+79200162233', mega: 'mega_nn'}
  {card: 2100587409833, phone: '+79200162233', mega: 'mega_nn'}
  {card: 2100554463103, phone: '+79200209421', mega: 'mega_nn'}
  {card: 2100556737547, phone: '+79200209421', mega: 'mega_nn'}
  {card: 2100551399719, phone: '+79601858130', mega: 'mega_nn'}
  {card: 2100546350916, phone: '+79601858130', mega: 'mega_nn'}
  {card: 2100595835938, phone: '+79103842010', mega: 'mega_nn'}
  {card: 2100569887543, phone: '+79103842010', mega: 'mega_nn'}
  {card: 2100523973855, phone: '+79051946111', mega: 'mega_nn'}
  {card: 2100549894844, phone: '+79051946111', mega: 'mega_nn'}
  {card: 2100589896945, phone: '+79601612111', mega: 'mega_nn'}
  {card: 2100556495751, phone: '+79601612111', mega: 'mega_nn'}
  {card: 2100554038004, phone: '+79063488157', mega: 'mega_nn'}
  {card: 2100588421292, phone: '+79063488157', mega: 'mega_nn'}
  {card: 2100540150291, phone: '+79051900039', mega: 'mega_nn'}
  {card: 2100593786157, phone: '+79051900039', mega: 'mega_nn'}
  {card: 2100545015663, phone: '+79200299196', mega: 'mega_nn'}
  {card: 2100523538191, phone: '+79200299196', mega: 'mega_nn'}
  {card: 2100564371795, phone: '+79527809628', mega: 'mega_nn'}
  {card: 2100538874277, phone: '+79527809628', mega: 'mega_nn'}
  {card: 2100578811782, phone: '+79081587214', mega: 'mega_nn'}
  {card: 2100550325283, phone: '+79081587214', mega: 'mega_nn'}
  {card: 2100577306692, phone: '+79087338048', mega: 'mega_nn'}
  {card: 2100523859715, phone: '+79087338048', mega: 'mega_nn'}
  {card: 2100557509853, phone: '+79103936066', mega: 'mega_nn'}
  {card: 2100521127793, phone: '+79103936066', mega: 'mega_nn'}
  {card: 2100570015676, phone: '+79527767908', mega: 'mega_nn'}
  {card: 2100573556527, phone: '+79527767908', mega: 'mega_nn'}
  {card: 2100518995213, phone: '+79200091665', mega: 'mega_nn'}
  {card: 2100580714880, phone: '+79200091665', mega: 'mega_nn'}
  {card: 2100584803122, phone: '+79535792251', mega: 'mega_nn'}
  {card: 2100544728571, phone: '+79535792251', mega: 'mega_nn'}
  {card: 2100564537016, phone: '+79200172999', mega: 'mega_nn'}
  {card: 2100516456037, phone: '+79625094645', mega: 'mega_nn'}
  {card: 2100523784741, phone: '+79625094645', mega: 'mega_nn'}
  {card: 2100542994862, phone: '+79040638808', mega: 'mega_nn'}
  {card: 2100576235696, phone: '+79082352555', mega: 'mega_nn'}
  {card: 2100546435453, phone: '+79082352555', mega: 'mega_nn'}
  {card: 2100570730203, phone: '+79081591919', mega: 'mega_nn'}
  {card: 2100577644084, phone: '+79081591919', mega: 'mega_nn'}
  {card: 2100577702531, phone: '+79503793012', mega: 'mega_nn'}
  {card: 2100569488290, phone: '+79063678828', mega: 'mega_nn'}
  {card: 2100514687914, phone: '+79063678828', mega: 'mega_nn'}
  {card: 2100524717977, phone: '+79308087777', mega: 'mega_nn'}
  {card: 2100550049998, phone: '+79308087777', mega: 'mega_nn'}
  {card: 2100594554847, phone: '+79270434903', mega: 'mega_nn'}
  {card: 2100569447341, phone: '+79087341533', mega: 'mega_nn'}
  {card: 2100519971605, phone: '+79506136310', mega: 'mega_nn'}
  {card: 2100516010550, phone: '+79506136310', mega: 'mega_nn'}
  {card: 2100525459623, phone: '+79200301409', mega: 'mega_nn'}
  {card: 2100599525408, phone: '+79200301409', mega: 'mega_nn'}
  {card: 2100542586180, phone: '+79503631214', mega: 'mega_nn'}
  {card: 2100561128347, phone: '+79601808845', mega: 'mega_nn'}
  {card: 2100524777964, phone: '+79601808845', mega: 'mega_nn'}
  {card: 2100597996590, phone: '+79519061998', mega: 'mega_nn'}
  {card: 2100541443682, phone: '+79202995568', mega: 'mega_nn'}
  {card: 2100523924161, phone: '+79601623052', mega: 'mega_nn'}
  {card: 2100553876614, phone: '+79601623052', mega: 'mega_nn'}
  {card: 2100537886783, phone: '+79026853445', mega: 'mega_nn'}
  {card: 2100513240189, phone: '+79026853445', mega: 'mega_nn'}
  {card: 2100534226889, phone: '+79159451489', mega: 'mega_nn'}
  {card: 2100535716730, phone: '+79159451489', mega: 'mega_nn'}
  {card: 2100583927317, phone: '+79103990356', mega: 'mega_nn'}
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