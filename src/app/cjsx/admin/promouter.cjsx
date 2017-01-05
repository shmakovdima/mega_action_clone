JCapi_used_emails = {}
JCapi = (url, method='GET', data={}, force=false)->
  callbacks = {}
  if JCapi_used_emails[url] is undefined
    JCapi_used_emails[url] = true
    $.ajax
      url: url
      method: method
      contentType: "application/json"
      data: if method is "GET" then data else JSON.stringify data
      success: (data)->
        JCapi_used_emails[url] = undefined
        if data['!err'] isnt undefined
          callbacks['fail'](data) if typeof callbacks['fail'] is 'function'
        else
          callbacks['success'](data) if typeof callbacks['success'] is 'function'
      fail: (xhr)->
        JCapi_used_emails[url] = undefined
        callbacks['fail'](xhr) if typeof callbacks['fail'] is 'function'
      error: (xhr)->
        JCapi_used_emails[url] = undefined
        callbacks['fail'](xhr) if typeof callbacks['fail'] is 'function'
  else
    sweetAlert window.language.global.error, "Это действие уже выполняется, подождите", "error"
  return (success)->
    callbacks['success'] = success
    return (fail)->
      callbacks['fail'] = fail
    
{ div, h1, h2, form, span, button, i, input, label, select, option, p, table, thead, tbody, tr, th, td } = React.DOM

SearchComponent = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+7 999 999 99 99")
  onSubmit: (e)->
    e.preventDefault()
    @validate ()=>
      JCapi("/api/preregister/find", "GET", {phone: @refs.phone.value.replace(/\s/gi, "")})((res)=>
        if res.preregister is null
          @props.goTo 1, {phone: @refs.phone.value}
        else
          @props.goTo 2, res.preregister
      )(()->
        sweetAlert window.language.global.error, "Ошибка на сервере, попробуйте ещё раз", "error"
      )
  validate: (cb)->
    $(@refs.phone.parentNode).removeClass "has-error"
    if !/^\+[0-9]{11}$/.test @refs.phone.value.replace(/\s/gi, "")
      sweetAlert window.language.global.error, "Неверный телефон", "error"
      $(@refs.phone.parentNode).addClass "has-error"
    else
      cb()
  render: ->
    div {},
      h1 {className: "text-center overflow_hidden"}, "Поиск человека"
      form {className: "form_horizontal border-no margin_top_20", onSubmit: @onSubmit},
        div {className: "form-group"},
          div {className: "input-group col-sm-10 col-sm-offset-1"},
            input {className: "form-control phone", type: "tel", placeholder: "Введите телефон", ref: "phone"}
            span {className: "input-group-btn"},
              button {className: "btn btn-secondary", type: "submit"},
                i {className: "fa fa-search"}

RegisterComponent = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+7 999 999 99 99")
  onSubmit: (e)->
    e.preventDefault()
    @validate =>
      JCapi("/api/preregister/", "POST", {
        "fname": @refs.fname.value
        "lname": @refs.lname.value
        "email": @refs.email.value
        "phone": @refs.phone.value.replace(/\s/gi, "")
        "mega": @refs.mega.value
      })((preregister)=>
        @props.goTo 2, preregister
      )((err)=>
        sweetAlert window.language.global.error, "Вы уже зарегистрированы!", "error" 
      )
  validate: (cb)->
    errors = false
    $(@refs.fname).closest(".form-group").removeClass "has-error"
    $(@refs.lname).closest(".form-group").removeClass "has-error"
    $(@refs.phone).closest(".form-group").removeClass "has-error"
    $(@refs.email).closest(".form-group").removeClass "has-error"
    $(@refs.mega).closest(".form-group").removeClass "has-error"

    if !/^[а-яА-Я\-]+$/.test @refs.fname.value
      errors = true
      $(@refs.fname).closest(".form-group").addClass "has-error"
    if !/^[а-яА-Я\-]+$/.test @refs.lname.value
      errors = true
      $(@refs.lname).closest(".form-group").addClass "has-error"
    if !/^\+[0-9]{11}$/.test @refs.phone.value.replace(/\s/gi, "")
      errors = true
      $(@refs.phone).closest(".form-group").addClass "has-error"
    if (@refs.email.value.length isnt 0) and !/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test @refs.email.value
      errors = true
      $(@refs.email).closest(".form-group").addClass "has-error"
    if @refs.mega.value.length is 0
      errors = true
      $(@refs.mega).closest(".form-group").addClass "has-error"

    if !errors then cb() else sweetAlert window.language.global.error, "Ошибки в форме", "error" 
  render: ->
    div {},
      h1 {className: "text-center overflow_hidden"}, "Регистрация участника"
      form {className: "form_horizontal border-no margin_top_20", onSubmit: @onSubmit},
        div {className: "form-group overflow_hidden"},
          label {className: "col-sm-6 control-label text-right"}, "Фамилия"
          div {className: "col-sm-6"},
            input {className: "form-control", type: "text", placeholder: "Введите фамилию", ref: "lname"}
        div {className: "form-group overflow_hidden"},
          label {className: "col-sm-6 control-label text-right"}, "Имя"
          div {className: "col-sm-6"},
            input {className: "form-control", type: "text", placeholder: "Введите имя", ref: "fname"}
        div {className: "form-group overflow_hidden"},
          label {className: "col-sm-6 control-label text-right"}, "Телефон"
          div {className: "col-sm-6"},
            input {className: "form-control phone", type: "tel", ref: "phone", defaultValue: @props.phone}
        div {className: "form-group overflow_hidden"},
          label {className: "col-sm-6 control-label text-right"}, "E-mail"
          div {className: "col-sm-6"},
            input {className: "form-control", type: "email", ref: "email", placeholder: "Введите email"}
        div {className: "form-group overflow_hidden"},
          label {className: "col-sm-6 control-label text-right"}, "Моя МЕГА"
          div {className: "col-sm-6"},
            select {className: "form-control", placeholder: "Выберите МЕГУ", ref: "mega"},
              option {value: "0"}, "Тёплый стан"
              option {value: "1"}, "Белая дача"
              option {value: "2"}, "Химки"
              option {value: "3"}, "Дыбенко"
              option {value: "4"}, "Парнас"
              option {value: "5"}, "Адыгея-Кубань"
              option {value: "6"}, "Екатеринбург"
              option {value: "7"}, "Казань"
              option {value: "8"}, "Нижний Новгород"
              option {value: "9"}, "Новосибирск"
              option {value: "10"}, "Омск"
              option {value: "11"}, "Ростов-на-Дону"
              option {value: "12"}, "Самара"
              option {value: "13"}, "Уфа"
        div {className: "form-group overflow_hidden text-center"},
          button {className: "btn btn-primary", type: "submit"}, "Добавить" 

PreregisterCard = React.createClass
  goBack: (e)->
    e.preventDefault()
    @props.goTo 0
  addWeight: (e)->
    e.preventDefault()
    @props.goTo 3, @props.preregister
  addTransaction: (e)->
    e.preventDefault()
    @props.goTo 4, @props.preregister  
  countBalance: ()->
    res = @props.preregister.balance
    for transaction in @props.preregister.transactions
      res -= transaction.sum 
    return res.toFixed(0)
  render: ->
    div {},
      h1 {className: "text-center overflow_hidden"}, "Профиль участника"
      form {className: "form_horizontal border-no margin_top_20"}, 
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Имя"
          div {className: "col-xs-6"},
            p {className: "form-control-static"}, @props.preregister.fname
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Фамилия"
          div {className: "col-xs-6"},
            p {className: "form-control-static"}, @props.preregister.lname   
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Телефон"
          div {className: "col-xs-6"},
            p {className: "form-control-static"}, @props.preregister.phone   
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "E-mail"
          div {className: "col-xs-6"},
            p {className: "form-control-static"}, @props.preregister.email   
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Баланс"
          div {className: "col-xs-6"},
            p {className: "form-control-static"}, @countBalance()
        div {className: "form-group overflow_hidden margin_top_20 col-sm-4"},
          div {className: "text-center"},
            button {className: "btn btn-primary", onClick: @addWeight}, "Добавить вес"
        div {className: "form-group overflow_hidden margin_top_20 col-sm-4"},  
          div {className: "text-center"},
            button {className: "btn btn-primary", onClick: @addTransaction}, "Выдача карт" 
         div {className: "form-group overflow_hidden margin_top_20 col-sm-4"},   
          div {className: "text-center"},
            button {className: "btn btn-primary", onClick: @goBack}, "Назад"

PreregisterAddWeight = React.createClass
  componentDidMount: ->
    $(@refs.weight).mask("99.9 кг")
  countTotalWeight: ->
    res = 0
    for w in @props.preregister.weight
      res += parseFloat w.weight, 10
    return res
  goBack: (e)->
    e.preventDefault()
    @props.goTo 2, @props.preregister
  getMega: (mega_num)->
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
      when mega_num is 14 then 'Мобильная Мега'
  onSubmit: (e)->
    e.preventDefault()
    @validate ()=>
      JCapi("/api/preregister/" + @props.preregister._id + '/weight/', 'POST', {weight: parseFloat(@refs.weight.value.replace(/[^\.0-9]/gim,''), 10)})((preregister)=>
        @props.goTo 2, preregister
      )
  validate: (cb)->
    if parseFloat(@refs.weight.value.replace(/[^\.0-9]/gim,''), 10) > 0
      cb()
    else 
      sweetAlert window.language.global.error, "Вес должен быть больше нуля.", "error"
  render: ->
    div {},
      h1 {className: "text-center overflow_hidden"}, "Добавить вес"
      form {className: "form_horizontal border-no margin_top_20", onSubmit: @onSubmit},
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Вес (кг)"
          div {className: "col-xs-6"},
            input {className: "form-control weight", ref: "weight", placeholder: "Введите вес", type: "text", step: "0.1", min: "0"}
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-12 text-center"},
            button {type: "submit", className: "btn btn-primary"}, "Добавить"
      h2 {className: "text-center overflow_hidden"}, "История добавления веса"
      form {className: "form_horizontal border-no margin_top_20"}, 
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Всего сдано"
          div {className: "col-xs-6"},
            p {className: "form-control-static"}, @countTotalWeight() + " кг."
      div {className: "table-responsive overflow_auto"},
        table {className: "table table-striped table-bordered"},
          thead {},
            tr {}, 
              th {className: "text-center"}, "Вес"
              th {className: "text-center"}, "Дата"
              th {className: "text-center"}, "Время"
              th {className: "text-center"}, "Мега"
          tbody {},
            for w in @props.preregister.weight
              tr {key: w._id},
                td {className: "text-center"}, w.weight + " кг."
                td {className: "text-center"}, moment(w.created_at).format "DD.MM.YYYY"
                td {className: "text-center"}, moment(w.created_at).format "hh:mm:ss"
                td {className: "text-center"}, @getMega parseInt(w.mega, 10)
      form {className: "form_horizontal border-no margin_top_20", onSubmit: @goBack},
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-12 text-center"},
            button {type: "submit", className: "btn btn-primary"}, "Назад"

PreregisterVerify = React.createClass
  onSubmit: (e)->
    e.preventDefault()
    JCapi("/api/preregister/" + @props.preregister._id + "/verify", "GET", {code: @refs.code.value})(()=>
      @props.goTo 5, @props.preregister
    )((xhr)->
      message = if parseInt(xhr.status) is 404 then "Выдача в вашем городе невозможна" else "Неверный код"
      sweetAlert window.language.global.error, message, "error"
    )
  getNewCode: ->
    JCapi("/api/preregister/" + @props.preregister._id + "/verify", "POST")(()=>
      sweetAlert window.language.global.success, "Новый код отправлен по SMS", "success"
    )((xhr)->
      message = if parseInt(xhr.status) is 404 then "Выдача в вашем городе невозможна" else "Ошибка на сервере, попробуйте позже"
      sweetAlert window.language.global.error, message, "error"
    )    
  goBack: (e)->
    e.preventDefault()
    @props.goTo 2, @props.preregister
  render: ->
    div {},
      h1 {className: "text-center overflow_hidden"}, "Выдача карт"
      form {className: "form_horizontal border-no margin_top_20", onSubmit: @onSubmit},    
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Введите проверочный код"
          div {className: "col-xs-6"},
            input {className: "form-control weight", ref: "code", placeholder: "Введите проверочный код", type: "text"}
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-12 text-center"},
            button {type: "submit", className: "btn btn-primary"}, "Проверить"
      form {className: "form_horizontal border-no margin_top_20", onSubmit: @goBack},
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-12 text-center"},
            button {type: "submit", className: "btn btn-primary"}, "Назад"
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Выслать новый SMS код на телефон"
          div {className: "col-xs-6"},
            div {className: "btn btn-primary", onClick: @getNewCode}, "Выслать новый SMS код"

PreregisterTransactions = React.createClass
  makeTransaction: (e)->
    e.preventDefault()
    if @props.preregister.transactions.length < 7
      JCapi("/api/preregister/" + @props.preregister._id + "/transaction", "POST", {sum: 250, card_number: @refs.card_number.value})((preregister)=>
        @props.goTo 2, preregister
      )((xhr)->
        s = parseInt(xhr.status)
        message = switch
          when s is 403 then "Карты не существует"
          when s is 404 then "Выдача в вашем городе невозможна" 
          when true then "Карта уже выдана"
        sweetAlert window.language.global.error, message, "error"
      )
    else
      sweetAlert window.language.global.error, "Не осталось карт", "error"
  goBack: (e)->
    e.preventDefault()
    @props.goTo 2, @props.preregister
  countBalance: ->
    res = @props.preregister.balance
    for transaction in @props.preregister.transactions
      res -= transaction.sum 
    return res.toFixed(0)
  getMega: (mega_num)->
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
      when mega_num is 14 then 'Мобильная Мега'
  render: ->
    div {},
      h1 {className: "text-center overflow_hidden"}, "Выдача карт"
      form {className: "form_horizontal border-no margin_top_20"},
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Баланс"
          div {className: "col-xs-6"},
            p {className: "form-control-static"}, @countBalance() + " р."
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Осталось выдать"
          div {className: "col-xs-6"},
            p {className: "form-control-static"}, (6 - @props.preregister.transactions.length) + if ((@props.preregister.transactions.length < 2) or (@props.preregister.transactions.length is 6)) then " карт" else (if @props.preregister.transactions.length is 5 then  " карту" else " карты") + " по 250 рублей или " + Math.round(3 - @props.preregister.transactions.length/2) + (if @props.preregister.transactions.length < 3 then " карты" else (if @props.preregister.transactions.length < 5 then  " карту" else " карт")) + " по 500 рублей "
      h2 {className: "text-center overflow_hidden"}, "Выдать карту"
      form {className: "form_horizontal border-no margin_top_20", onSubmit: @makeTransaction},
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Введите номер карты"
          div {className: "col-xs-6"},
            input {className: "form-control weight", ref: "card_number", placeholder: "Введите номер карты", type: "text"}
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-12 text-center"},
            button {type: "submit", className: "btn btn-primary"}, "Выдать карту"
      h2 {className: "text-center overflow_hidden"}, "История выдачи карт"
      div {className: "table-responsive overflow_auto"},
        table {className: "table table-striped table-bordered"},
          thead {},
            tr {}, 
              th {className: "text-center"}, "Номинал"
              th {className: "text-center"}, "Дата"
              th {className: "text-center"}, "Время"
              th {className: "text-center"}, "Мега"
          tbody {},
            for t in @props.preregister.transactions
              tr {key: t._id},
                td {className: "text-center"}, t.sum + " р."
                td {className: "text-center"}, moment(t.created_at).format "DD.MM.YYYY"
                td {className: "text-center"}, moment(t.created_at).format "hh:mm:ss"  
                td {className: "text-center"}, @getMega parseInt(t.mega, 10)  
      form {className: "form_horizontal border-no margin_top_20", onSubmit: @goBack},
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-12 text-center"},
            button {type: "submit", className: "btn btn-primary"}, "Назад"

PromouterComponent = React.createClass
  getInitialState: ->
    {step: 0, data: {}}
  goTo: (step, data={})->
    @setState {step: step, data: data}
  render: ->
    <div className="container main_first-container">
      { <SearchComponent goTo={@goTo} /> if @state.step is 0}
      { <RegisterComponent goTo={@goTo} phone={@state.data.phone} /> if @state.step is 1}
      { <PreregisterCard goTo={@goTo} preregister={@state.data} /> if @state.step is 2}
      { <PreregisterAddWeight goTo={@goTo} preregister={@state.data} /> if @state.step is 3}
      { <PreregisterVerify goTo={@goTo} preregister={@state.data} /> if @state.step is 4}
      { <PreregisterTransactions goTo={@goTo} preregister={@state.data} /> if @state.step is 5}
    </div>
    
React.render <PromouterComponent />, document.getElementById('promouter_place')