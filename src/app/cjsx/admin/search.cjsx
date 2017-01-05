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
      fail: (data)->
        JCapi_used_emails[url] = undefined
        callbacks['fail'](data) if typeof callbacks['fail'] is 'function'
      error: ()->
        JCapi_used_emails[url] = undefined
        callbacks['fail']() if typeof callbacks['fail'] is 'function'
  else
    sweetAlert window.language.global.error, "Это действие уже выполняется, подождите", "error"
  return (success)->
    callbacks['success'] = success
    return (fail)->
      callbacks['fail'] = fail
    
{ div, h1, h2, form, span, button, a, img, i, input, label, select, option, p, table, thead, tbody, tr, th, td } = React.DOM

SearchComponent = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+7 999 999 99 99")
  onSubmit: (e)->
    e.preventDefault()
    @validate ()=>
      JCapi("/api/preregister/find/admin", "GET", {phone: @refs.phone.value.replace(/\s/gi, "")})((res)=>
        @props.goTo 1, res
      )(()->
        sweetAlert window.language.global.error, "Пользователь не найден!", "error"
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
      h1 {className: "text-center overflow_hidden"}, "Поиск участника"
      form {className: "form_horizontal border-no margin_top_20", onSubmit: @onSubmit},
        div {className: "form-group"},
          div {className: "input-group col-sm-10 col-sm-offset-1"},
            input {className: "form-control phone", type: "tel", placeholder: "Введите телефон", ref: "phone"}
            span {className: "input-group-btn"},
              button {className: "btn btn-secondary", type: "submit"},
                i {className: "fa fa-search"}

UserComponent = React.createClass  
  componentDidMount: ->
    $(".fancybox").fancybox
      openEffect: 'elastic'
      closeEffect: 'elastic'
  home: (e)->
    e.preventDefault()
    @props.goTo 0
  getInitialActive: ->
    p = @props.preregister
    ia_hash = [ "тизер", "фото", "вес" ]
    first_active = switch
      when p.initial_active isnt undefined then ia_hash[p.initial_active]
      when (p.weight.length is 0) and (p.looks.length is 0) then "тизер"
      when (p.weight.length is 0) or ((p.looks.length isnt 0) and moment(p.weight[0].created_at).isAfter(moment(p.looks[0].created_at))) then "фото"
      when true then "вес"
  getWeightSum: ->
    p = @props.preregister
    res = 0
    for w in p.weight
      res = res + parseInt w.weight, 10
    res + " кг."
  getBalance: ->
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
  getWeightRow: (w)->
    tr {key: w._id},
      td {className: "text-center"}, w.weight
      td {className: "text-center"}, moment(w.created_at).format("DD.MM.YY HH:mm:ss")
      td {className: "text-center"}, @getMega(w.mega)
  getTransactionsRow: (t)->
    tr {key: t._id},
      td {className: "text-center"}, "250 руб."
      td {className: "text-center"}, t.card_number
      td {className: "text-center"}, moment(t.created_at).format("DD.MM.YY HH:mm:ss")
      td {className: "text-center"}, @getMega(t.mega)
  getPhotoSrc: (src)->
    "/static/uploaded_images/" + src
  getPhotoStatusText: (status)->
    res = switch
      when status is -1 then "Корзина"
      when status is 0 then "Новая"
      when status is 1 then "Ожидает рассмотрения"
      when status is 0 then "Ожидает одобрения"
      when status is 1 then "Одобренная"
  getMayWin: (mw)->
    if mw then "Да" else "Нет"
  getExpert: (name)->
    author = switch
      when name is "olga1" then "Ольга Шелест"
      when name is "olga2" then "Ольга Мальцева"
      when name is "katya1" then "Екатерина Климова"
      when true then ""
  getPhotoRow: (ph)->
    tr {key: ph._id},
      td {className: "text-center"}, ph._id
      td {className: "text-center"}, 
        a {className: "fancybox", href: @getPhotoSrc(ph.src)},
          img {className: "img-responsive table-img img-thumbnail", src: @getPhotoSrc(ph.src)}
      td {className: "text-center"}, moment(ph.created_at).format("DD.MM.YY HH:mm:ss")
      td {className: "text-center"}, @getPhotoStatusText(ph.mega)
      td {className: "text-center"}, if ph.mayWin is undefined then "" else @getMayWin(ph.mayWin)
      td {className: "text-center"}, if ph.comment_by is undefined then "" else @getExpert(ph.comment_by)
      td {className: "text-center"}, if ph.is_shared is undefined then "" else @getMayWin(ph.is_shared)
  getWeightTable: ()->
    div {className: "table-responsive overflow_auto"},
      table {className: "table-bordered table table-striped"},
        thead {},
          tr {},
            th {className: "text-center"}, "Вес"
            th {className: "text-center"}, "Дата"
            th {className: "text-center"}, "Мега"
        tbody {}, 
          @getWeightRow(w) for w in @props.preregister.weight
  getTransactionsTable: ()->
    div {className: "table-responsive overflow_auto"},
      table {className: "table-bordered table table-striped"},
        thead {}, 
          tr {},
            th {className: "text-center"}, "Номинал"
            th {className: "text-center"}, "Номер"
            th {className: "text-center"}, "Дата"
            th {className: "text-center"}, "Мега"
        tbody {},
          @getTransactionsRow(t) for t in @props.preregister.transactions
  getPhotoTable: ()->
    div {className: "table-responsive overflow_auto"},
      table {className: "table-bordered table table-striped"},
        thead {}, 
          tr {},
            th {className: "text-center"}, "ID"
            th {className: "text-center"}, "Фото"
            th {className: "text-center"}, "Дата"
            th {className: "text-center"}, "Статус"
            th {className: "text-center"}, "Рекомендация"
            th {className: "text-center"}, "Эксперт"
            th {className: "text-center"}, "Расшарено"
        tbody {},
          @getPhotoRow(ph) for ph in @props.photos       
  render: ->
    div {},
      h1 {className: "text-center overflow_hidden"}, "Профиль участника"
      form {className: "form_horizontal border-no margin_top_20"},
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Имя"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @props.preregister.fname
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Фамилия"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @props.preregister.lname
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Телефон"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @props.preregister.phone
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "E-mail"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @props.preregister.email
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Первая активность"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @getInitialActive()
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Мега"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @getMega(@props.preregister.mega)
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Общий сданный вес"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @getWeightSum()
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Баланс"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @getBalance()
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Выдано карт"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @props.preregister.transactions.length
        div {className: "form-group overflow_hidden"},
          div {className: "col-xs-6 text-right"},
            label {className: "control-label"}, "Последний выданный код"
          div {className: "col-xs-6"},
            label {className: "control-label"}, @props.preregister.verify_code
        h2 {className: "text-center float_left_width_100 overflow_hidden"}, "История сдачи веса" if @props.preregister.weight.length isnt 0
        @getWeightTable() if @props.preregister.weight.length isnt 0   
        h2 {className: "text-center float_left_width_100 overflow_hidden"}, "История выдачи карт" if @props.preregister.transactions.length isnt 0
        @getTransactionsTable() if @props.preregister.transactions.length isnt 0
        h2 {className: "text-center float_left_width_100 overflow_hidden"}, "История фотоконкурса" if @props.photos.length isnt 0
        @getPhotoTable() if @props.photos.length isnt 0
        form {className: "form_horizontal border-no margin_top_20 ", onSubmit: @home},
          div {className: "form-group overflow_hidden float_left_width_100"},
            div {className: "col-xs-12 text-center"},
              button {className: "btn btn-primary", type: "submit"}, "Вернуться назад"

PromouterComponent = React.createClass
  getInitialState: ->
    {step: 0, data: {}}
  goTo: (step, data={})->
    @setState {step: step, data: data}
  render: ->
    <div className="container main_first-container">
      { <SearchComponent goTo={@goTo} /> if @state.step is 0}
      { <UserComponent goTo={@goTo} phone={@state.data.phone} preregister={@state.data.preregister} photos={@state.data.photos} /> if @state.step is 1}
    </div>
    
React.render <PromouterComponent />, document.getElementById('search_place')