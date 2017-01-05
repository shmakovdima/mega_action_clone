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
    
{ div, form, input, span, button, label, br, a, h2 } = React.DOM

window.BalancePopupComponent = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+7 999 999 99 99")
    ga('send', 'event', 'reg', 'open_balance_popap')
  getInitialState: ->
    {errors: {}}
  finish: (balance)->
    if (window.City.region == "08")
      @refs.balance_container.innerHTML = balance+" рублей"
    else
      @refs.balance_container.innerHTML = "Акция закончилась"
    $(@refs.form).removeClass "active"
    $(@refs.finish).addClass "active"
  onSubmit: (e)->
    e.preventDefault()
    @validate =>
      JCapi("/api/preregister/balance", "GET", {
        "phone": @refs.phone.value.replace(/\s/gi, "")
      })((res)=>
        if typeof @props.afterSubmit is "function" then @props.afterSubmit() else @finish(res.balance)
      )((err)=>
        sweetAlert window.language.global.error, "Номер не зарегистрирован", "error" 
      )
  validate: (cb)->
    if typeof @props.validate is "function" then @props.validate(cb) else @_validate(cb)
  _validate: (cb)->
    errors = {}
    if !/^\+[0-9]{11}$/.test @refs.phone.value.replace(/\s/gi, "")
      errors.phone = "Поле \"Телефон\" не заполнено до конца"

    if $.isEmptyObject(errors) then cb() else @setState {errors: errors}
  render: ->
    div {className: "popup active popup_prereg popup_prereg_balance"},
      div {className: "popup_opacity", onClick: @props.close}
      div {className: "popup_content"},
        div {className: "col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-6 text-center-xs"},
          div {className: "child child_check background_color_transparent"},
            div {className: "popup_check"},
              span {className: "close_popup", onClick: @props.close}, "+"
              div {className: "popup_prereg_input popup_prereg_block active", ref: "form"},
                h2 {}, "Проверить баланс"
                form {className: "form-horizontal", onSubmit: @onSubmit},
                  div {className: "form-group"},
                    input {type: "tel", ref: "phone", placeholder: "Телефон*", className: if @state.errors.phone isnt undefined then "error phone" else "phone"}
                    span({}, @state.errors.phone)
                  div {className: "form-group"}
                    input {type: "submit", className: "btn btn-info callback", value: "Отправить"}
              div {className: "popup_prereg_input popup_prereg_block", ref: "finish"},
                h2 {}, "Ваш баланс"
                div {className: "popup_balance no_img", ref: "balance_container"}
                button {className: "pull-left btn btn-info callback second", onClick: @props.close}, "Закрыть"
            div {className: "helper"}
          div {className: "helper"}