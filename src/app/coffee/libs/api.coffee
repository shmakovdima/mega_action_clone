JCapi_used_emails = {}
window.JCapi = (url, method='GET', data={}, force=false)->
  if JCapi_used_emails[url] is undefined
    callbacks = {}
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
    return (success)->
      callbacks['success'] = success
      return (fail)->
        callbacks['fail'] = fail
  else
    sweetAlert window.language.global.error, "Это действие уже выполняется, подождите", "error"

window.JCapi_2 = (url, method='GET', data={}, cb, eb)->
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
          eb(data) if typeof eb is 'function'
        else
          cb(data) if typeof cb is 'function'
      fail: (data)->
        JCapi_used_emails[url] = undefined
        eb(data) if typeof eb is 'function'
      error: ()->
        JCapi_used_emails[url] = undefined
        eb() if typeof eb is 'function'
  else
    sweetAlert window.language.global.error, "Это действие уже выполняется, подождите", "error"