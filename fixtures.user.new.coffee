mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2100511984689, phone: "+79045095879", mega: "mega_ro"}
  {card: 2100514765780, phone: "+79184520542", mega: "mega_ro"}
  {card: 2100515308245, phone: "+79282147229", mega: "mega_ro"}
  {card: 2100517237345, phone: "+79515092668", mega: "mega_ro"}
  {card: 2100517744201, phone: "+79885742956", mega: "mega_ro"}
  {card: 2100518062014, phone: "+79045013407", mega: "mega_ro"}
  {card: 2100518552843, phone: "+79185367006", mega: "mega_ro"}
  {card: 2100518833584, phone: "+79061850056", mega: "mega_ro"}
  {card: 2100518926323, phone: "+79282891420", mega: "mega_ro"}
  {card: 2100519479699, phone: "+79045013407", mega: "mega_ro"}
  {card: 2100520314118, phone: "+79081775517", mega: "mega_ro"}
  {card: 2100521883996, phone: "+79515384399", mega: "mega_ro"}
  {card: 2100522147288, phone: "+79034893085", mega: "mega_ro"}
  {card: 2100523301566, phone: "+79001325662", mega: "mega_ro"}
  {card: 2100524457149, phone: "+79185151336", mega: "mega_ro"}
  {card: 2100524933001, phone: "+79034505992", mega: "mega_ro"}
  {card: 2100525688696, phone: "+79281298079", mega: "mega_ro"}
  {card: 2100526735207, phone: "+79185742207", mega: "mega_ro"}
  {card: 2100528516231, phone: "+79518328800", mega: "mega_ro"}
  {card: 2100532031669, phone: "+79882569222", mega: "mega_ro"}
  {card: 2100533058702, phone: "+79054306768", mega: "mega_ro"}
  {card: 2100533654072, phone: "+79198741416", mega: "mega_ro"}
  {card: 2100533785592, phone: "+79001325662", mega: "mega_ro"}
  {card: 2100534204863, phone: "+79889937996", mega: "mega_ro"}
  {card: 2100535023098, phone: "+79198741416", mega: "mega_ro"}
  {card: 2100535062813, phone: "+79045055598", mega: "mega_ro"}
  {card: 2100535086550, phone: "+79515092668", mega: "mega_ro"}
  {card: 2100537741990, phone: "+79614135813", mega: "mega_ro"}
  {card: 2100539333025, phone: "+79045006999", mega: "mega_ro"}
  {card: 2100539346063, phone: "+79281707786", mega: "mega_ro"}
  {card: 2100542137481, phone: "+79185398493", mega: "mega_ro"}
  {card: 2100542915928, phone: "+79081965002", mega: "mega_ro"}
  {card: 2100543709168, phone: "+79054508871", mega: "mega_ro"}
  {card: 2100544488598, phone: "+79085079765", mega: "mega_ro"}
  {card: 2100545250781, phone: "+79044498404", mega: "mega_ro"}
  {card: 2100545532979, phone: "+79185151336", mega: "mega_ro"}
  {card: 2100546417220, phone: "+79198741416", mega: "mega_ro"}
  {card: 2100546525574, phone: "+79518328880", mega: "mega_ro"}
  {card: 2100546532114, phone: "+79518265774", mega: "mega_ro"}
  {card: 2100547975675, phone: "+79518265774", mega: "mega_ro"}
  {card: 2100549101690, phone: "+79081965002", mega: "mega_ro"}
  {card: 2100549987782, phone: "+79034505992", mega: "mega_ro"}
  {card: 2100551395186, phone: "+79185570940", mega: "mega_ro"}
  {card: 2100553484529, phone: "+79885397906", mega: "mega_ro"}
  {card: 2100553552259, phone: "+79184520542", mega: "mega_ro"}
  {card: 2100556088991, phone: "+79896191950", mega: "mega_ro"}
  {card: 2100557400716, phone: "+79504525421", mega: "mega_ro"}
  {card: 2100558360828, phone: "+79515384399", mega: "mega_ro"}
  {card: 2100558948699, phone: "+79885397906", mega: "mega_ro"}
  {card: 2100560497420, phone: "+79034312974", mega: "mega_ro"}
  {card: 2100560557308, phone: "+79888982159", mega: "mega_ro"}
  {card: 2100561665798, phone: "+79281298079", mega: "mega_ro"}
  {card: 2100561705708, phone: "+79895040106", mega: "mega_ro"}
  {card: 2100562930857, phone: "+79612683003", mega: "mega_ro"}
  {card: 2100563392838, phone: "+79081965002", mega: "mega_ro"}
  {card: 2100565440155, phone: "+79612710551", mega: "mega_ro"}
  {card: 2100566447023, phone: "+79045055598", mega: "mega_ro"}
  {card: 2100566693550, phone: "+79184520542", mega: "mega_ro"}
  {card: 2100566801122, phone: "+79085079765", mega: "mega_ro"}
  {card: 2100566961758, phone: "+79614138033", mega: "mega_ro"}
  {card: 2100567587650, phone: "+79885708622", mega: "mega_ro"}
  {card: 2100567644384, phone: "+79896191950", mega: "mega_ro"}
  {card: 2100570173413, phone: "+79614135813", mega: "mega_ro"}
  {card: 2100571309941, phone: "+79094591050", mega: "mega_ro"}
  {card: 2100573528005, phone: "+79604617922", mega: "mega_ro"}
  {card: 2100576084003, phone: "+79896191905", mega: "mega_ro"}
  {card: 2100577156204, phone: "+79034893085", mega: "mega_ro"}
  {card: 2100577164018, phone: "+79896191950", mega: "mega_ro"}
  {card: 2100577768216, phone: "+79185742207", mega: "mega_ro"}
  {card: 2100578727526, phone: "+79604617922", mega: "mega_ro"}
  {card: 2100580327066, phone: "+79044412812", mega: "mega_ro"}
  {card: 2100581258468, phone: "+79198920708", mega: "mega_ro"}
  {card: 2100582009885, phone: "+79001325662", mega: "mega_ro"}
  {card: 2100583125423, phone: "+79094241512", mega: "mega_ro"}
  {card: 2100584747433, phone: "+79064214651", mega: "mega_ro"}
  {card: 2100586402934, phone: "+79081965002", mega: "mega_ro"}
  {card: 2100586965392, phone: "+79034312974", mega: "mega_ro"}
  {card: 2100588216416, phone: "+79198920708", mega: "mega_ro"}
  {card: 2100588619590, phone: "+79614138033", mega: "mega_ro"}
  {card: 2100589019221, phone: "+79184520542", mega: "mega_ro"}
  {card: 2100589985052, phone: "+79882569222", mega: "mega_ro"}
  {card: 2100591142405, phone: "+79889937996", mega: "mega_ro"}
  {card: 2100591161796, phone: "+79612710551", mega: "mega_ro"}
  {card: 2100593194105, phone: "+79612683003", mega: "mega_ro"}
  {card: 2100593791359, phone: "+79064214651", mega: "mega_ro"}
  {card: 2100598416851, phone: "+79184520542", mega: "mega_ro"}
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

  clearDb = (phone, card_number)->
    PreRegisterModel.findOne {phone: phone}, (err, user)->
      if !!user
        transactions = []
        transactions_hash = {}
        message = ""
        for t in user.transactions
          if transactions_hash[t.card_number] is undefined
            transactions_hash[t.card_number] = true
            transactions.push t
          else
            message += "Card " + t.card_number + " duplicate to user " + phone + "\n"
        user.transactions = transactions
        user.save ()->
          console.log message + "\n"
      # CardModel.findOne {number: card_number}, (err, card)->
    #   if card
    #     message = "card " + card_number + " alredy exists! "
    #     card.remove ()->
    #       message += "card " + card_number + " removed! "
    #       m = new CardModel {number: card_number, is_active: true, owner: 11}
    #       m.save (err)->
    #         message += "card " + card_number + " saved! " + err
    #         console.log message + "\n"
    #   else
    #     message = "card " + card_number + " not exist! "
    #     m = new CardModel {number: card_number, is_active: true, owner: 11}
    #     m.save (err)->
    #       message += "card " + card_number + " saved! " + err  
    #       console.log message + "\n"
    # PreRegisterModel.findOne {phone: phone}, (err, user)->
    #   if !user
    #     message = "User " + phone + " is not found!" + "\n"
    #     CardModel.update {card_number: card_number}, {$set: {is_active: true}}, ()->
    #       console.log message + "Card " + card_number + " is active now!" + "\n"
    #   else
    #     TransactionsModel.findOne {owner: user._id, card_number: card_number}, (err, transaction)->
    #       if !transaction
    #         message = "Transaction with user " + phone + " and card number " + card_number + " is not found!" + "\n"
    #         CardModel.update {card_number: card_number}, {$set: {is_active: true}}, (n)->
    #           console.log n
    #           console.log message + "Card " + card_number + " is active now!" + "\n"
    #       else
    #         transaction.remove ()->
    #           message = "Transaction with user " + phone + " and card number " + card_number + " is removed! "
    #           for i, t of user.transactions
    #             if t.card_number is card_number
    #               user.transactions.splice i, 1
    #               user.save ()->
    #                 message += "Transaction removed from user data! "
    #                 CardModel.update {card_number: card_number}, {$set: {is_active: true}}, ()->
    #                   console.log message + "Card " + card_number + " is active now!" + "\n"


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

  users_hash = {}
  for user in data
    # users_iterator user
    if users_hash[user.phone] is undefined
      users_hash[user.phone] = true
      clearDb user.phone, user.card