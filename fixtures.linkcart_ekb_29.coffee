mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 8231002348586, phone: '+79501979111', mega: 'mega_ek'}
  {card: 8231002348748, phone: '+79501979111', mega: 'mega_ek'}
  {card: 8231002348587, phone: '+79222179012', mega: 'mega_ek'}
  {card: 8231002348588, phone: '+79222179012', mega: 'mega_ek'}
  {card: 8231002348746, phone: '+79122778909', mega: 'mega_ek'}
  {card: 8231002348747, phone: '+79122778909', mega: 'mega_ek'}
  {card: 8231002348745, phone: '+79090036160', mega: 'mega_ek'}
  {card: 8231002348744, phone: '+79086347601', mega: 'mega_ek'}
  {card: 8231002348743, phone: '+79049862652', mega: 'mega_ek'}
  {card: 8231002348740, phone: '+79220368155', mega: 'mega_ek'}
  {card: 8231002348742, phone: '+79220368155', mega: 'mega_ek'}
  {card: 8231002348741, phone: '+79122744791', mega: 'mega_ek'}
  {card: 8231002348739, phone: '+79193744284', mega: 'mega_ek'}
  {card: 8231002348749, phone: '+79193744284', mega: 'mega_ek'}
  {card: 8231002348738, phone: '+79222013754', mega: 'mega_ek'}
  {card: 8231002348753, phone: '+79222013754', mega: 'mega_ek'}
  {card: 8231002348750, phone: '+79086339717', mega: 'mega_ek'}
  {card: 8231002348751, phone: '+79086339717', mega: 'mega_ek'}
  {card: 8231002348737, phone: '+79226152102', mega: 'mega_ek'}
  {card: 8231002348752, phone: '+79226152102', mega: 'mega_ek'}
  {card: 8231002348736, phone: '+79920137232', mega: 'mega_ek'}
  {card: 8231002348734, phone: '+79226070466', mega: 'mega_ek'}
  {card: 8231002348735, phone: '+79226070466', mega: 'mega_ek'}
  {card: 8231002348733, phone: '+79002077811', mega: 'mega_ek'}
  {card: 8231002348731, phone: '+79126068648', mega: 'mega_ek'}
  {card: 8231002348732, phone: '+79126068648', mega: 'mega_ek'}
  {card: 8231002348730, phone: '+79122809648', mega: 'mega_ek'}
  {card: 8231002348729, phone: '+79222963863', mega: 'mega_ek'}
  {card: 8231002348728, phone: '+79226063137', mega: 'mega_ek'}
  {card: 8231002348727, phone: '+79226063137', mega: 'mega_ek'}
  {card: 8231002348725, phone: '+79126896714', mega: 'mega_ek'}
  {card: 8231002348726, phone: '+79126896714', mega: 'mega_ek'}
  {card: 8231002348724, phone: '+79122555840', mega: 'mega_ek'}
  {card: 8231002348723, phone: '+79022530567', mega: 'mega_ek'}
  {card: 8231002348754, phone: '+79068032562', mega: 'mega_ek'}
  {card: 8231002348721, phone: '+79222153217', mega: 'mega_ek'}
  {card: 8231002348722, phone: '+79222153217', mega: 'mega_ek'}
  {card: 8231002348720, phone: '+79530413133', mega: 'mega_ek'}
  {card: 8231002348755, phone: '+79826533903', mega: 'mega_ek'}
  {card: 8231002348756, phone: '+79826533903', mega: 'mega_ek'}
  {card: 8231002348718, phone: '+79122403983', mega: 'mega_ek'}
  {card: 8231002348719, phone: '+79122403983', mega: 'mega_ek'}
  {card: 8231002348717, phone: '+79049843820', mega: 'mega_ek'}
  {card: 8231002348715, phone: '+79022754077', mega: 'mega_ek'}
  {card: 8231002348716, phone: '+79022754077', mega: 'mega_ek'}
  {card: 8231002348714, phone: '+79678579543', mega: 'mega_ek'}
  {card: 8231002348713, phone: '+79221187190', mega: 'mega_ek'}
  {card: 8231002348712, phone: '+79041641261', mega: 'mega_ek'}
  {card: 8231002348710, phone: '+79221258256', mega: 'mega_ek'}
  {card: 8231002348711, phone: '+79221258256', mega: 'mega_ek'}
  {card: 8231002348709, phone: '+79126374386', mega: 'mega_ek'}
  {card: 8231002348706, phone: '+79530403759', mega: 'mega_ek'}
  {card: 8231002348774, phone: '+79530403759', mega: 'mega_ek'}
  {card: 8231002348705, phone: '+79638563179', mega: 'mega_ek'}
  {card: 8231002348704, phone: '+79638563179', mega: 'mega_ek'}
  {card: 8231002348702, phone: '+79089043909', mega: 'mega_ek'}
  {card: 8231002348703, phone: '+79089043909', mega: 'mega_ek'}
  {card: 8231002348701, phone: '+79049814984', mega: 'mega_ek'}
  {card: 8231002348700, phone: '+79221258256', mega: 'mega_ek'}
  {card: 8231002348699, phone: '+79221258256', mega: 'mega_ek'}
  {card: 8231002348698, phone: '+79126374389', mega: 'mega_ek'}
  {card: 8231002348757, phone: '+79022605497', mega: 'mega_ek'}
  {card: 8231002348697, phone: '+79022605497', mega: 'mega_ek'}
  {card: 8231002348758, phone: '+79022738194', mega: 'mega_ek'}
  {card: 8231002348759, phone: '+79022738194', mega: 'mega_ek'}
  {card: 8231002348696, phone: '+79826922608', mega: 'mega_ek'}
  {card: 8231002348695, phone: '+79826922608', mega: 'mega_ek'}
  {card: 8231002348694, phone: '+79028724197', mega: 'mega_ek'}
  {card: 8231002348693, phone: '+79028724197', mega: 'mega_ek'}
  {card: 8231002348691, phone: '+79090229229', mega: 'mega_ek'}
  {card: 8231002348692, phone: '+79090229229', mega: 'mega_ek'}
  {card: 8231002348689, phone: '+79632719094', mega: 'mega_ek'}
  {card: 8231002348690, phone: '+79632719094', mega: 'mega_ek'}
  {card: 8231002348688, phone: '+79058062546', mega: 'mega_ek'}
  {card: 8231002348687, phone: '+79222078177', mega: 'mega_ek'}
  {card: 8231002348686, phone: '+79122847657', mega: 'mega_ek'}
  {card: 8231002348685, phone: '+79126346808', mega: 'mega_ek'}
  {card: 8231002348684, phone: '+79126346808', mega: 'mega_ek'}
  {card: 8231002348683, phone: '+79090229228', mega: 'mega_ek'}
  {card: 8231002348681, phone: '+79502089129', mega: 'mega_ek'}
  {card: 8231002348679, phone: '+79501940844', mega: 'mega_ek'}
  {card: 8231002348680, phone: '+79501940844', mega: 'mega_ek'}
  {card: 8231002348678, phone: '+79521417352', mega: 'mega_ek'}
  {card: 8231002348677, phone: '+79521417352', mega: 'mega_ek'}
  {card: 8231002348676, phone: '+79022598026', mega: 'mega_ek'}
  {card: 8231002348675, phone: '+79122046045', mega: 'mega_ek'}
  {card: 8231002348674, phone: '+79122046045', mega: 'mega_ek'}
  {card: 8231002348673, phone: '+79122823974', mega: 'mega_ek'}
  {card: 8231002348672, phone: '+79126995960', mega: 'mega_ek'}
  {card: 8231002348671, phone: '+79090197291', mega: 'mega_ek'}
  {card: 8231002348670, phone: '+79090197291', mega: 'mega_ek'}
  {card: 8231002348669, phone: '+79126158508', mega: 'mega_ek'}
  {card: 8231002348760, phone: '+79122820447', mega: 'mega_ek'}
  {card: 8231002348761, phone: '+79122820447', mega: 'mega_ek'}
  {card: 8231002348762, phone: '+79126391633', mega: 'mega_ek'}
  {card: 8231002348614, phone: '+79502086593', mega: 'mega_ek'}
  {card: 8231002348613, phone: '+79502086593', mega: 'mega_ek'}
  {card: 8231002348611, phone: '+79089237759', mega: 'mega_ek'}
  {card: 8231002348612, phone: '+79089237759', mega: 'mega_ek'}
  {card: 8231002348610, phone: '+79221691973', mega: 'mega_ek'}
  {card: 8231002348609, phone: '+79041746189', mega: 'mega_ek'}
  {card: 8231002348608, phone: '+79041746189', mega: 'mega_ek'}
  {card: 8231002348606, phone: '+79220289630', mega: 'mega_ek'}
  {card: 8231002348607, phone: '+79826121240', mega: 'mega_ek'}
  {card: 8231002348605, phone: '+79126336259', mega: 'mega_ek'}
  {card: 8231002348604, phone: '+79126336259', mega: 'mega_ek'}
  {card: 8231002348603, phone: '+79122223489', mega: 'mega_ek'}
  {card: 8231002348602, phone: '+79122223489', mega: 'mega_ek'}
  {card: 8231002348599, phone: '+79126122410', mega: 'mega_ek'}
  {card: 8231002348601, phone: '+79126122410', mega: 'mega_ek'}
  {card: 8231002348600, phone: '+79193677244', mega: 'mega_ek'}
  {card: 8231002348598, phone: '+79193677244', mega: 'mega_ek'}
  {card: 8231002348597, phone: '+79049871734', mega: 'mega_ek'}
  {card: 8231002348596, phone: '+79527399145', mega: 'mega_ek'}
  {card: 8231002348595, phone: '+79527399145', mega: 'mega_ek'}
  {card: 8231002348594, phone: '+79638504882', mega: 'mega_ek'}
  {card: 8231002348593, phone: '+79086302937', mega: 'mega_ek'}
  {card: 8231002348592, phone: '+79086302937', mega: 'mega_ek'}
  {card: 8231002348591, phone: '+79222034605', mega: 'mega_ek'}
  {card: 8231002348589, phone: '+79122197993', mega: 'mega_ek'}
  {card: 8231002348590, phone: '+79122197993', mega: 'mega_ek'}
  {card: 8231002348764, phone: '+79502033050', mega: 'mega_ek'}
  {card: 8231002348765, phone: '+79502033050', mega: 'mega_ek'}
  {card: 8231002348763, phone: '+79043836657', mega: 'mega_ek'}
  {card: 8231002348766, phone: '+79043836657', mega: 'mega_ek'}
  {card: 8231002348642, phone: '+79630481835', mega: 'mega_ek'}
  {card: 8231002348641, phone: '+79630481835', mega: 'mega_ek'}
  {card: 8231002348771, phone: '+79221683355', mega: 'mega_ek'}
  {card: 8231002348770, phone: '+79089272088', mega: 'mega_ek'}
  {card: 8231002348773, phone: '+79000421310', mega: 'mega_ek'}
  {card: 8231002348772, phone: '+79000421310', mega: 'mega_ek'}
  {card: 8231002348774, phone: '+79126463485', mega: 'mega_ek'}
  {card: 8231002348775, phone: '+79126463485', mega: 'mega_ek'}
  {card: 8231002348780, phone: '+79126162038', mega: 'mega_ek'}
  {card: 8231002348638, phone: '+79126833735', mega: 'mega_ek'}
  {card: 8231002348776, phone: '+79827259336', mega: 'mega_ek'}
  {card: 8231002348777, phone: '+79827259336', mega: 'mega_ek'}
  {card: 8231002348778, phone: '+79068093583', mega: 'mega_ek'}
  {card: 8231002348767, phone: '+79122436095', mega: 'mega_ek'}
  {card: 8231002348769, phone: '+79221952530', mega: 'mega_ek'}
  {card: 8231002348781, phone: '+79045479299', mega: 'mega_ek'}
  {card: 8231002348782, phone: '+79086355145', mega: 'mega_ek'}
  {card: 8231002348783, phone: '+79126517017', mega: 'mega_ek'}
  {card: 8231002348784, phone: '+79126517017', mega: 'mega_ek'}
  {card: 8231002348785, phone: '+79221018084', mega: 'mega_ek'}
  {card: 8231002348787, phone: '+79122351951', mega: 'mega_ek'}
  {card: 8231002348786, phone: '+79122351951', mega: 'mega_ek'}
  {card: 8231002348788, phone: '+79501965320', mega: 'mega_ek'}
  {card: 8231002348789, phone: '+79501965320', mega: 'mega_ek'}
  {card: 8231002348790, phone: '+79501965320', mega: 'mega_ek'}
  {card: 8231002348791, phone: '+79501965320', mega: 'mega_ek'}
  {card: 8231002348792, phone: '+79089077794', mega: 'mega_ek'}
  {card: 8231002348793, phone: '+79089077794', mega: 'mega_ek'}
  {card: 8231002348794, phone: '+79126968285', mega: 'mega_ek'}
  {card: 8231002348795, phone: '+79827015518', mega: 'mega_ek'}
  {card: 8231002348796, phone: '+79827015518', mega: 'mega_ek'}
  {card: 8231002348660, phone: '+79221527565', mega: 'mega_ek'}
  {card: 8231002348659, phone: '+79089208810', mega: 'mega_ek'}
  {card: 8231002348662, phone: '+79995598911', mega: 'mega_ek'}
  {card: 8231002348661, phone: '+79995598911', mega: 'mega_ek'}
  {card: 8231002348647, phone: '+79122306700', mega: 'mega_ek'}
  {card: 8231002354360, phone: '+79090014255', mega: 'mega_ek'}
  {card: 8231002354361, phone: '+79090014255', mega: 'mega_ek'}
  {card: 8231002354363, phone: '+79120488614', mega: 'mega_ek'}
  {card: 8231002354362, phone: '+79226056422', mega: 'mega_ek'}
  {card: 8231002354364, phone: '+79120333273', mega: 'mega_ek'}
  {card: 8231002354365, phone: '+79120333273', mega: 'mega_ek'}
  {card: 8231002354366, phone: '+79126160918', mega: 'mega_ek'}
  {card: 8231002354367, phone: '+79049838871', mega: 'mega_ek'}
  {card: 8231002354368, phone: '+79049838871', mega: 'mega_ek'}
  {card: 8231002354369, phone: '+79049838872', mega: 'mega_ek'}
  {card: 8231002354370, phone: '+79049838872', mega: 'mega_ek'}
  {card: 8231002354372, phone: '+79638507703', mega: 'mega_ek'}
  {card: 8231002354373, phone: '+79638507703', mega: 'mega_ek'}
  {card: 8231002354274, phone: '+79226190061', mega: 'mega_ek'}
  {card: 8231002354373, phone: '+79226190061', mega: 'mega_ek'}
  {card: 8231002354376, phone: '+79221415360', mega: 'mega_ek'}
  {card: 8231002354375, phone: '+79221415360', mega: 'mega_ek'}
  {card: 8231002354377, phone: '+79655288267', mega: 'mega_ek'}
  {card: 8231002354378, phone: '+79655288267', mega: 'mega_ek'}
  {card: 8231002354379, phone: '+79193740852', mega: 'mega_ek'}
  {card: 8231002354380, phone: '+79193740852', mega: 'mega_ek'}
  {card: 8231002354382, phone: '+79122779542', mega: 'mega_ek'}
  {card: 8231002354381, phone: '+79122779542', mega: 'mega_ek'}
  {card: 8231002354384, phone: '+79089250357', mega: 'mega_ek'}
  {card: 8231002354383, phone: '+79089250357', mega: 'mega_ek'}
  {card: 8231002354385, phone: '+79827207001', mega: 'mega_ek'}
  {card: 8231002354386, phone: '+79827207001', mega: 'mega_ek'}
  {card: 8231002354388, phone: '+79122600310', mega: 'mega_ek'}
  {card: 8231002354389, phone: '+79122134640', mega: 'mega_ek'}
  {card: 8231002354391, phone: '+79655013399', mega: 'mega_ek'}
  {card: 8231002354390, phone: '+79655013399', mega: 'mega_ek'}
  {card: 8231002354392, phone: '+79120320571', mega: 'mega_ek'}
  {card: 8231002354393, phone: '+79043849629', mega: 'mega_ek'}
  {card: 8231002354394, phone: '+79043849629', mega: 'mega_ek'}
  {card: 8231002354395, phone: '+79043868238', mega: 'mega_ek'}
  {card: 8231002354396, phone: '+79043868238', mega: 'mega_ek'}
  {card: 8231002354397, phone: '+79049834496', mega: 'mega_ek'}
  {card: 8231002354403, phone: '+79126747787', mega: 'mega_ek'}
  {card: 8231002354398, phone: '+79126747787', mega: 'mega_ek'}
  {card: 8231002354399, phone: '+79221005868', mega: 'mega_ek'}
  {card: 8231002354400, phone: '+79505600704', mega: 'mega_ek'}
  {card: 8231002354401, phone: '+79527323993', mega: 'mega_ek'}
  {card: 8231002354402, phone: '+79527323993', mega: 'mega_ek'}
  {card: 8231002354404, phone: '+79090101920', mega: 'mega_ek'}
  {card: 8231002354405, phone: '+79090101920', mega: 'mega_ek'}
  {card: 8231002354406, phone: '+79041799762', mega: 'mega_ek'}
  {card: 8231002354353, phone: '+79193900440', mega: 'mega_ek'}
  {card: 8231002354352, phone: '+79193900440', mega: 'mega_ek'}
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