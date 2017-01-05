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
    
{ div, form, input, span, button, label, br, h2 } = React.DOM

NewRegisterPopupComponent = React.createClass
  linkPhoto: ()->
    JCapi("/api/preregister/look", "POST", {"email": @refs.main.refs.email.value, "photo_id": @props.photo_id, "phone": @refs.main.refs.phone.value.replace(/\s/gi, "")})(()=>
      @refs.main.finish()
    )
  validate: (cb)->
    JCapi("/api/preregister/has", "POST", {"email": @refs.main.refs.email.value, "phone": @refs.main.refs.phone.value.replace(/\s/gi, "")})((res)=>
      if res.has
        @linkPhoto()
      else
        @refs.main._validate(cb)
    )
  afterSubmit: ()->
    @linkPhoto()
  render: ()->
    <RegisterPopupComponent close={@props.close} validate={@validate} afterSubmit={@afterSubmit} ref="main"/>


window.UploadPopupComponent = React.createClass
  componentDidMount: ->
    $(@refs.finish).hide()
    zone = new FileDrop 'upload_layout', {}
    zone.event 'send', (files)=>
      data = new FormData()
      data.append "document", files[0]

      xhr = new XMLHttpRequest()
      xhr.open("POST", "/api/upload_image")

      $(@refs.uploaded_image_wrapper).addClass "loading"
      @refs.uploaded_image.style['background-image'] = ''

      xhr.onreadystatechange = ()=>
        if ((xhr.readyState is 4) and (xhr.status is 200))
          $(@refs.uploaded_image_wrapper).removeClass "loading"
          @image_src = JSON.parse(xhr.responseText).src
          @refs.uploaded_image.style['background-image'] = 'url(/static/uploaded_images/' + @image_src + ')'
          $(@refs.finish).show()
      xhr.onerror = ()->
        $(@refs.uploaded_image_wrapper).removeClass "loading"
        sweetAlert window.language.global.error, "Расширение файла должно быть .jpg, .jpeg или .png!", "error"

      xhr.send(data)
    ga('send', 'event', 'reg', 'open_register_popap')

  uploadImage: (e)->
    data = new FormData()
    data.append "document", e.target.files[0]

    xhr = new XMLHttpRequest()
    xhr.open("POST", "/api/upload_image")

    $(@refs.uploaded_image_wrapper).addClass "loading"
    @refs.uploaded_image.style['background-image'] = ''

    xhr.onreadystatechange = ()=>
      if ((xhr.readyState is 4) and (xhr.status is 200))
        $(@refs.uploaded_image_wrapper).removeClass "loading"
        @image_src = JSON.parse(xhr.responseText).src
        @refs.uploaded_image.style['background-image'] = 'url(/static/uploaded_images/' + @image_src + ')'
        $(@refs.finish).show()
    xhr.onerror = ()->
      $(@refs.uploaded_image_wrapper).removeClass "loading"
      sweetAlert window.language.global.error, "Расширение файла должно быть .jpg, .jpeg или .png!", "error"

    xhr.send(data)
  openUpload: ()->
    @refs.uploaded_image.click()
  closeRegister: ()->
    React.unmountComponentAtNode(document.getElementById "upload_popup_place")
  submit: ()->
    ga('send', 'event', 'reg', 'register')
    JCapi("/api/photo", "POST", {"src": @image_src})((res)=>
      @registerPopup = React.createElement RenderInBody, null, React.createElement(NewRegisterPopupComponent, {
        "close": @closeRegister
        "photo_id": res._id
      })
      React.render @registerPopup, document.getElementById "upload_popup_place"
      @props.close()
    )
  render: ->
    div {className: "popup active popup_prereg popup_expert"},
      div {className: "popup_opacity", onClick: @props.close}
      div {className: "popup_content"},
        div {className: "container"},
          div {className: "row"},
            div {className: "col-xs-12 col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 text-center-xs"},
              div {className: "child expert_child"},
                span {className: "close_popup", onClick: @props.close}, "+"
                div {className: "popup_prereg_input popup_prereg_block overflow_hidden active", ref: "form"},
                  div {className: "col-md-6"},
                    div {className: "popup_photo_upload overflow_hidden", ref: "uploaded_image_wrapper", id: "upload_layout", onClick: @openUpload},
                      div {className: "popup_expert_imgblock", ref: "uploaded_image"}
                      input {className: "popup_photo_upload_input", type: "file", capture: "camera", ref: "upload_input", onChange: @uploadImage}
                  div {className: "col-md-6"},
                    h2 {className: "expert_page hidden-xs hidden-sm"}, "Загрузи своё фото!"
                    span {className: "popup_expert_text hidden-xs hidden-sm"},"Сомневаешься, нужна ли всё ещё тебе та или иная вещь? Брюки, похоже, вышли из моды, а кофта смотрится несуразно? Или это — следующий модный тренд?"
                    span {className: "popup_expert_text hidden-xs hidden-sm"},
                      span {className: "hidden-sm hidden-xs"}, "Загрузи фото лука, по поводу которого ты испытываешь сомнения, и наши эксперты моды подскажут тебе: оставить его или отдать или отнести в " 
                      span {className: "hidden-sm hidden-xs popup_expert_text_bold"}, "МЕГУ "
                      span {className: "hidden-sm hidden-xs"}, "на благотворительность или переработку, а также дадут полезный совет, как сделать твой образ ярче. "
                    div {ref: "finish"},
                      div {className: "popup_expert_upload active"},
                        span {, onClick: @openUpload}, "Загрузи другое фото"
                        input {type: "file", onChange: @uploadImage}
                      button {className: "btn btn-info margin_top_20", onClick: @submit}, "Отправить"
                div {id: "register_place"}
              div {className: "helper"}
