mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2310020554546, phone: '+79179097451', mega: 'mega_ka'}
  {card: 2310020554553, phone: '+79179097452', mega: 'mega_ka'}
  {card: 2310020554421, phone: '+79179097450', mega: 'mega_ka'}
  {card: 2310020554405, phone: '+79179097451', mega: 'mega_ka'}
  {card: 2310020554397, phone: '+79179097452', mega: 'mega_ka'}
  {card: 2310020554561, phone: '+79179097453', mega: 'mega_ka'}
  {card: 2310020554058, phone: '+79272430008', mega: 'mega_ka'}
  {card: 2310020554041, phone: '+79272430009', mega: 'mega_ka'}
  {card: 2310020554033, phone: '+79372824621', mega: 'mega_ka'}
  {card: 2310020554025, phone: '+79372824622', mega: 'mega_ka'}
  {card: 2310020504009, phone: '+79520326924', mega: 'mega_ka'}
  {card: 2310020554769, phone: '+79991622510', mega: 'mega_ka'}
  {card: 2310020554777, phone: '+79991622511', mega: 'mega_ka'}
  {card: 2310020554587, phone: '+79047699739', mega: 'mega_ka'}
  {card: 2310020554611, phone: '+79047699740', mega: 'mega_ka'}
  {card: 2310020554678, phone: '+79274369059', mega: 'mega_ka'}
  {card: 2310020554462, phone: '+79274059593', mega: 'mega_ka'}
  {card: 2310020554454, phone: '+79274059594', mega: 'mega_ka'}
  {card: 2310020554439, phone: '+79276701235', mega: 'mega_ka'}
  {card: 2310020554447, phone: '+79276701236', mega: 'mega_ka'}
  {card: 2310020554629, phone: '+79872612567', mega: 'mega_ka'}
  {card: 2310020554660, phone: '+79872612568', mega: 'mega_ka'}
  {card: 2310020554496, phone: '+79274330388', mega: 'mega_ka'}
  {card: 2310020554504, phone: '+79274330389', mega: 'mega_ka'}
  {card: 2310020554835, phone: '+79274484396', mega: 'mega_ka'}
  {card: 2310020554827, phone: '+79172959984', mega: 'mega_ka'}
  {card: 2310020554470, phone: '+79172959985', mega: 'mega_ka'}
  {card: 2310020554512, phone: '+79172959986', mega: 'mega_ka'}
  {card: 2310020554389, phone: '+79274689003', mega: 'mega_ka'}
  {card: 2310020554538, phone: '+79053157943', mega: 'mega_ka'}
  {card: 2310020554513, phone: '+79053157944', mega: 'mega_ka'}
  {card: 2310020554579, phone: '+79376243310', mega: 'mega_ka'}
  {card: 2310020554605, phone: '+79274036641', mega: 'mega_ka'}
  {card: 2310020554595, phone: '+79274036642', mega: 'mega_ka'}
  {card: 2310020554652, phone: '+79872968672', mega: 'mega_ka'}
  {card: 2310020554520, phone: '+79872968673', mega: 'mega_ka'}
  {card: 2310020554645, phone: '+79274410814', mega: 'mega_ka'}
  {card: 2310020554637, phone: '+79274410815', mega: 'mega_ka'}
  {card: 2310020554785, phone: '+79270303613', mega: 'mega_ka'}
  {card: 2310020554793, phone: '+79270303614', mega: 'mega_ka'}
  {card: 2310020554801, phone: '+79046623486', mega: 'mega_ka'}
  {card: 2310020554819, phone: '+79046623487', mega: 'mega_ka'}
  {card: 2310020554843, phone: '+79063214141', mega: 'mega_ka'}
  {card: 2310020554850, phone: '+79063214142', mega: 'mega_ka'}
  {card: 2310020554868, phone: '+79625581655', mega: 'mega_ka'}
  {card: 2310020554884, phone: '+79172731024', mega: 'mega_ka'}
  {card: 2310020554876, phone: '+79172731025', mega: 'mega_ka'}
  {card: 2310020554892, phone: '+79053172562', mega: 'mega_ka'}
  {card: 2310020554900, phone: '+79053172563', mega: 'mega_ka'}
  {card: 2310020554918, phone: '+79053172564', mega: 'mega_ka'}
  {card: 2310020554983, phone: '+79603095052', mega: 'mega_ka'}
  {card: 2310020554959, phone: '+79603095053', mega: 'mega_ka'}
  {card: 2310020554967, phone: '+79603095054', mega: 'mega_ka'}
  {card: 2310020554975, phone: '+79603095055', mega: 'mega_ka'}
  {card: 2310020554991, phone: '+79178550407', mega: 'mega_ka'}
  {card: 2310020554751, phone: '+79534936424', mega: 'mega_ka'}
  {card: 2310020555006, phone: '+79534936425', mega: 'mega_ka'}
  {card: 2310020554744, phone: '+79534077637', mega: 'mega_ka'}
  {card: 2310020554736, phone: '+79061145448', mega: 'mega_ka'}
  {card: 2310020554728, phone: '+79061145449', mega: 'mega_ka'}
  {card: 2310020554710, phone: '+79534008030', mega: 'mega_ka'}
  {card: 2310020554676, phone: '+79375777487', mega: 'mega_ka'}
  {card: 2310020554694, phone: '+79375777488', mega: 'mega_ka'}
  {card: 2310020553829, phone: '+79196945991', mega: 'mega_ka'}
  {card: 2310020554264, phone: '+79093068265', mega: 'mega_ka'}
  {card: 2310020554256, phone: '+79093068266', mega: 'mega_ka'}
  {card: 2310020554199, phone: '+79033437434', mega: 'mega_ka'}
  {card: 2310020553886, phone: '+79033449296', mega: 'mega_ka'}
  {card: 2310020553878, phone: '+79033449297', mega: 'mega_ka'}
  {card: 2310020553860, phone: '+79196949408', mega: 'mega_ka'}
  {card: 2310020553845, phone: '+79196949409', mega: 'mega_ka'}
  {card: 2310020553837, phone: '+79172733859', mega: 'mega_ka'}
  {card: 2310020553852, phone: '+79172733860', mega: 'mega_ka'}
  {card: 2310020553803, phone: '+79196945991', mega: 'mega_ka'}
  {card: 2310020553811, phone: '+79196945990', mega: 'mega_ka'}
  {card: 2310020554207, phone: '+79196945991', mega: 'mega_ka'}
  {card: 2310020553795, phone: '+79083301430', mega: 'mega_ka'}
  {card: 2310020553787, phone: '+79046708879', mega: 'mega_ka'}
  {card: 2310020553779, phone: '+79046708880', mega: 'mega_ka'}
  {card: 2310020554173, phone: '+79050220306', mega: 'mega_ka'}
  {card: 2310020554181, phone: '+79050220307', mega: 'mega_ka'}
  {card: 2310020554157, phone: '+79872163369', mega: 'mega_ka'}
  {card: 2310020554165, phone: '+79872163370', mega: 'mega_ka'}
  {card: 2310020554124, phone: '+79173918206', mega: 'mega_ka'}
  {card: 2310020554116, phone: '+79173918207', mega: 'mega_ka'}
  {card: 2310020554132, phone: '+79065583619', mega: 'mega_ka'}
  {card: 2310020554140, phone: '+79065583620', mega: 'mega_ka'}
  {card: 2310020554082, phone: '+79172545103', mega: 'mega_ka'}
  {card: 2310020554074, phone: '+79172545104', mega: 'mega_ka'}
  {card: 2310020554066, phone: '+79375223696', mega: 'mega_ka'}
  {card: 2310020554702, phone: '+79083301430', mega: 'mega_ka'}
  {card: 2310020554017, phone: '+79625636602', mega: 'mega_ka'}
  {card: 2310020553993, phone: '+79625636603', mega: 'mega_ka'}
  {card: 2310020554363, phone: '+79625636602', mega: 'mega_ka'}
  {card: 2310020554355, phone: '+79625636603', mega: 'mega_ka'}
  {card: 2310020554348, phone: '+79270302894', mega: 'mega_ka'}
  {card: 2310020554314, phone: '+79172409707', mega: 'mega_ka'}
  {card: 2310020554322, phone: '+79172409708', mega: 'mega_ka'}
  {card: 2310020553027, phone: '+79050200013', mega: 'mega_ka'}
  {card: 2310020553035, phone: '+79050200014', mega: 'mega_ka'}
  {card: 2310020554298, phone: '+79518991236', mega: 'mega_ka'}
  {card: 2310020554306, phone: '+79518991237', mega: 'mega_ka'}
  {card: 2310020554272, phone: '+79518991238', mega: 'mega_ka'}
  {card: 2310020554280, phone: '+79518991239', mega: 'mega_ka'}
  {card: 2310020554231, phone: '+79172565500', mega: 'mega_ka'}
  {card: 2310020554249, phone: '+79172565501', mega: 'mega_ka'}
  {card: 2310020554215, phone: '+79172565502', mega: 'mega_ka'}
  {card: 2310020553894, phone: '+79177073109', mega: 'mega_ka'}
  {card: 2310020553092, phone: '+79177073110', mega: 'mega_ka'}
  {card: 2310020554223, phone: '+79177105225', mega: 'mega_ka'}
  {card: 2310020553902, phone: '+79177105226', mega: 'mega_ka'}
  {card: 2310020553985, phone: '+79877144797', mega: 'mega_ka'}
  {card: 2310020553910, phone: '+79877144798', mega: 'mega_ka'}
  {card: 2310020553936, phone: '+79520326262', mega: 'mega_ka'}
  {card: 2310020553928, phone: '+79520326263', mega: 'mega_ka'}
  {card: 2310020553944, phone: '+79046775358', mega: 'mega_ka'}
  {card: 2310020553951, phone: '+79046775359', mega: 'mega_ka'}
  {card: 2310020553969, phone: '+79372864057', mega: 'mega_ka'}
  {card: 2310020554488, phone: '+79172352741', mega: 'mega_ka'}
  {card: 2310020505397, phone: '+79172352742', mega: 'mega_ka'}
  {card: 2310020553761, phone: '+79274232522', mega: 'mega_ka'}
  {card: 2310020553563, phone: '+79274232523', mega: 'mega_ka'}
  {card: 2310020553571, phone: '+79372920290', mega: 'mega_ka'}
  {card: 2310020553589, phone: '+79372920291', mega: 'mega_ka'}
  {card: 2310020553746, phone: '+79376162189', mega: 'mega_ka'}
  {card: 2310020553753, phone: '+79376162190', mega: 'mega_ka'}
  {card: 2310020553597, phone: '+79276737311', mega: 'mega_ka'}
  {card: 2310020553605, phone: '+79276737312', mega: 'mega_ka'}
  {card: 2310020553613, phone: '+79276737313', mega: 'mega_ka'}
  {card: 2310020553621, phone: '+79061145800', mega: 'mega_ka'}
  {card: 2310020553639, phone: '+79061145801', mega: 'mega_ka'}
  {card: 2310020553647, phone: '+79053171396', mega: 'mega_ka'}
  {card: 2310020553654, phone: '+79053171397', mega: 'mega_ka'}
  {card: 2310020553662, phone: '+79053171468', mega: 'mega_ka'}
  {card: 2310020553670, phone: '+79053171469', mega: 'mega_ka'}
  {card: 2310020553688, phone: '+79053171404', mega: 'mega_ka'}
  {card: 2310020553696, phone: '+79297232077', mega: 'mega_ka'}
  {card: 2310020553704, phone: '+79297232078', mega: 'mega_ka'}
  {card: 2310020553712, phone: '+79872376020', mega: 'mega_ka'}
  {card: 2310020553738, phone: '+79872376021', mega: 'mega_ka'}
  {card: 2310020553720, phone: '+79872200706', mega: 'mega_ka'}
  {card: 2310020553100, phone: '+79872200707', mega: 'mega_ka'}
  {card: 2310020553118, phone: '+79600856019', mega: 'mega_ka'}
  {card: 2310020553555, phone: '+79600856020', mega: 'mega_ka'}
  {card: 2310020553548, phone: '+79600682454', mega: 'mega_ka'}
  {card: 2310020553530, phone: '+79063244495', mega: 'mega_ka'}
  {card: 2310020553522, phone: '+79063244496', mega: 'mega_ka'}
  {card: 2310020553514, phone: '+79370049578', mega: 'mega_ka'}
  {card: 2310020553506, phone: '+79673682934', mega: 'mega_ka'}
  {card: 2310020553308, phone: '+79172484548', mega: 'mega_ka'}
  {card: 2310020553316, phone: '+79172484549', mega: 'mega_ka'}
  {card: 2310020553324, phone: '+79178559559', mega: 'mega_ka'}
  {card: 2310020553464, phone: '+79178559560', mega: 'mega_ka'}
  {card: 2310020553498, phone: '+79625567892', mega: 'mega_ka'}
  {card: 2310020553480, phone: '+79625567893', mega: 'mega_ka'}
  {card: 2310020553431, phone: '+79503104020', mega: 'mega_ka'}
  {card: 2310020553472, phone: '+79534854482', mega: 'mega_ka'}
  {card: 2310020553126, phone: '+79534854483', mega: 'mega_ka'}
  {card: 2310020553134, phone: '+79534854480', mega: 'mega_ka'}
  {card: 2310020553124, phone: '+79372889928', mega: 'mega_ka'}
  {card: 2310020553167, phone: '+79179309334', mega: 'mega_ka'}
  {card: 2310020553183, phone: '+79270432600', mega: 'mega_ka'}
  {card: 2310020553209, phone: '+79270432601', mega: 'mega_ka'}
  {card: 2310020553191, phone: '+79376137663', mega: 'mega_ka'}
  {card: 2310020553217, phone: '+79376137664', mega: 'mega_ka'}
  {card: 2310020553225, phone: '+79172345672', mega: 'mega_ka'}
  {card: 2310020553233, phone: '+79172345673', mega: 'mega_ka'}
  {card: 2310020553241, phone: '+79625607254', mega: 'mega_ka'}
  {card: 2310020553258, phone: '+79625607255', mega: 'mega_ka'}
  {card: 2310020553332, phone: '+79047695517', mega: 'mega_ka'}
  {card: 2310020553340, phone: '+79047695518', mega: 'mega_ka'}
  {card: 2310020553357, phone: '+79503227503', mega: 'mega_ka'}
  {card: 2310020553365, phone: '+79503227504', mega: 'mega_ka'}
  {card: 2310020553456, phone: '+79655926180', mega: 'mega_ka'}
  {card: 2310020553266, phone: '+79655926181', mega: 'mega_ka'}
  {card: 2310020553274, phone: '+79046779254', mega: 'mega_ka'}
  {card: 2310020553282, phone: '+79046779255', mega: 'mega_ka'}
  {card: 2310020552938, phone: '+79179311090', mega: 'mega_ka'}
  {card: 2310020552946, phone: '+79179311091', mega: 'mega_ka'}
  {card: 2310020552953, phone: '+79172568872', mega: 'mega_ka'}
  {card: 2310020552961, phone: '+79172568873', mega: 'mega_ka'}
  {card: 2310020552979, phone: '+79179002663', mega: 'mega_ka'}
  {card: 2310020552987, phone: '+79178678118', mega: 'mega_ka'}
  {card: 2310020552995, phone: '+79178678119', mega: 'mega_ka'}
  {card: 2310020553019, phone: '+79297200012', mega: 'mega_ka'}
  {card: 2310020553001, phone: '+79297200013', mega: 'mega_ka'}
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