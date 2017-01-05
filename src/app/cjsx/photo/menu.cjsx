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
    
{ div, form, input, span, button, label, br, a } = React.DOM

MenuComponent = React.createClass
  getInitialState: ->
    {opened: false}
  open: (e)->
    e.preventDefault();
    @setState {opened: true}
  close: ->
    @setState {opened: false}
  render:->
    <div>
      <a className="expert_menu_item expert_menu_item_3" href="#" onClick={@open}>Загрузить лук</a>
      { <RenderInBody><UploadPopupComponent close={@close} /></RenderInBody> if @state.opened }
    </div>
    

    
React.render <MenuComponent/>, document.getElementById('menu_place')