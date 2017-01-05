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
  getButtonText: ->
    if @props.winner is "ok" then "Удалить" else "Выиграл"
  proceed: (e)->
    e.preventDefault()
    JCapi("/api/photo/winner/" + @props.photo._id , if @props.winner is "ok" then "DELETE" else "POST")(()=>
      loadPage @props.currentPage, @props.d
    )
    # React.render <PhotoComponent photo={@props.photo} currentPage={@props.currentPage}/>, document.getElementById('photos_place')
  render: ->
    <tr>
      {<td>{parseInt(@props.i, 10)+1}</td> if @props.winner is "ok"}
      <td>{@props.photo._id}</td>
      <td>
        <a ref="fancy" className="fansybox" href={@getSrc()} >
          <img className="img-responsive table-img img-thumbnail" src={@getSrc()} />
        </a>
      </td>
      <td>
        {@getMayWin()}
      </td>
      <td>
        {@getDate()}
      </td>
      <td>
        {@props.photo.phone}
      </td>
      <td className="text-center">
        <a href="#" className="btn btn-primary" onClick={@proceed}>{@getButtonText()}</a>
      </td>
    </tr>

PhotosTable = React.createClass
  render: ->
    console.log 
    <div className="overflow_auto table-responsive">
      <table className="table-condensed table table-striped text-center margin_top_20">
        <thead>
          <tr>
            {<th className="text-center">Номер победителя</th> if @props.winners is "ok"}
            <th className="text-center">ID</th>
            <th className="text-center">Фотография</th>
            <th className="text-center">Рекомендация</th>
            <th className="text-center">Дата</th>
            <th className="text-center">Телефон</th>
            <th className="text-center">Действие</th>
          </tr>
        </thead>
        <tbody>
          {<PhotoRow winner={@props.winners} photo={photo} key={photo._id} loadPage={@props.loadPage} currentPage={@props.currentPage} d={@props.d} i={i} /> for i, photo of @props.photos}
        </tbody>
      </table>
    </div>

PhotosTablePagination = React.createClass
  goToPage: (e)->
    @props.loadPage e.target.innerHTML, @props.d
  goPrev: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.loadPage parseInt(@props.currentPage,10)-1, @props.d
  goNext: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.loadPage parseInt(@props.currentPage,10)+1, @props.d
  render: ->
    <ul className="pagination">
      <li onClick={@goPrev} key="back" className={if 1 is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Назад">«</a></li>
      {<li key={i} className={if i is parseInt(@props.currentPage,10) then "active" else ""}><a href="#" onClick={@goToPage}>{i}</a></li> for i in [1..@props.totalPages]}
      <li onClick={@goNext} key="forward" className={if @props.totalPages is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Вперед">»</a></li>
    </ul>

PhotosFilterComponent = React.createClass
  getHandler: (d)->
    ()=>
      loadPage 1, d, @props.owner
  render: ->
    <div className="col-sm-12 margin_top_20">
      <div className="col-sm-3 text-center margin_top_10">
        <div className="btn-primary btn btn-block" onClick={@getHandler(1)}>9 марта - 15 марта</div>
      </div>
      <div className="col-sm-3 text-center margin_top_10">
        <div className="btn-primary btn btn-block" onClick={@getHandler(2)}>16 марта - 22 марта</div>
      </div>
      <div className="col-sm-3 text-center margin_top_10">
        <div className="btn-primary btn btn-block" onClick={@getHandler(3)}>23 марта - 29 марта</div>
      </div>
      <div className="col-sm-3 text-center margin_top_10">
        <div className="btn-primary btn btn-block" onClick={@getHandler(4)}>30 марта - 9 апреля</div>
      </div>
    </div>

PhotosSearchComponent = React.createClass
  search: (e)->
    e.preventDefault()

    setTimeout ()=>
      loadPage 1, 1, @refs.owner.value
    , 0
  cancell: ->
    @refs.owner.value = ""
    loadPage 1, 1, ""
  render: ->
    <div className="col-sm-12 margin_top_20">
      <h2 className="text-center"></h2>
      <form className="form_horizontal border-no margin_top_20 overflow_hidden">
        <div className="form-group">
          <label className="col-sm-3 col-xs-12 control-label text-center font_size_20">Поиск</label>
          <div className="input-group col-sm-8">
            <input ref="owner" type="text" className="form-control phone" defaultValue={@props.owner} />
            <span className="input-group-btn">
              <button className="btn btn-secondary" onClick={@search}><i className="fa fa-search"></i></button>
            </span>
          </div>
          <div className="col-xs-12 text-center margin_top_20">
            <div className="btn-primary btn" onClick={@cancell}>Отмена</div>
          </div>
        </div>
      </form>
    </div>

PhotosComponent = React.createClass
  toggleTables: (e)->
    e.preventDefault()
    loadPage 1, if parseInt(@props.status, 10) is 2 then 3 else 2
  getWeekText: (d)->
    res = switch
      when d is 1 then "9 марта - 15 марта"
      when d is 2 then "16 марта - 22 марта"
      when d is 3 then "23 марта - 29 марта"
      when d is 4 then "30 марта - 9 апреля"
  render: ->
    <div>
      <h1 className="text-center">Панель победителей фотоконкурса</h1>
      <PhotosFilterComponent owner={@props.owner} />
      <div className="col-sm-12 margin_top_20">
        <h2 className="text-center">{@getWeekText(@props.d)}</h2>
      </div>
      <PhotosSearchComponent owner={@props.owner} />      
      <div className="col-sm-12 margin_top_20  ">
        <h2 className="text-center">Таблица победителей</h2>
        <PhotosTable winners="ok" photos={@props.winners} currentPage={@props.currentPage} d={@props.d} />
      </div>
      <div className="col-sm-12 margin_top_20  ">
        <h2 className="text-center">Таблица участников</h2>
        <PhotosTable photos={@props.photos} loadPage={@props.loadPage} currentPage={@props.currentPage} d={@props.d} />
      </div>
      <div className="container text-center">
        <PhotosTablePagination currentPage={@props.currentPage} d={@props.d} totalPages={@props.totalPages} loadPage={@props.loadPage} />
      </div>
    </div>

loadPage = (num, d=1, owner="")->
  JCapi("/api/photo/winner", "GET", {page: num, date: d, owner: owner})((res)->
    totalPages = Math.round(res.total/20)+1
    React.render <PhotosComponent owner={owner} winners={res.winners} photos={res.photos} d={d} currentPage={num} totalPages={totalPages} loadPage={loadPage} status={status}/>, document.getElementById('winners_place')
  )
loadPage(1, 1)