mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2310023485862, phone: '+79501979111', mega: 'mega_ek'}
  {card: 2310023485870, phone: '+79222179012', mega: 'mega_ek'}
  {card: 2310023487462, phone: '+79122778909', mega: 'mega_ek'}
  {card: 2310023487454, phone: '+79090036160', mega: 'mega_ek'}
  {card: 2310023487447, phone: '+79086347601', mega: 'mega_ek'}
  {card: 2310023487439, phone: '+79049862652', mega: 'mega_ek'}
  {card: 2310023487405, phone: '+79220368155', mega: 'mega_ek'}
  {card: 2310023487413, phone: '+79122744791', mega: 'mega_ek'}
  {card: 2310023487397, phone: '+79193744284', mega: 'mega_ek'}
  {card: 2310023487389, phone: '+79222013754', mega: 'mega_ek'}
  {card: 2310023487504, phone: '+79086339717', mega: 'mega_ek'}
  {card: 2310023487371, phone: '+79226152102', mega: 'mega_ek'}
  {card: 2310023487363, phone: '+79920137232', mega: 'mega_ek'}
  {card: 2310023487348, phone: '+79226070466', mega: 'mega_ek'}
  {card: 2310023487330, phone: '+79002077811', mega: 'mega_ek'}
  {card: 2310023487314, phone: '+79126068648', mega: 'mega_ek'}
  {card: 2310023487306, phone: '+79122809648', mega: 'mega_ek'}
  {card: 2310023487298, phone: '+79222963863', mega: 'mega_ek'}
  {card: 2310023487280, phone: '+79226063137', mega: 'mega_ek'}
  {card: 2310023487256, phone: '+79126896714', mega: 'mega_ek'}
  {card: 2310023487249, phone: '+79122555840', mega: 'mega_ek'}
  {card: 2310023487231, phone: '+79022530567', mega: 'mega_ek'}
  {card: 2310023487546, phone: '+79068032562', mega: 'mega_ek'}
  {card: 2310023487215, phone: '+79222153217', mega: 'mega_ek'}
  {card: 2310023487207, phone: '+79530413133', mega: 'mega_ek'}
  {card: 2310023487553, phone: '+79826533903', mega: 'mega_ek'}
  {card: 2310023487181, phone: '+79122403983', mega: 'mega_ek'}
  {card: 2310023487173, phone: '+79049843820', mega: 'mega_ek'}
  {card: 2310023487157, phone: '+79022754077', mega: 'mega_ek'}
  {card: 2310023487140, phone: '+79678579543', mega: 'mega_ek'}
  {card: 2310023487132, phone: '+79221187190', mega: 'mega_ek'}
  {card: 2310023487124, phone: '+79041641261', mega: 'mega_ek'}
  {card: 2310023487108, phone: '+79221258256', mega: 'mega_ek'}
  {card: 2310023487090, phone: '+79126374386', mega: 'mega_ek'}
  {card: 2310023487066, phone: '+79530403759', mega: 'mega_ek'}
  {card: 2310023487058, phone: '+79638563179', mega: 'mega_ek'}
  {card: 2310023487025, phone: '+79089043909', mega: 'mega_ek'}
  {card: 2310023487017, phone: '+79049814984', mega: 'mega_ek'}
  {card: 2310023487009, phone: '+79221258256', mega: 'mega_ek'}
  {card: 2310023486985, phone: '+79126374389', mega: 'mega_ek'}
  {card: 2310023487579, phone: '+79022605497', mega: 'mega_ek'}
  {card: 2310023487587, phone: '+79022738194', mega: 'mega_ek'}
  {card: 2310023486969, phone: '+79826922608', mega: 'mega_ek'}
  {card: 2310023486944, phone: '+79028724197', mega: 'mega_ek'}
  {card: 2310023486910, phone: '+79090229229', mega: 'mega_ek'}
  {card: 2310023486894, phone: '+79632719094', mega: 'mega_ek'}
  {card: 2310023486886, phone: '+79058062546', mega: 'mega_ek'}
  {card: 2310023486878, phone: '+79222078177', mega: 'mega_ek'}
  {card: 2310023486860, phone: '+79122847657', mega: 'mega_ek'}
  {card: 2310023486852, phone: '+79126346808', mega: 'mega_ek'}
  {card: 2310023486837, phone: '+79090229228', mega: 'mega_ek'}
  {card: 2310023486811, phone: '+79502089129', mega: 'mega_ek'}
  {card: 2310023486795, phone: '+79501940844', mega: 'mega_ek'}
  {card: 2310023486787, phone: '+79521417352', mega: 'mega_ek'}
  {card: 2310023486761, phone: '+79022598026', mega: 'mega_ek'}
  {card: 2310023486753, phone: '+79122046045', mega: 'mega_ek'}
  {card: 2310023486738, phone: '+79122823974', mega: 'mega_ek'}
  {card: 2310023486720, phone: '+79126995960', mega: 'mega_ek'}
  {card: 2310023486712, phone: '+79090197291', mega: 'mega_ek'}
  {card: 2310023486696, phone: '+79126158508', mega: 'mega_ek'}
  {card: 2310023487603, phone: '+79122820447', mega: 'mega_ek'}
  {card: 2310023487629, phone: '+79126391633', mega: 'mega_ek'}
  {card: 2310023486142, phone: '+79502086593', mega: 'mega_ek'}
  {card: 2310023486118, phone: '+79089237759', mega: 'mega_ek'}
  {card: 2310023486100, phone: '+79221691973', mega: 'mega_ek'}
  {card: 2310023486092, phone: '+79041746189', mega: 'mega_ek'}
  {card: 2310023486068, phone: '+79220289630', mega: 'mega_ek'}
  {card: 2310023486076, phone: '+79826121240', mega: 'mega_ek'}
  {card: 2310023486050, phone: '+79126336259', mega: 'mega_ek'}
  {card: 2310023486035, phone: '+79122223489', mega: 'mega_ek'}
  {card: 2310023485995, phone: '+79126122410', mega: 'mega_ek'}
  {card: 2310023486001, phone: '+79193677244', mega: 'mega_ek'}
  {card: 2310023485979, phone: '+79049871734', mega: 'mega_ek'}
  {card: 2310023485961, phone: '+79527399145', mega: 'mega_ek'}
  {card: 2310023485946, phone: '+79638504882', mega: 'mega_ek'}
  {card: 2310023485938, phone: '+79086302937', mega: 'mega_ek'}
  {card: 2310023485912, phone: '+79222034605', mega: 'mega_ek'}
  {card: 2310023485896, phone: '+79122197993', mega: 'mega_ek'}
  {card: 2310023487645, phone: '+79502033050', mega: 'mega_ek'}
  {card: 2310023487637, phone: '+79043836657', mega: 'mega_ek'}
  {card: 2310023486423, phone: '+79630481835', mega: 'mega_ek'}
  {card: 2310023487710, phone: '+79221683355', mega: 'mega_ek'}
  {card: 2310023487702, phone: '+79089272088', mega: 'mega_ek'}
  {card: 2310023487736, phone: '+79000421310', mega: 'mega_ek'}
  {card: 2310023487744, phone: '+79126463485', mega: 'mega_ek'}
  {card: 2310023487801, phone: '+79126162038', mega: 'mega_ek'}
  {card: 2310023486381, phone: '+79126833735', mega: 'mega_ek'}
  {card: 2310023487769, phone: '+79827259336', mega: 'mega_ek'}
  {card: 2310023487785, phone: '+79068093583', mega: 'mega_ek'}
  {card: 2310023487678, phone: '+79122436095', mega: 'mega_ek'}
  {card: 2310023487694, phone: '+79221952530', mega: 'mega_ek'}
  {card: 2310023487819, phone: '+79045479299', mega: 'mega_ek'}
  {card: 2310023487827, phone: '+79086355145', mega: 'mega_ek'}
  {card: 2310023487835, phone: '+79126517017', mega: 'mega_ek'}
  {card: 2310023487850, phone: '+79221018084', mega: 'mega_ek'}
  {card: 2310023487876, phone: '+79122351951', mega: 'mega_ek'}
  {card: 2310023487884, phone: '+79501965320', mega: 'mega_ek'}
  {card: 2310023487900, phone: '+79501965320', mega: 'mega_ek'}
  {card: 2310023487926, phone: '+79089077794', mega: 'mega_ek'}
  {card: 2310023487942, phone: '+79126968285', mega: 'mega_ek'}
  {card: 2310023487959, phone: '+79827015518', mega: 'mega_ek'}
  {card: 2310023486605, phone: '+79221527565', mega: 'mega_ek'}
  {card: 2310023486597, phone: '+79089208810', mega: 'mega_ek'}
  {card: 2310023486621, phone: '+79995598911', mega: 'mega_ek'}
  {card: 2310023486472, phone: '+79122306700', mega: 'mega_ek'}
  {card: 2310023543603, phone: '+79090014255', mega: 'mega_ek'}
  {card: 2310023543637, phone: '+79120488614', mega: 'mega_ek'}
  {card: 2310023543629, phone: '+79226056422', mega: 'mega_ek'}
  {card: 2310023543645, phone: '+79120333273', mega: 'mega_ek'}
  {card: 2310023543660, phone: '+79126160918', mega: 'mega_ek'}
  {card: 2310023543678, phone: '+79049838871', mega: 'mega_ek'}
  {card: 2310023543694, phone: '+79049838872', mega: 'mega_ek'}
  {card: 2310023543728, phone: '+79638507703', mega: 'mega_ek'}
  {card: 2310023542744, phone: '+79226190061', mega: 'mega_ek'}
  {card: 2310023543769, phone: '+79221415360', mega: 'mega_ek'}
  {card: 2310023543777, phone: '+79655288267', mega: 'mega_ek'}
  {card: 2310023543793, phone: '+79193740852', mega: 'mega_ek'}
  {card: 2310023543827, phone: '+79122779542', mega: 'mega_ek'}
  {card: 2310023543843, phone: '+79089250357', mega: 'mega_ek'}
  {card: 2310023543850, phone: '+79827207001', mega: 'mega_ek'}
  {card: 2310023543884, phone: '+79122600310', mega: 'mega_ek'}
  {card: 2310023543892, phone: '+79122134640', mega: 'mega_ek'}
  {card: 2310023543918, phone: '+79655013399', mega: 'mega_ek'}
  {card: 2310023543926, phone: '+79120320571', mega: 'mega_ek'}
  {card: 2310023543934, phone: '+79043849629', mega: 'mega_ek'}
  {card: 2310023543959, phone: '+79043868238', mega: 'mega_ek'}
  {card: 2310023543975, phone: '+79049834496', mega: 'mega_ek'}
  {card: 2310023544031, phone: '+79126747787', mega: 'mega_ek'}
  {card: 2310023543991, phone: '+79221005868', mega: 'mega_ek'}
  {card: 2310023544007, phone: '+79505600704', mega: 'mega_ek'}
  {card: 2310023544015, phone: '+79527323993', mega: 'mega_ek'}
  {card: 2310023544049, phone: '+79090101920', mega: 'mega_ek'}
  {card: 2310023544064, phone: '+79041799762', mega: 'mega_ek'}
  {card: 2310023543538, phone: '+79193900440', mega: 'mega_ek'}
  {card: 2310023487488, phone: '+79501979111', mega: 'mega_ek'}
  {card: 2310023487470, phone: '+79122778909', mega: 'mega_ek'}
  {card: 2310023487421, phone: '+79220368155', mega: 'mega_ek'}
  {card: 2310023487496, phone: '+79193744284', mega: 'mega_ek'}
  {card: 2310023487538, phone: '+79222013754', mega: 'mega_ek'}
  {card: 2310023487512, phone: '+79086339717', mega: 'mega_ek'}
  {card: 2310023487520, phone: '+79226152102', mega: 'mega_ek'}
  {card: 2310023487355, phone: '+79226070466', mega: 'mega_ek'}
  {card: 2310023487322, phone: '+79126068648', mega: 'mega_ek'}
  {card: 2310023487272, phone: '+79226063137', mega: 'mega_ek'}
  {card: 2310023487264, phone: '+79126896714', mega: 'mega_ek'}
  {card: 2310023487223, phone: '+79222153217', mega: 'mega_ek'}
  {card: 2310023487561, phone: '+79826533903', mega: 'mega_ek'}
  {card: 2310023487199, phone: '+79122403983', mega: 'mega_ek'}
  {card: 2310023487165, phone: '+79022754077', mega: 'mega_ek'}
  {card: 2310023487116, phone: '+79221258256', mega: 'mega_ek'}
  {card: 2310023487082, phone: '+79126374386', mega: 'mega_ek'}
  {card: 2310023487-74, phone: '+79530403759', mega: 'mega_ek'}
  {card: 2310023487041, phone: '+79638563179', mega: 'mega_ek'}
  {card: 2310023487033, phone: '+79089043909', mega: 'mega_ek'}
  {card: 2310023486993, phone: '+79221258256', mega: 'mega_ek'}
  {card: 2310023486977, phone: '+79022605497', mega: 'mega_ek'}
  {card: 2310023487595, phone: '+79022738194', mega: 'mega_ek'}
  {card: 2310023486951, phone: '+79826922608', mega: 'mega_ek'}
  {card: 2310023486936, phone: '+79028724197', mega: 'mega_ek'}
  {card: 2310023486928, phone: '+79090229229', mega: 'mega_ek'}
  {card: 2310023486902, phone: '+79632719094', mega: 'mega_ek'}
  {card: 2310023486845, phone: '+79126346808', mega: 'mega_ek'}
  {card: 2310023486829, phone: '+79502089129', mega: 'mega_ek'}
  {card: 2310023486803, phone: '+79501940844', mega: 'mega_ek'}
  {card: 2310023486779, phone: '+79521417352', mega: 'mega_ek'}
  {card: 2310023486746, phone: '+79122046045', mega: 'mega_ek'}
  {card: 2310023486704, phone: '+79090197291', mega: 'mega_ek'}
  {card: 2310023487611, phone: '+79122820447', mega: 'mega_ek'}
  {card: 2310023486134, phone: '+79502086593', mega: 'mega_ek'}
  {card: 2310023486126, phone: '+79089237759', mega: 'mega_ek'}
  {card: 2310023486084, phone: '+79041746189', mega: 'mega_ek'}
  {card: 2310023486043, phone: '+79126336259', mega: 'mega_ek'}
  {card: 2310023486027, phone: '+79122223489', mega: 'mega_ek'}
  {card: 2310023486019, phone: '+79126122410', mega: 'mega_ek'}
  {card: 2310023485987, phone: '+79193677244', mega: 'mega_ek'}
  {card: 2310023485953, phone: '+79527399145', mega: 'mega_ek'}
  {card: 2310023485920, phone: '+79086302937', mega: 'mega_ek'}
  {card: 2310023485904, phone: '+79122197993', mega: 'mega_ek'}
  {card: 2310023487652, phone: '+79502033050', mega: 'mega_ek'}
  {card: 2310023487660, phone: '+79043836657', mega: 'mega_ek'}
  {card: 2310023486415, phone: '+79630481835', mega: 'mega_ek'}
  {card: 2310023487728, phone: '+79000421310', mega: 'mega_ek'}
  {card: 2310023487751, phone: '+79126463485', mega: 'mega_ek'}
  {card: 2310023487777, phone: '+79827259336', mega: 'mega_ek'}
  {card: 2310023487843, phone: '+79126517017', mega: 'mega_ek'}
  {card: 2310023487868, phone: '+79122351951', mega: 'mega_ek'}
  {card: 2310023487892, phone: '+79501965320', mega: 'mega_ek'}
  {card: 2310023487918, phone: '+79501965320', mega: 'mega_ek'}
  {card: 2310023487934, phone: '+79089077794', mega: 'mega_ek'}
  {card: 2310023487967, phone: '+79827015518', mega: 'mega_ek'}
  {card: 2310023486613, phone: '+79995598911', mega: 'mega_ek'}
  {card: 2310023543611, phone: '+79090014255', mega: 'mega_ek'}
  {card: 2310023543652, phone: '+79120333273', mega: 'mega_ek'}
  {card: 2310023543686, phone: '+79049838871', mega: 'mega_ek'}
  {card: 2310023543702, phone: '+79049838872', mega: 'mega_ek'}
  {card: 2310023543710, phone: '+79638507703', mega: 'mega_ek'}
  {card: 2310023543736, phone: '+79226190061', mega: 'mega_ek'}
  {card: 2310023543751, phone: '+79221415360', mega: 'mega_ek'}
  {card: 2310023543785, phone: '+79655288267', mega: 'mega_ek'}
  {card: 2310023543801, phone: '+79193740852', mega: 'mega_ek'}
  {card: 2310023454381, phone: '+79122779542', mega: 'mega_ek'}
  {card: 2310023543835, phone: '+79089250357', mega: 'mega_ek'}
  {card: 2310023543868, phone: '+79827207001', mega: 'mega_ek'}
  {card: 2310023543876, phone: '+79122600310', mega: 'mega_ek'}
  {card: 2310023543900, phone: '+79655013399', mega: 'mega_ek'}
  {card: 2310023543942, phone: '+79043849629', mega: 'mega_ek'}
  {card: 2310023543967, phone: '+79043868238', mega: 'mega_ek'}
  {card: 2310023543983, phone: '+79126747787', mega: 'mega_ek'}
  {card: 2310023544023, phone: '+79527323993', mega: 'mega_ek'}
  {card: 2310023544056, phone: '+79090101920', mega: 'mega_ek'}
  {card: 2310023543520, phone: '+79193900440', mega: 'mega_ek'}
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