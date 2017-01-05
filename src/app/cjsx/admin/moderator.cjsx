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
          
PhotoComponent = React.createClass
  componentDidMount: ->
    $(@refs.aw).hide()
    $(@refs.fancy).fancybox
      openEffect: 'elastic'
      closeEffect: 'elastic'
  goBack: (e)->
    e.preventDefault() if e isnt undefined
    loadPage(@props.currentPage, @props.photo.status)
  getSrc: ()->
    "/static/uploaded_images/" + @props.photo.src
  updatePhoto: (status)->
    JCapi("/api/photo/moderator", "PUT", {_id: @props.photo._id, comment: @refs.comment.value, mayWin: @refs.mayWin.checked, isPretty: @refs.isPretty.checked, status: status, comment_by: @props.photo.comment_by, src: @props.photo.src})((res)=>
      @goBack()
    )
  submitPhoto: (e)->
    e.preventDefault()
    @updatePhoto(3)
  deletePhoto: (e)->
    e.preventDefault()
    @updatePhoto(0)
  declinePhoto: (e)->
    e.preventDefault()
    @updatePhoto(1)
  getRotateHandler: (degree)->
    (e)=>
      e.preventDefault()
      $(@refs.fancy).hide()
      $(@refs.aw).show()
      JCapi("/api/photo/"+@props.photo._id+"/rotate", "POST", {degree: degree})(()=>
        $(@refs.fancy).show()
        $(@refs.aw).hide()
        @refs.thumb.src = @getSrc() + "?rand=" + Math.random()
      )
  render: ->
    <div>
      <h1 className="text-left">
        {@props.photo._id}
        <a className="btn btn-primary pull-right" href="#" onClick={@goBack}>Назад</a>
      </h1>
      <div className="margin-top20">
        <div className="col-sm-5">
          <a ref="fancy" className="fansybox" href={@getSrc()} >
            <img ref="thumb" className="img-responsive img-rounded" src={@getSrc()} />
          </a>
          <span className="admin_waiting" ref="aw"></span>
          <div className="col-xs-12 margin_top_20">
            <div className="col-xs-6 text-center">
              <button onClick={@getRotateHandler(-90)} className="btn btn-primary" title="Повернуть влево">
                <i className="fa fa-rotate-left"></i>
              </button>
            </div>
            <div className="col-xs-6 text-center">
              <button onClick={@getRotateHandler(90)} className="btn btn-primary" title="Повернуть вправо">
                <i className="fa fa-rotate-right"></i>
              </button>
            </div>
          </div>
        </div>
        <div className="col-sm-7">
          <form className="form-horizontal child">
            <h2 className="text-center padding-5 border-no">Оставьте отзыв</h2>
            <div className="form-group overflow-hidden">
              <div className="col-xs-12 text-left">
                <label className="control-label">Комментарий эксперта</label>
              </div>
              <div className="col-xs-12">
                <textarea ref="comment" placeholder="Введите ваш комментарий" className="textarea_comments form-control">{@props.photo.comment}</textarea>
              </div>
            </div>
            <div className="form-group overflow-hidden">
              <div className="col-xs-12 text-center">
                <label className="control-label">Ваша оценка</label>
              </div>
              <div className="col-xs-6 text-center">
                <div className="radio-thumb radio-thumb-up pull-right">
                  <label className="text-right">
                    {<input type="radio" name="choise" value="true" defaultChecked="true" ref="isPretty" /> if @props.photo.isPretty}
                    {<input type="radio" name="choise" value="true" ref="isPretty" /> if !@props.photo.isPretty}
                    <i className="fa fa-thumbs-up"></i>
                  </label>
                </div>
              </div>
              <div className="col-xs-6 text-center">
                <div className="radio-thumb radio-thumb-down pull-left">
                  <label>
                    {<input type="radio" name="choise" value="false"/> if @props.photo.isPretty}
                    {<input type="radio" name="choise" defaultChecked="true" value="false"/> if !@props.photo.isPretty}
                    <i className="fa fa-thumbs-down"></i>
                  </label>
                </div>
              </div>
            </div>
            <div className="form-group overflow-hidden">
              <div className="col-xs-12 text-center">
                <label className="col-sm-6 control-label text-right">Рекомендовать как победителя</label>
                <div className="col-sm-6 checkbox text-left">
                  {<label className="text-left"><input type="checkbox" ref="mayWin" defaultChecked="true" /> Рекомендовать</label> if @props.photo.mayWin}
                  {<label className="text-left"><input type="checkbox" ref="mayWin" /> Рекомендовать</label> if !@props.photo.mayWin}
                </div>
              </div>
            </div>
            <div className="form-group margin_top_40 text-center">
              <div className="col-md-4 text-center margin_top_20 form-group">
                <button className="btn btn-primary" onClick={@submitPhoto}>Одобрить отзыв</button>
              </div>
              <div className="col-md-4 text-center margin_top_20 form-group">
                <button className="btn btn-primary" onClick={@declinePhoto}>Вернуть экспертам</button>
              </div>
              <div className="col-md-4 text-center margin_top_20 form-group">
                <button className="btn btn-primary" onClick={@deletePhoto}>Удалить фото</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
PhotoRow = React.createClass
  componentDidMount: ->
    $(@refs.fancy).fancybox
      openEffect: 'elastic'
      closeEffect: 'elastic'
  getSrc: ->
    "/static/uploaded_images/" + @props.photo.src
  getDate: ->
    moment(@props.photo.created_at).format "DD.MM.YYYY HH:mm:ss"
  getMayWin: ->
    if @props.photo.mayWin then "Да" else "Нет"
  getStatus: ->
    st = parseInt @props.photo.status, 10
    res = switch
      when st is 2 then "Ожидающая одобрения"
      when st is 3 then "Одобренная"
      when st is 0 then "Удалённая"
  proceed: (e)->
    e.preventDefault()
    React.render <PhotoComponent photo={@props.photo} currentPage={@props.currentPage}/>, document.getElementById('photos_place')
  render: ->
    <tr>
      <td>
        {@props.photo._id}
      </td>
      <td>
        <a ref="fancy" className="fansybox" href={@getSrc()} >
          <img className="img-responsive table-img img-thumbnail" src={@getSrc()} />
        </a>
      </td>
      <td>
      </td>
      <td>
        {@getMayWin()}
      </td>
      <td>
        {@getDate()}
      </td>
      <td>
        {@props.photo.owner.lname}
      </td>
      <td>
        {@props.photo.owner.fname}
      </td>
      <td className="text-center">
        {@getStatus()}
      </td>
      <td className="text-center">
        <a href="#" className="btn btn-primary" onClick={@proceed}>Изменить</a>
      </td>
    </tr>

PhotosTable = React.createClass
  render: ->
    console.log 
    <div className="overflow_auto table-responsive">
      <table className="table-condensed table table-striped text-center margin_top_20">
        <thead>
          <tr>
            <th className="text-center">ID</th>
            <th className="text-center">Фотография</th>
            <th className="text-center">Модератор</th>
            <th className="text-center">Рекомендация <br /> на победителя</th>
            <th className="text-center">Дата</th>
            <th className="text-center">Фамилия</th>
            <th className="text-center">Имя</th>
            <th className="text-center">Статус</th>
            <th className="text-center">Действие</th>
          </tr>
        </thead>
        <tbody>
          {<PhotoRow photo={photo} key={photo._id} loadPage={@props.loadPage} currentPage={@props.currentPage} /> for photo in @props.photos}
        </tbody>
      </table>
    </div>

PhotosTablePagination = React.createClass
  goToPage: (e)->
    @props.loadPage e.target.innerHTML, @props.status
  goPrev: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.loadPage parseInt(@props.currentPage,10)-1, @props.status
  goNext: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.loadPage parseInt(@props.currentPage,10)+1, @props.status
  render: ->
    <ul className="pagination">
      <li onClick={@goPrev} key="back" className={if 1 is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Назад">«</a></li>
      {<li key={i} className={if i is parseInt(@props.currentPage,10) then "active" else ""}><a href="#" onClick={@goToPage}>{i}</a></li> for i in [1..@props.totalPages]}
      <li onClick={@goNext} key="forward" className={if @props.totalPages is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Вперед">»</a></li>
    </ul>

PhotosComponent = React.createClass
  getHeader: ->
    s = parseInt(@props.status, 10)
    res = switch
      when s is 2 then "Ожидающие одобрения"
      when s is 3 then "Одобренные фотографии"
      when s is 0 then "Корзина"
  getButton: ->
    if parseInt(@props.status, 10) is 3 then "Ожидающие одобрения" else "Одобренные фотографии"
  toTrash: (e)->
    e.preventDefault()
    loadPage 1, 0
  toggleTables: (e)->
    e.preventDefault()
    loadPage 1, if parseInt(@props.status, 10) is 2 then 3 else 2
  render: ->
    <div>
      <h1 className="text-center">{@getHeader()}</h1>
      <div className="row margin_top_20">
        <div className="col-xs-12 text-center">
          <a href="#" className="btn btn-primary pull-left" onClick={@toggleTables}>{@getButton()}</a>
          <a href="#" className="btn-primary btn pull-right" onClick={@toTrash}>Корзина</a>
        </div>
      </div>
      <PhotosTable photos={@props.photos} loadPage={@props.loadPage} currentPage={@props.currentPage} />
      <div className="container text-center">
        <PhotosTablePagination status={@props.status} currentPage={@props.currentPage} totalPages={@props.totalPages} loadPage={@props.loadPage} />
      </div>
    </div>

loadPage = (num, status)->
  JCapi("/api/photo/moderator", "GET", {page: num, status: status})((res)->
    totalPages = Math.round(res.total/20)+1
    React.render <PhotosComponent photos={res.photos} currentPage={num} totalPages={totalPages} loadPage={loadPage} status={status}/>, document.getElementById('photos_place')
  )
loadPage(1, 2)