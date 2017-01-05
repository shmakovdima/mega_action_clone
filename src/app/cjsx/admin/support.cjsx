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
    
{ div, form, input, span, button, textarea, label, br, h2, h3, a } = React.DOM

AdminSupportPopupComponent = React.createClass
  componentDidMount: ->
    $(@refs.main.refs.mega).chosen({"disable_search": true})
  finish: ()->
    sweetAlert window.language.global.success, "Обращение отправлено!", "success"
  getData: ->
    res = 
      "name": @refs.main.refs.name.value
      "email": @refs.main.refs.email.value
      "text": @refs.main.refs.text.value  
      "mega": @refs.main.refs.mega.value
  checkClose: (e)->
    @props.close() if e.target.className is "modal fade in"
  getMegaSelect: ()->
    <select ref="mega">
      <option value="mega_ts">Тёплый стан</option>
      <option value="mega_bd">Белая Дача</option>
      <option value="mega_kh">Химки</option>
      <option value="mega_dy">Дыбенко</option>
      <option value="mega_pa">Парнас</option>
      <option value="mega_ad">Адыгея-Кубань</option>
      <option value="mega_ek">Екатеринбург</option>
      <option value="mega_ka">Казань</option>
      <option value="mega_nn">Нижний Новгород</option>
      <option value="mega_no">Новосибирск</option>
      <option value="mega_om">Омск</option>
      <option value="mega_ro">Ростов-на-Дону</option>
      <option value="mega_sa">Самара</option>
      <option value="mega_uf">Уфа</option>
      <option value="mobile_ts">Мобильная Мега - Тёплый стан</option>
      <option value="mobile_bd">Мобильная Мега - Белая Дача</option>
      <option value="mobile_kh">Мобильная Мега - Химки</option>
      <option value="mobile_dy">Мобильная Мега - Дыбенко</option>
      <option value="mobile_pa">Мобильная Мега - Парнас</option>
      <option value="mobile_ad">Мобильная Мега - Адыгея-Кубань</option>
      <option value="mobile_ek">Мобильная Мега - Екатеринбург</option>
      <option value="mobile_ka">Мобильная Мега - Казань</option>
      <option value="mobile_nn">Мобильная Мега - Нижний Новгород</option>
      <option value="mobile_no">Мобильная Мега - Новосибирск</option>
      <option value="mobile_om">Мобильная Мега - Омск</option>
      <option value="mobile_ro">Мобильная Мега - Ростов-на-Дону</option>
      <option value="mobile_sa">Мобильная Мега - Самара</option>
      <option value="mobile_uf">Мобильная Мега - Уфа</option>          
    </select>
  renderPopup: (onSubmit, state)->
    div {className: "modal fade in", style: {display: "block"}, onClick: @checkClose},
      div {className: "modal-dialog"},
        div {className: "modal-content"},
          div {className: "modal-header"},
            h2 {className: "modal-title text-center"}, "Обратная связь"
          div {className: "modal-body"},
            h3 {className: "text-center"}, "Позвоните по телефону"
            div {className: "text-center"},
              a {className: "phone text-center", href:"tel:+79096523692", title:"Телефон поддержки"}, "+7 909 652 36 92"
            h3 {className: "text-center"}, "Или воспользуетесь связью через почту"
            form {className: "form_horizontal border-no margin_top_20", onSubmit: onSubmit},
              div {className: "form-group overflow_hidden"},
                input {type: "text", ref: "name", placeholder: "Имя*", className: if state.errors.name isnt undefined then "form-control error" else "form-control"}
                span({}, state.errors.name)
              div {className: "form-group overflow_hidden"},
                input {type: "email", ref: "email", placeholder: "E-mail*", className: if state.errors.email isnt undefined then "form-control error" else "form-control"}
                span({}, state.errors.email)
              div {className: "form-group"},
                @getMegaSelect()
              div {className: "form-group overflow_hidden"},
                textarea {ref: "text",placeholder: "Введите текст сообщения*", className: if state.errors.text isnt undefined then "form-control error" else "form-control"}
                span({}, state.errors.text)
              div {className: "form-group overflow_hidden text-center"},
                input {type: "submit", className: "btn btn-primary", value: "Отправить"}
            div {className: "modal-footer text-center overflow_hidden"},
              button {className: "btn btn-primary text-center", onClick: @props.close}, "Закрыть"
  render: ()->
    <SupportPopupComponent close={@props.close} render={@renderPopup} finish={@finish} getData={@getData} ref="main" />

AdminSupportComponent = React.createClass
  getInitialState: ->
    {opened: false}
  open: ->
    @setState {opened: true}
  close: ->
    @setState {opened: false}
  render:->
    <span>
      <span className="footer_desc" type="button" onClick={@open}>Поддержка</span>
      { <RenderInBody><AdminSupportPopupComponent close={@close} /></RenderInBody> if @state.opened }
    </span>

React.render <AdminSupportComponent/>, document.getElementById('support_place')