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
    
{ div, form, input, span, button, textarea, label, br, h2 } = React.DOM

window.SupportPopupComponent = React.createClass
  componentDidMount: ->
    $(@refs.text).autoResizer()
  getInitialState: ->
    {errors: {}}
  finish: ->
    if typeof @props.finish is "function" then @props.finish() else @_finish()
  _finish: ->
    $(@refs.form).removeClass "active"
    $(@refs.finish).addClass "active"
  getData: ->
    if @props.getData then @props.getData() else @_getData()
  _getData: ->
    res = 
      "name": @refs.name.value
      "email": @refs.email.value
      "text": @refs.text.value      
  onSubmit: (e)->
    e.preventDefault()
    @validate =>
      JCapi("/api/callback/", "POST", @getData())(=>
        @finish()
      )
  validate: (cb)->
    errors = {}
    if !/^[а-яА-Я\-]+$/.test @refs.name.value
      errors.name = "Некорректно заполнено поле \"Имя\""
    if @refs.text.value.replace(/\s/gi, "") is 0
      errors.text = "Введите текст обращения"

    if $.isEmptyObject(errors) then cb() else @setState {errors: errors}
  render: ->
    if typeof @props.render is "function" then @props.render(@onSubmit, @state) else @_render()
  _render: ->
    div {className: "popup active popup_prereg"},
      div {className: "popup_opacity", onClick: @props.close}
      div {className: "popup_content"},
        div {className: "container"},
          div {className: "row"},
            div {className: "col-sm-6 col-sm-offset-3 col-md-offset-6 text-center-xs"},
              div {className: "child child_support"},
                span {className: "close_popup", onClick: @props.close}, "+"
                div {className: "popup_prereg_input popup_prereg_block active", ref: "form"},
                  "Обратная связь",
                  <h2 className="callback">Обратная связь</h2>
                  @_renderForm()
                div {className: "popup_prereg_result popup_prereg_block", ref: "finish"},
                  div {className: "popup_prereg_result-flyer callback"}
                  span {className: "popup_prereg_result callback"}, "Cпасибо за ваше обращение!"
                  span {className: "popup_prereg_normal callback"}, "Служба поддержки уже начала обработку вашего обращения."
                  span {className: "popup_prereg_normal callback"}, "Мы вернемся к вам с ответом в течение нескольких часов."
                  button {className: "pull-left btn btn-info callback", onClick: @props.close}, "Закрыть"
              div {className: "helper"}
  _renderForm: ->
    form {className: "form_horizontal", onSubmit: @onSubmit},
      div {className: "form-group"},
        input {type: "text", ref: "name", placeholder: "Имя*", className: if @state.errors.name isnt undefined then "error" else ""}
        span({}, @state.errors.name)
      div {className: "form-group"},
        input {type: "email", ref: "email", placeholder: "E-mail*", className: if @state.errors.email isnt undefined then "error" else ""}
        span({}, @state.errors.email)
      div {className: "form-group"},
        textarea {ref: "text",placeholder: "Введите текст сообщения*", className: if @state.errors.text isnt undefined then "callback error" else "callback"}
        span({}, @state.errors.text)
      div {className: "form-group"}
        input {type: "submit", className: "btn btn-info callback", value: "Отправить"}
