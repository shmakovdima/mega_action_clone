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
    $(@refs.status).chosen({"disable_search": true}).change =>
      @handleEdit()
    $(@refs.isPretty).chosen({"disable_search": true}).change =>
      @handleEdit()
  deletePhoto: ->
    swal {title: "Вы уверены?", text: "Удаление невозможно будет отменить", type: "warning", showCancelButton: true, confirmButtonText: "Да, удалить", cancelButtonText: "Нет", confirmButtonColor: "#4CAF50"}, (isConfirm)=>
      if isConfirm
        JCapi("/api/photo/uploaded/admin", "DELETE", {id: @props.photo._id})(()=>
          loadPage @props.filters
        )
  handleEdit: ->
    setTimeout =>
      JCapi("/api/photo/uploaded/admin", "PUT", {id: @props.photo._id, comment: @refs.comment.value, isPretty: @refs.isPretty.value, status: @refs.status.value})(()=>
        loadPage @props.filters
      )      
    , 0
  getSrc: ->
    "/static/uploaded_images/" + @props.photo.src
  getDate: ->
    moment(@props.photo.created_at).format "DD.MM.YYYY HH:mm:ss"
  getIsShared: ->
    if @props.photo.is_shared then "Да" else "Нет"
  getMayWin: ->
    if @props.photo.mayWin then "Да" else "Нет"
  getIsPretty: ->
    <select defaultValue={@props.photo.isPretty} onChange={@handleEdit} ref="isPretty">
      <option value="1">Оставить</option>
      <option value="0">Отдать</option>
    </select>
  getStatus: ->
    <select defaultValue={@props.photo.status} onChange={@handleEdit} ref="status">
      <option value="-1">Корзина</option>
      <option value="0">Новая</option>
      <option value="1">Ожидающая рассмотрения</option>
      <option value="2">Ожидающая одобрения</option>
      <option value="3">Одобренная</option>
    </select>
  getExpert: ->
    author = switch
      when @props.photo.comment_by is "olga1" then "Ольга Шелест"
      when @props.photo.comment_by is "olga2" then "Ольга Мальцева"
      when @props.photo.comment_by is "katya1" then "Екатерина Климова"
      when true then ""
  render: ->
    <tr>
      <td>
        {+moment(@props.photo.created_at)-1456779600000}
      </td>
      <td>
        <a ref="fancy" className="fansybox" href={@getSrc()} >
          <img className="img-responsive table-img img-thumbnail" src={@getSrc()} />
        </a>
      </td>
      <td>
        {moment(@props.photo.created_at).format("DD.MM.YY HH:mm:ss")}
      </td>
      <td>
        {@getMayWin() if @props.photo.mayWin isnt undefined}
      </td>
      <td>
        {@getIsShared()}
      </td>
      <td>
        {<textarea ref="comment" onBlur={@handleEdit} defaultValue={@props.photo.comment} /> if @props.photo.comment isnt undefined}
      </td>
      <td>
        {@getStatus()}
      </td>
      <td>
        {@getIsPretty() if @props.photo.isPretty isnt undefined}
      </td>
      <td>
        {@getExpert()}
      </td>
      <td>
        moderator1
      </td>
      <td>
        {moment(@props.photo.updated_at).format("DD.MM.YY HH:mm:ss") if @props.photo.updated_at}
      </td>
      <td className="text-center">
        <div className="btn btn-primary" onClick={@deletePhoto}>Удалить</div>
      </td>
    </tr>

PhotosTable = React.createClass
  render: ->
    console.log 
    <div className="table-responsive overflow_auto col-sm-12 margin_top_20">
      <table className="table-condensed table table-striped text-center margin_top_20 custab">
        <thead>
          <tr>
            <th className="text-center">ID</th>
            <th className="text-center">Фотография</th>
            <th className="text-center">Дата загрузки</th>
            <th className="text-center">Рекомендация <br /> на победителя</th>
            <th className="text-center">Расшарена</th>
            <th className="text-center">Комментарий эксперта</th>
            <th className="text-center">Статус</th>
            <th className="text-center">Рекомендация</th>
            <th className="text-center">Аккаунт эксперта</th>
            <th className="text-center">Аккаунт модератора</th>
            <th className="text-center">Дата модерации</th>
            <th className="text-center">Действие</th>
          </tr>
        </thead>
        <tbody>
          {<PhotoRow photo={photo} key={photo._id} filters={@props.filters} /> for photo in @props.photos}
        </tbody>
      </table>
    </div>

PhotosTablePagination = React.createClass
  goToPage: (e)->
    @props.filters.page = e.target.innerHTML
    loadPage @props.filters
  goPrev: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.filters.page = parseInt(@props.currentPage,10)-1
      loadPage @props.filters
  goNext: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.filters.page = parseInt(@props.currentPage,10)+1
      loadPage @props.filters
  render: ->
    <ul className="pagination">
      <li onClick={@goPrev} key="back" className={if 1 is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Назад">«</a></li>
      {<li key={i} className={if i is parseInt(@props.currentPage,10) then "active" else ""}><a href="#" onClick={@goToPage}>{i}</a></li> for i in [1..@props.totalPages]}
      <li onClick={@goNext} key="forward" className={if @props.totalPages is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Вперед">»</a></li>
    </ul>

PhotosFilters = React.createClass
  componentDidMount: ->
    $(@refs.date_start).datepicker
      ###
      monthNames: {"Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август", 
          "Сентябрь","Октябрь","Ноябрь","Декабрь"}
      dayNamesMin: {"Вс","Пн", "Вт", "Ср", "Чт", "Пт", "Сб"} ###
      firstDay: 1
      dateFormat: 'dd.mm.yy'
      maxDate: @props.date_end
      onSelect: (selectedDate)=>
        $(@refs.date_end).datepicker "option", "minDate", selectedDate
        @handleEdit()
      onSwitchChange: =>
        @handleEdit()
    $(@refs.date_end).datepicker
      ###
      monthNames: {"Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август", 
          "Сентябрь","Октябрь","Ноябрь","Декабрь"}
      dayNamesMin: {"Вс","Пн", "Вт", "Ср", "Чт", "Пт", "Сб"} ###
      firstDay: 1
      dateFormat: 'dd.mm.yy'
      minDate: @props.date_start
      onSelect: (selectedDate)=>
        $(@refs.date_start).datepicker "option", "maxDate", selectedDate
        @handleEdit()
      onSwitchChange: =>
        @handleEdit()
    $(@refs.status).chosen({"disable_search": true}).change =>
      @handleEdit()
    $(@refs.isPretty).chosen({"disable_search": true}).change =>
      @handleEdit()
  handleEdit: ->
    setTimeout =>
      @props.filters.isPretty = @refs.isPretty.value
      @props.filters.status = @refs.status.value
      @props.filters.date_start = @refs.date_start.value
      @props.filters.date_end = @refs.date_end.value
      @props.filters.page = 1
      loadPage @props.filters
  render: ->
    <div className="col-sm-12 margin_top_20">
      <form className="form_horizontal border-no">
        <h2 className="text-center overflow_hidden">Фильтры</h2>
        <div className="form-group margin_top_20 col-sm-12">
          <label className="col-sm-3 col-xs-12 control-label text-center font_size_20">Рекомендация</label>
          <div className="col-sm-9">
            <select defaultValue={@props.filters.isPretty} onChange={@handleEdit} ref="isPretty">
              <option value="-1">Все</option>
              <option value="1">Оставить</option>
              <option value="0">Отдать</option>
            </select>
          </div>
        </div>
        <div className="form-group margin_top_20 col-sm-12">
          <label className="col-sm-3 col-xs-12 control-label text-center font_size_20">Статус</label>
          <div className="col-sm-9">
            <select defaultValue={@props.filters.status} onChange={@handleEdit} ref="status">
              <option value="-2">Все</option>
              <option value="-1">Корзина</option>
              <option value="0">Новая</option>
              <option value="1">Ожидающая рассмотрения</option>
              <option value="2">Ожидающая одобрения</option>
              <option value="3">Одобренная</option>
            </select>
          </div>
        </div>
        <div className="form-group col-sm-12">
          <label className="col-sm-3 col-xs-12 control-label text-center font_size_20">Время</label>
          <label className="col-xs-1 control-label text-center font_size_20">С</label>
          <div className="col-xs-3">
            <input type="text" ref="date_start" defaultValue={@props.filters.date_start} className="date form-control" />
          </div>
          <label className="col-xs-1 control-label text-center font_size_20">По</label>
          <div className="col-xs-3">
            <input type="text" ref="date_end" defaultValue={@props.filters.date_end} className="date form-control" />
          </div>      
        </div>
      </form>
    </div>

PhotosSearchComponent = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+79999999999")
  search: (e)->
    e.preventDefault() if e isnt undefined
    setTimeout =>
      @props.filters.id = @refs.id.value
      @props.filters.phone = @refs.phone.value
      @props.filters.page = 1
      loadPage @props.filters
    , 0
  cancell: ->
    @refs.id.value = ""
    @refs.phone.value = ""
    @search()
  render: ->
    <div className="col-sm-12 margin_top_20">
      <h2 className="text-center"></h2>
      <form className="form_horizontal border-no margin_top_20 overflow_hidden">
        <div className="form-group">
          <label className="col-sm-3 col-xs-12 control-label text-center font_size_20">Поиск по id</label>
          <div className="input-group col-sm-8">
            <input ref="id" type="text" className="form-control phone" defaultValue={@props.filters.id} />
            <span className="input-group-btn">
              <button className="btn btn-secondary" onClick={@search}><i className="fa fa-search"></i></button>
            </span>
          </div>
        </div>
        <div className="form-group">
          <label className="col-sm-3 col-xs-12 control-label text-center font_size_20">Поиск по телефону</label>
          <div className="input-group col-sm-8">
            <input ref="phone" type="text" className="form-control phone" defaultValue={@props.filters.phone} />
            <span className="input-group-btn">
              <button className="btn btn-secondary" onClick={@search}><i className="fa fa-search"></i></button>
            </span>
          </div>
        </div>
        <div className="col-xs-12 text-center margin_top_20">
          <div className="btn-primary btn" onClick={@cancell}>Отмена</div>
        </div>
      </form>
    </div>

PhotosComponent = React.createClass
  render: ->
    <div>
      <h1 className="text-center">Загруженные фотографии</h1>
      <PhotosSearchComponent filters={@props.filters} />
      <PhotosFilters filters={@props.filters} />
      <PhotosTable photos={@props.photos} filters={@props.filters} currentPage={@props.currentPage} />
      <div className="container text-center">
        <PhotosTablePagination filters={@props.filters} currentPage={@props.currentPage} totalPages={@props.totalPages} />
      </div>
    </div>

loadPage = (filters)->
  JCapi("/api/photo/uploaded/admin", "GET", {filters: filters})((res)->
    totalPages = Math.round(res.total/20)+1
    React.render <PhotosComponent photos={res.photos} currentPage={filters.page} totalPages={totalPages} loadPage={loadPage} filters={filters} />, document.getElementById('uploaded_place')
  )

loadPage({page: 1})

# React.render <PhotosComponent photos=[] currentPage=1 totalPages=0 filters={page: 2, d: 2, day: moment().format("DD.MM.YY")} />, document.getElementById('uploaded_place')