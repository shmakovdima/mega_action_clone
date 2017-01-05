exports.get = (mongoose)->
  PreRegisterWeight = new mongoose.Schema
    weight:
      type: Number
      required: true
    created_at:
      type: Date
      required: true
    mega:
      type: Number
      required: true
    whos:
      type: String
      required: true
      default: "admin"

  PreRegisterTransactions = new mongoose.Schema
    sum:
      type: Number
      required: true
    card_number:
      type: Number
      required: true
    created_at:
      type: Date
      required: true
    mega:
      type: Number
      required: true
    is_ikea:
      type: Boolean
      default: false
    whos:
      type: String
      required: true
      default: "admin"

  PreRegister = new mongoose.Schema
    email:
      type: String
    fname:
      type: String
      required: true
    lname:
      type: String
      required: true
    phone:
      type: String
      required: true
      unique: true
    mega:
      type: Number
      required: true
    created_at:
      type: Date
      required: true
    comment:
      type: String
    send_mail:
      type: Boolean
      default: true
    verify_code:
      type: Number
    balance:
      type: Number
      default: 0
    initial_activity:
      type: String
    looks:
      type: [String]
      default: []
    weight:
      type: [PreRegisterWeight]
      default: []
    transactions:
      type: [PreRegisterTransactions]
      default: []


  # PreRegister.path('email').validate (v)->
  #   return (v.length is 0) or /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test v
  PreRegister.path('phone').validate (v)->
    return /^\+[0-9]{11}$/.test v
  PreRegister.path('fname').validate (v)->
    return /^[а-яА-Я\-\s]+$/.test v
  PreRegister.path('lname').validate (v)->
    return /^[а-яА-Я\-\s]+$/.test v

  PreRegister.methods.getMega = (mega_num)->
    res = switch
      when mega_num is 0 then 'Тёплый стан'
      when mega_num is 1 then 'Белая дача'
      when mega_num is 2 then 'Химки'
      when mega_num is 3 then 'Дыбенко'
      when mega_num is 4 then 'Парнас'
      when mega_num is 5 then 'Адыгея-Кубань'
      when mega_num is 6 then 'Екатеринбург'
      when mega_num is 7 then 'Казань'
      when mega_num is 8 then 'Нижний Новгород'
      when mega_num is 9 then 'Новосибирск'
      when mega_num is 10 then 'Омск'
      when mega_num is 11 then 'Ростов-на-Дону'
      when mega_num is 12 then 'Самара'
      when mega_num is 13 then 'Уфа'
      when true then 'Мобильная Мега'

  PreRegister.methods.getNumberByLogin = (mega_login)->
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

  PreRegister.methods.getMegaByLogin = (mega_login)->
    mega_login = mega_login.toUpperCase()
    res = switch
      when mega_login is "MEGA_TS" then 'Тёплый стан'
      when mega_login is "MEGA_BD" then 'Белая дача'
      when mega_login is "MEGA_KH" then 'Химки'
      when mega_login is "MEGA_DY" then 'Дыбенко'
      when mega_login is "MEGA_PA" then 'Парнас'
      when mega_login is "MEGA_AD" then 'Адыгея-Кубань'
      when mega_login is "MEGA_EK" then 'Екатеринбург'
      when mega_login is "MEGA_KA" then 'Казань'
      when mega_login is "MEGA_NN" then 'Нижний Новгород'
      when mega_login is "MEGA_NO" then 'Новосибирск'
      when mega_login is "MEGA_OM" then 'Омск'
      when mega_login is "MEGA_RO" then 'Ростов-на-Дону'
      when mega_login is "MEGA_SA" then 'Самара'
      when mega_login is "MEGA_UF" then 'Уфа'
      when mega_login is "MOBILE_TS" then 'Мобильная Мега - Тёплый стан'
      when mega_login is "MOBILE_BD" then 'Мобильная Мега - Белая дача'
      when mega_login is "MOBILE_KH" then 'Мобильная Мега - Химки'
      when mega_login is "MOBILE_DY" then 'Мобильная Мега - Дыбенко'
      when mega_login is "MOBILE_PA" then 'Мобильная Мега - Парнас'
      when mega_login is "MOBILE_EK" then 'Мобильная Мега - Екатеринбург'
      when mega_login is "MOBILE_OM" then 'Мобильная Мега - Омск'
      when mega_login is "MOBILE_RO" then 'Мобильная Мега - Ростов-на-Дону'
      when mega_login is "MOBILE_SA" then 'Мобильная Мега - Самара'
      when mega_login is "MOBILE_UF" then 'Мобильная Мега - Уфа'
      when mega_login is "MOBILE_4" then "Мобильная Мега - Нижний Новгород"
      when mega_login is "MOBILE_6" then "Мобильная Мега - Екатеринбург"
      when mega_login is "MOBILE_13" then "Мобильная Мега - Ростов-на-Дону"
      when mega_login is "PROMOTER_6" then "Екатеринбург"
      when mega_login is "PROMOTER_4" then "Нижний Новгород"
      when mega_login is "PROMOTER_8" then "Екатеринбург"
      when mega_login is "PROMOTER_13" then "Ростов-на-Дону"
      when true then "УДАЛИТЬ"

  PreRegister.methods.realBalance = (balance, transactions)->
    res = if balance is null then 0 else balance
    for transaction in transactions
      res -= transaction.sum 
    return res.toFixed(2)

  PreRegister.methods.totalWeight = (weight)->
    res = 0
    for w in weight
      res += w.weight
    return res

  return mongoose.model('PreRegister', PreRegister)
