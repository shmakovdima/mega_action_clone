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
    
UserRow = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+79999999999")
    $(@refs.mega).chosen({"disable_search": true}).change =>
      @handleEdit()
    $(@refs.initial_active).chosen({"disable_search": true}).change =>
      @handleEdit()
  handleRemove: ->
    swal {title: "Вы уверены?", text: "Удаление невозможно будет отменить", type: "warning", showCancelButton: true, confirmButtonText: "Да, удалить", cancelButtonText: "Нет", confirmButtonColor: "#4CAF50"}, (isConfirm)=>
      if isConfirm
        JCapi("/api/preregister_new/" + @props.user._id, "DELETE")(=>
          loadPage @props.filters
        )
  setData: (user)->
    @refs.fname.value = user.fname
    @refs.lname.value = user.lname
    @refs.email.value = user.email
  getData: ->
    new_balance = parseInt @refs.balance.value, 10
    for t in @props.user.transactions
      new_balance += parseInt t.sum, 10
    return {fname: @refs.fname.value, lname: @refs.lname.value, mega: @refs.mega.value, email: @refs.email.value, initial_active: @refs.initial_active.value, balance: new_balance}
  handleEdit: ->
    id = @props.user._id
    JCapi("/api/preregister_new/" + @props.user._id, "PUT", @getData())((res)=>
      @props.user = res
    )(()=>
      @setData @props.user
    )
  getRealBalance: (balance, transactions)->
    res = balance
    for transaction in transactions
      res -= transaction.sum
    rounded = Math.round(res)
    return if (res-rounded) < 0.5 then rounded else rounded + 1
  getInitialActive: ->
    p = @props.user
    res = switch
      when p.initial_active isnt undefined then p.initial_active
      when (p.weight.length is 0) and (p.looks.length is 0) then "0"
      when (p.weight.length is 0) or ((p.looks.length isnt 0) and moment(p.weight[0].created_at).isAfter(moment(p.looks[0].created_at))) then "1"
      when true then "2"
  render: ->
    <tr>
      <td>
        <input onBlur={@handleEdit} ref="fname" type="text" defaultValue={@props.user.fname} className="text-center" />
      </td>
      <td>
        <input onBlur={@handleEdit} ref="lname" type="text" defaultValue={@props.user.lname} className="text-center" />
      </td>
      <td className="text-center">
        {@props.user.phone}
      </td>
      <td>
        <input onBlur={@handleEdit} ref="email" type="text" defaultValue={@props.user.email} className="text-center" />
      </td>
      <td>
        <select ref="initial_active" defaultValue={@getInitialActive()}>
          <option value="2">Вес</option>
          <option value="1">Фото</option>
          <option value="0">Тизер</option>
        </select>
      </td>
      <td>
        <select onChange={@handleEdit} ref="mega" data-width="100%" defaultValue={@props.user.mega}>
          <option value="0">Тёплый стан</option>
          <option value="1">Белая Дача</option>
          <option value="2">Химки</option>
          <option value="3">Дыбенко</option>
          <option value="4">Парнас</option>
          <option value="5">Адыгея-Кубань</option>
          <option value="6">Екатеринбург</option>
          <option value="7">Казань</option>
          <option value="8">Нижний Новгород</option>
          <option value="9">Новосибирск</option>
          <option value="10">Омск</option>
          <option value="11">Ростов-на-Дону</option>
          <option value="12">Самара</option>
          <option value="13">Уфа</option>
        </select>
      </td>
      <td className="text-center">
        {@props.user.transactions.length}
      </td>
      <td>
        <input onBlur={@handleEdit} type="text" defaultValue={@getRealBalance(@props.user.balance, @props.user.transactions)} ref="balance" className="text-center" />
      </td>
      <td className="text-center">
        {@props.user.verify_code}
      </td>
      <td className="text-center">
        <span onClick={@handleRemove} className="remove">+</span>
      </td>
    </tr>

UsersTable = React.createClass
  render: ->
    <div className="table-responsive overflow_auto col-sm-12 margin_top_20">
      <table className="table table-striped custab users_layout">
        <thead>
          <tr>
            <th className="text-center">Имя</th>
            <th className="text-center">Фамилия</th>
            <th className="text-center">Телефон</th>
            <th className="text-center">Email</th>
            <th className="text-center">Первая активность</th>
            <th className="text-center">Мега</th>
            <th className="text-center">Кол-во выданных карт</th>
            <th className="text-center">Баланс</th>
            <th className="text-center">Код</th>
            <th className="text-center">Действие</th>
          </tr>
        </thead>
        <tbody>
          {<UserRow user={user} key={user._id} filters={@props.filters} /> for user in @props.users}
        </tbody>
      </table>
    </div>

UsersFilters = React.createClass
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
    $(@refs.mega).chosen({"disable_search": true}).change =>
      @handleEdit()
  handleEdit: ->
    setTimeout =>
      @props.filters.date_start = @refs.date_start.value
      @props.filters.date_end = @refs.date_end.value
      @props.filters.mega = @refs.mega.value
      @props.filters.page = 1
      loadPage @props.filters
  render: ->
    <div className="col-sm-12 margin_top_20">
      <form className="form_horizontal border-no">
        <h2 className="text-center overflow_hidden">Фильтры</h2>
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
        <div className="form-group col-sm-12">
          <label className="col-sm-3 control-label text-center font_size_20">Мега</label>
          <div className="col-sm-9">
            <select onChange={@handleEdit} ref="mega" data-width="100%" defaultValue={@props.filters.mega}>
              <option value="-1">Все Меги</option>
              <option value="0">Тёплый стан</option>
              <option value="1">Белая Дача</option>
              <option value="2">Химки</option>
              <option value="3">Дыбенко</option>
              <option value="4">Парнас</option>
              <option value="5">Адыгея-Кубань</option>
              <option value="6">Екатеринбург</option>
              <option value="7">Казань</option>
              <option value="8">Нижний Новгород</option>
              <option value="9">Новосибирск</option>
              <option value="10">Омск</option>
              <option value="11">Ростов-на-Дону</option>
              <option value="12">Самара</option>
              <option value="13">Уфа</option>
            </select>
          </div>
        </div>
      </form>
    </div>

UsersTablePagination = React.createClass
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

UsersSearchComponent = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+79999999999")
  onSubmit: (e)->
    e.preventDefault() if e isnt undefined
    @props.filters.phone = @refs.phone.value
    loadPage @props.filters
  cancell: ->
    @refs.phone.value = ""
    @onSubmit()
  render: ->
    <form className="form_horizontal border-no margin_top_20" onSubmit={@onSubmit}>
      <div className="form-group">
        <div className="input-group col-sm-10 col-sm-offset-1">
          <input className="form-control phone" type="tel" id="phone_input" placeholder="Введите телефон" ref="phone" defaultValue={@props.filters.phone} />
          <span className="input-group-btn">
            <button className="btn btn-secondary" type="submit">
              <i className="fa fa-search"></i>
            </button>
          </span>
        </div>
      </div>
      <div className="col-xs-12 text-center margin_top_20">
        <div className="btn-primary btn" onClick={@cancell}>Отмена</div>
      </div>
    </form>

UsersComponent = React.createClass
  render: ->
    <div>
      <h1 className="text-center">Зарегистрированные пользователи</h1>
      <UsersSearchComponent filters={@props.filters} />
      <UsersFilters filters={@props.filters} />
      <UsersTable users={@props.users} filters={@props.filters} currentPage={@props.currentPage} />
      <div className="container text-center">
        <UsersTablePagination filters={@props.filters} currentPage={@props.currentPage} totalPages={@props.totalPages} />
      </div>
    </div>

loadPage = (filters)->
  JCapi("/api/preregister_new", "GET", filters)((res)->
    totalPages = Math.round(res.total/25)+1
    React.render <UsersComponent users={res.preregisters} total={res.total} filters={filters} currentPage={filters.page} totalPages={totalPages} />, document.getElementById('users_place')
  )
loadPage({page: 1})