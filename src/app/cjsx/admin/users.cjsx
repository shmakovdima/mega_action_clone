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
  handleRemove: ->
    swal {title: "Вы уверены?", text: "Удаление невозможно будет отменить", type: "warning", showCancelButton: true, confirmButtonText: "Да, удалить", cancelButtonText: "Нет", confirmButtonColor: "#4CAF50"}, (isConfirm)=>
      if isConfirm
        id = @props.user._id
        JCapi("/api/preregister/"+id, "DELETE")(=>
          @props.loadPage @props.currentPage, @props.start_date
        )
  setData: (user)->
    @refs.fname.value = user.fname
    @refs.lname.value = user.lname
    @refs.phone.value = user.phone
    @refs.email.value = user.email
  getData: ->
    return {fname: @refs.fname.value, lname: @refs.lname.value, phone: @refs.phone.value, email: @refs.email.value, mega: @refs.mega.value}
  handleEdit: ->
    id = @props.user._id
    JCapi("/api/preregister/"+id, "PUT", @getData())((res)=>
      @props.user = res
    )(()=>
      @setData @props.user
    )
  getRealBalance: (balance, transactions)->
    res = balance
    for transaction in transactions
      res -= transaction.sum 
    return res.toFixed(0)
  render: ->
    <tr>
      <td>
        <input onBlur={@handleEdit} ref="fname" type="text" defaultValue={@props.user.fname} className="text-center" />
      </td>
      <td>
        <input onBlur={@handleEdit} ref="lname" type="text" defaultValue={@props.user.lname} className="text-center" />
      </td>
      <td>
        <input onBlur={@handleEdit} ref="phone" type="text" defaultValue={@props.user.phone} className="text-center phone" />
      </td>
      <td>
        <input onBlur={@handleEdit} ref="email" type="text" defaultValue={@props.user.email} className="text-center" />
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
        {@getRealBalance(@props.user.balance, @props.user.transactions)}
      </td>
      <td className="text-center">
        <input type="checkbox" checked />
      </td>
      <td className="text-center">
        <span onClick={@handleRemove} className="remove">+</span>
      </td>
    </tr>

UsersTable = React.createClass
  render: ->
    <div className="overflow_auto table-responsive">
      <table className="table table-striped custab users_layout">
        <thead>
          <tr>
            <th className="text-center">Имя</th>
            <th className="text-center">Фамилия</th>
            <th className="text-center">Телефон</th>
            <th className="text-center">Email</th>
            <th className="text-center">Баланс</th>
            <th className="text-center">Моя МЕГА</th>
            <th className="text-center">Согласие</th>
            <th className="text-center">Действие</th>
          </tr>
        </thead>
        <tbody>
          {<UserRow start_date={@props.start_date} user={user} key={user._id} loadPage={@props.loadPage} currentPage={@props.currentPage} /> for user in @props.users}
        </tbody>
      </table>
    </div>

UsersTablePagination = React.createClass
  goToPage: (e)->
    @props.loadPage e.target.innerHTML, @props.start_date
  goPrev: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.loadPage parseInt(@props.currentPage,10)-1, @props.start_date
  goNext: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      @props.loadPage parseInt(@props.currentPage,10)+1, @props.start_date
  render: ->
    <ul className="pagination">
      <li onClick={@goPrev} key="back" className={if 1 is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Назад">«</a></li>
      {<li key={i} className={if i is parseInt(@props.currentPage,10) then "active" else ""}><a href="#" onClick={@goToPage}>{i}</a></li> for i in [1..@props.totalPages]}
      <li onClick={@goNext} key="forward" className={if @props.totalPages is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Вперед">»</a></li>
    </ul>

UsersCalendarPaginator = React.createClass
  goToPage: (e)->
    @props.loadPage 1, e.target.innerHTML
  goPrev: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      d = moment(@props.start_date,"DD.MM.YY")
      @props.loadPage 1, d.set("date", d.get("date")-1).format("DD.MM.YY")
  goNext: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      d = moment(@props.start_date,"DD.MM.YY")
      @props.loadPage 1, d.set("date", d.get("date")+1).format("DD.MM.YY")
  render: ->
    <ul className="pagination">
      <li onClick={@goPrev} key="back" className={if "09.03.2016" is @props.start_date then "disabled" else ""}><a href="#" title="Назад">«</a></li>
      {<li key={i} className={if i is @props.start_date then "active" else ""}><a href="#" onClick={@goToPage}>{i}</a></li> for i in dates}
      <li onClick={@goNext} key="forward" className={if @props.start_date is moment().format("DD.MM.YYYY") then "disabled" else ""}><a href="#" title="Вперед">»</a></li>
    </ul>

UsersSearchComponent = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+79999999999")
  onSubmit: (e)->
    e.preventDefault()
    @props.loadPage 1, "", @refs.phone.value
  render: ->
    <form className="form_horizontal border-no margin_top_20" onSubmit={@onSubmit}>
      <div className="form-group">
        <div className="input-group col-sm-10 col-sm-offset-1">
          <input className="form-control phone" type="tel" id="phone_input" placeholder="Введите телефон" ref="phone" defaultValue={@props.phone} />
          <span className="input-group-btn">
            <button className="btn btn-secondary" type="submit">
              <i className="fa fa-search"></i>
            </button>
          </span>
        </div>
      </div>
    </form>

UsersComponent = React.createClass
  toMain: ->
    loadPage(1, moment().format("DD.MM.YY"))
    $('#phone_input').val ""
  render: ->
    <div>
      {<h1 className="text-center">Список зарегистрировавшихся пользователей за {@props.start_date} - {@props.total}</h1> if @props.phone.length is 0}
      {<h1 className="text-center">Результат поиска</h1> if @props.phone.length isnt 0}
      <UsersSearchComponent phone={@props.phone} loadPage={@props.loadPage} />
      {<div className="container text-center"><UsersCalendarPaginator start_date={@props.start_date} loadPage={@props.loadPage} /></div> if @props.phone.length is 0}
      <UsersTable start_date={@props.start_date} users={@props.users} loadPage={@props.loadPage} currentPage={@props.currentPage} />
      {<div className="btn btn-primary pull-left" onClick={@toMain}>Назад</div> if @props.phone.length isnt 0}
      {<div className="container text-center"><UsersTablePagination currentPage={@props.currentPage} totalPages={@props.totalPages} loadPage={@props.loadPage} start_date={@props.start_date} /></div> if @props.phone.length is 0}
    </div>

dates = []
tmp_date = moment "01.03.16", "DD.MM.YY"
while !moment().isBefore tmp_date
  dates.push tmp_date.format "DD.MM.YY"
  tmp_date.set "date", tmp_date.get("date")+1
console.log dates

loadPage = (num, start_date, phone="")->
  JCapi("/api/preregister", "GET", {page: num, start_date: start_date, phone: phone})((res)->
    totalPages = Math.round(res.total/25)+1
    React.render <UsersComponent users={res.preregisters} total={res.total} currentPage={num} totalPages={totalPages} loadPage={loadPage} start_date={start_date} phone={phone} />, document.getElementById('users_place')
  )
loadPage(1, moment().format("DD.MM.YY"))