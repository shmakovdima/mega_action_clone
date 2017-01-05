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
    loadPage(@props.currentPage)
  getSrc: ()->
    "/static/uploaded_images/" + @props.photo.src
  onSubmit: (e)->
    e.preventDefault()
    JCapi("/api/photo/expert", "PUT", {_id: @props.photo._id, comment: @refs.comment.value, mayWin: @refs.mayWin.checked, isPretty: @refs.isPretty.checked})((res)=>
      @goBack()
    )
  getRotateHandler: (degree)->
    (e)=>
      e.preventDefault()
      $(@refs.aw).show()
      $(@refs.fancy).hide()
      JCapi("/api/photo/"+@props.photo._id+"/rotate_expert", "POST", {degree: degree})(()=>
        @refs.thumb.src = @getSrc() + "?rand=" + Math.random()
        $(@refs.fancy).show()
        $(@refs.aw).hide()
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
          <form className="form-horizontal child" onSubmit={@onSubmit}>
            <h2 className="text-center padding-5 border-no">Оставьте отзыв</h2>
            <div className="form-group overflow-hidden">
              <div className="col-xs-12">
                <textarea ref="comment" placeholder="Введите ваш комментарий" className="textarea_comments form-control">{@props.photo.comment}</textarea>
              </div>
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
                  <label className="text-left"><input type="checkbox" ref="mayWin" /> Рекомендовать</label>
                </div>
              </div>
            </div>
            <div className="form-group margin_top_40 text-center">
              <input type="submit" className="btn btn-primary" value="Отправить на модерацию" />
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
  getSrc: ()->
    "/static/uploaded_images/" + @props.photo.src
  getDate: ()->
    moment(@props.photo.created_at).format "DD.MM.YYYY HH:mm:ss"
  proceed: (e)->
    e.preventDefault()
    React.render <PhotoComponent photo={@props.photo} currentPage={@props.currentPage} />, document.getElementById('photos_place')
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
        {@getDate()}
      </td>
      <td>
        {@props.photo.owner.lname}
      </td>
      <td>
        {@props.photo.owner.fname}
      </td>
      <td className="text-center">
        Новая
      </td>
      <td className="text-center">
        <a href="#" className="btn btn-primary" onClick={@proceed}>Обработать</a>
      </td>
    </tr>

PhotosTable = React.createClass
  render: ->
    console.log 
    <div className="overflow_auto">
      <table className="table-condensed table table-striped text-center margin_top_20">
        <thead>
          <tr>
            <th className="text-center">ID</th>
            <th className="text-center">Фотография</th>
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
    @props.loadPage e.target.innerHTML
  goPrev: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.loadPage parseInt(@props.currentPage,10)-1
  goNext: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.loadPage parseInt(@props.currentPage,10)+1
  render: ->
    <ul className="pagination">
      <li onClick={@goPrev} key="back" className={if 1 is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Назад">«</a></li>
      {<li key={i} className={if i is parseInt(@props.currentPage,10) then "active" else ""}><a href="#" onClick={@goToPage}>{i}</a></li> for i in [1..@props.totalPages]}
      <li onClick={@goNext} key="forward" className={if @props.totalPages is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Вперед">»</a></li>
    </ul>

PhotosComponent = React.createClass
  render: ->
    <div>
      <h1 className="text-center">Новые фотографии</h1>
      <PhotosTable photos={@props.photos} loadPage={@props.loadPage} currentPage={@props.currentPage} />
      <div className="container text-center">
        <PhotosTablePagination currentPage={@props.currentPage} totalPages={@props.totalPages} loadPage={@props.loadPage} />
      </div>
    </div>

loadPage = (num)->
  JCapi("/api/photo/expert", "GET", {page: num})((res)->
    totalPages = Math.round(res.total/20)+1
    React.render <PhotosComponent photos={res.photos} currentPage={num} totalPages={totalPages} loadPage={loadPage} />, document.getElementById('photos_place')
  )
loadPage(1)