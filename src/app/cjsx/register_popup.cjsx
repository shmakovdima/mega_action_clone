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
    
{ div, form, input, span, button, label, br } = React.DOM

window.RegisterPopupComponent = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+7 999 999 99 99")
    $('textarea').autoResizer()
    ga 'send', 'event', 'reg', 'register'
  getInitialState: ->
    {errors: {}}
  dropdownOpen: ->
    $(@refs.form).removeClass "active"
    $(@refs.dropdown).addClass "active"
  dropdownClose: ->
    $(@refs.form).addClass "active"
    $(@refs.dropdown).removeClass "active"  
  selectMega: (e)->
    $(e.target).siblings().removeClass "active"
    e.target.className = "active"
    @refs.mega.value = e.target.getAttribute "data-value"
    @refs.mega_text.value = e.target.innerHTML
    @dropdownClose()
  finish: ->
    $(@refs.form).removeClass "active"
    $(@refs.finish).addClass "active"
  onSubmit: (e)->
    e.preventDefault()
    @validate =>
      JCapi("/api/preregister/", "POST", {
        "fname": @refs.fname.value
        "lname": @refs.lname.value
        "email": @refs.email.value
        "phone": @refs.phone.value.replace(/\s/gi, "")
        "mega": @refs.mega.value
      })(=>
        ga 'send', 'event', 'reg', 'registered'
        if typeof @props.afterSubmit is "function" then @props.afterSubmit() else @finish()
      )((err)=>
        sweetAlert window.language.global.error, "Вы уже зарегистрированы!", "error" 
      )
  validate: (cb)->
    if typeof @props.validate is "function" then @props.validate(cb) else @_validate(cb)
  _validate: (cb)->
    errors = {}
    if !/^[а-яА-Я\-]+$/.test @refs.fname.value
      errors.fname = "Некорректно заполнено поле \"Имя\""
    if !/^[а-яА-Я\-]+$/.test @refs.lname.value
      errors.lname = "Некорректно заполнено поле \"Фамилия\""
    if !/^\+[0-9]{11}$/.test @refs.phone.value.replace(/\s/gi, "")
      errors.phone = "Поле \"Телефон\" не заполнено до конца"
    if (@refs.email.value.length isnt 0) and !/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test @refs.email.value
      errors.email = "Некорректный email"
    if @refs.mega.value.length is 0
      errors.mega = "Выберите Мегу"

    if $.isEmptyObject(errors) then cb() else @setState {errors: errors}
  render: ->
    div {className: "popup active popup_prereg"},
      div {className: "popup_opacity", onClick: @props.close}
      div {className: "popup_content"},
        div {className: "col-md-6 col-md-offset-6 text-center-xs text-center-sm"},
          div {className: "child"},
            span {className: "close_popup", onClick: @props.close}, "+"
            div {className: "popup_prereg_input popup_prereg_block active", ref: "form"},
              form {className: "form_horizontal", onSubmit: @onSubmit},
                div {className: "form-group"},
                  input {type: "text", ref: "fname", placeholder: "Имя*", className: if @state.errors.fname isnt undefined then "error" else ""}
                  span({}, @state.errors.fname)
                div {className: "form-group"},
                  input {type: "text", ref: "lname", placeholder: "Фамилия*", className: if @state.errors.lname isnt undefined then "error" else ""}
                  span({}, @state.errors.lname)
                div {className: "form-group"},
                  input {type: "email", ref: "email", placeholder: "E-mail", className: if @state.errors.email isnt undefined then "error" else ""}
                  span({}, @state.errors.email)
                div {className: "form-group"},
                  input {type: "tel", ref: "phone", placeholder: "Телефон*", className: if @state.errors.phone isnt undefined then "error phone" else "phone"}
                  span({}, @state.errors.phone)
                div {className: "form-group"},
                  input {type: "text", ref: "mega_text",readOnly: "readonly", placeholder: "Моя Мега*", onClick: @dropdownOpen, className: if @state.errors.mega isnt undefined then "error select_mega" else "select_mega"}
                  input {type: "hidden", ref: "mega"}
                  span({}, @state.errors.mega)
                div {className: "form-group checkbox"},
                  input {type: "checkbox", defaultChecked: "true", id: "checkbox-confirm", ref: "confirm"}
                  label {htmlFor: "checkbox-confirm"}, "Принимаю условия правил конкурса и даю согласие на обработку моих персональных данных"
                div {className: "form-group"}
                  input {type: "submit", className: "btn btn-info", value: "Отправить"}
            div {className: "popup_prereg_mega popup_prereg_block", ref: "dropdown"},
              span {className: "city"}, "Москва"
              span {"data-value": "0", onClick: @selectMega}, "Тёплый стан"
              span {"data-value": "1", onClick: @selectMega}, "Белая дача"
              span {"data-value": "2", onClick: @selectMega}, "Химки"
              span {className: "city"}, "Санкт-Петербург"
              span {"data-value": "3", onClick: @selectMega}, "Дыбенко"
              span {"data-value": "4", onClick: @selectMega}, "Парнас"
              span {className: "city"}, "Другие города"
              span {"data-value": "5", onClick: @selectMega}, "Адыгея-Кубань"
              span {"data-value": "6", onClick: @selectMega}, "Екатеринбург"
              span {"data-value": "7", onClick: @selectMega}, "Казань"
              span {"data-value": "8", onClick: @selectMega}, "Нижний Новгород"
              span {"data-value": "9", onClick: @selectMega}, "Новосибирск"
              span {"data-value": "10", onClick: @selectMega}, "Омск"
              span {"data-value": "11", onClick: @selectMega}, "Ростов-на-Дону"
              span {"data-value": "12", onClick: @selectMega}, "Самара"
              span {"data-value": "13", onClick: @selectMega}, "Уфа"
              span {className: "my_mega", onClick: @dropdownClose}, "Моя Мега"
            div {className: "popup_prereg_result popup_prereg_block", ref: "finish"},
              div {className: "popup_prereg_result-flyer"}
              span {className: "popup_prereg_result"}, "Спасибо!"
              span {className: "popup_prereg_normal"}, "Мы расскажем вам о старте конкурса, как только он начнется. Ждите перемен!"
              button {className: "pull-left btn btn-info", onClick: @props.close}, "Закрыть"
          div {className: "helper"}