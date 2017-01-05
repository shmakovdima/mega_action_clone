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

{ form, input } = React.DOM
LoginComponent = React.createClass
  submitForm: (e)->
    e.preventDefault()
    @validate ->
      location.reload()
  validate: (cb)->
    if @refs.login.value.length is 0
      sweetAlert window.language.global.error, window.language.enter.nologin, "error"
    else if @refs.password.value.length is 0
      sweetAlert window.language.global.error, window.language.enter.nopassword, "error"
    else
      JCapi("/api/users/login", "POST",
        login: @refs.login.value.toLowerCase()
        password: @refs.password.value.toLowerCase()
      )(cb)(()->
        sweetAlert window.language.global.error, window.language.enter.error, "error" 
      )
  render: ->
    form {className: "login_form_enter_form", onSubmit: @submitForm},
      input {type: "text", ref:"login", placeholder: "Логин", className: "form-control"}
      input {type: "password", ref:"password", placeholder: "Пароль", className: "form-control"}
      input {type: "submit", value: "Войти", className: "btn login_form_btn"}
    
React.render <LoginComponent/>, document.getElementById('form_place')