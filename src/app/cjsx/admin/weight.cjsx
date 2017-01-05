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
    
AddRow = React.createClass
  componentDidMount: ->
    $(@refs.whos).chosen({"disable_search": true})
  handleAdd: ->
    JCapi("/api/preregister/weight/find/", "POST", {weight: @refs.weight.value, whos: @refs.whos.value, phone: @props.weight.phone})(=>
      loadPage 1, @props.weight.phone, @props.date_start, @props.date_end, @props.mega
    )
  formatDate: (str)->
    moment(str).format "DD.MM.YY HH:mm:ss"
  render: ->
    <tr>
      <td className="text-center">
        {@props.weight.lname}
      </td>
      <td className="text-center">
        {@props.weight.fname}
      </td>
      <td className="text-center">
        {@props.weight.phone}
      </td>
      <td className="text-center">
        {@formatDate()}
      </td>
      <td className="text-center">
        <input ref="weight" type="text" className="text-center" />
      </td>      
      <td className="text-center">
        <select ref="whos">
          <option value="mega_ts">Тёплый стан</option>
          <option value="mega_bd">Белая Дача</option>
          <option value="mega_kh">Химки</option>
          <option value="mega_dy">Дыбенко</option>
          <option value="mega_pa">Парнас</option>
          <option value="mega_ad">Адыгея-Кубань</option>
          <option value="mega_ek">Екатеринбург</option>
          <option value="mega_ka">Казань</option>
          <option value="mega_nn">Нижний Новгород</option>
          <option value="mega_no">Новосибирск</option>
          <option value="mega_om">Омск</option>
          <option value="mega_ro">Ростов-на-Дону</option>
          <option value="mega_sa">Самара</option>
          <option value="mega_uf">Уфа</option>
          <option value="mobile_ts">Мобильная Мега - Тёплый стан</option>
          <option value="mobile_bd">Мобильная Мега - Белая Дача</option>
          <option value="mobile_kh">Мобильная Мега - Химки</option>
          <option value="mobile_dy">Мобильная Мега - Дыбенко</option>
          <option value="mobile_pa">Мобильная Мега - Парнас</option>
          <option value="mobile_ad">Мобильная Мега - Адыгея-Кубань</option>
          <option value="mobile_ek">Мобильная Мега - Екатеринбург</option>
          <option value="mobile_ka">Мобильная Мега - Казань</option>
          <option value="mobile_nn">Мобильная Мега - Нижний Новгород</option>
          <option value="mobile_no">Мобильная Мега - Новосибирск</option>
          <option value="mobile_om">Мобильная Мега - Омск</option>
          <option value="mobile_ro">Мобильная Мега - Ростов-на-Дону</option>
          <option value="mobile_sa">Мобильная Мега - Самара</option>
          <option value="mobile_uf">Мобильная Мега - Уфа</option>          
        </select>
      </td>
      <td className="text-center">
        <span onClick={@handleAdd} className="add">+</span>
      </td>
    </tr>

WeightRow = React.createClass
  componentDidMount: ->
    $(@refs.whos).chosen({"disable_search": true}).change =>
      @handleEdit()
  handleRemove: ->
    swal {title: "Вы уверены?", text: "Удаление невозможно будет отменить", type: "warning", showCancelButton: true, confirmButtonText: "Да, удалить", cancelButtonText: "Нет", confirmButtonColor: "#4CAF50"}, (isConfirm)=>
      if isConfirm
        JCapi("/api/preregister/weight/find/" + @props.weight._id, "DELETE", {created_at: @props.weight.created_at})(=>
          loadPage @props.currentPage, @props.phone, @props.date_start, @props.date_end, @props.mega
        )
  handleEdit: ->
    setTimeout =>
      JCapi("/api/preregister/weight/find/" + @props.weight._id, "PUT", {weight: @refs.weight.value, whos: @refs.whos.value})((res)=>
        loadPage @props.currentPage, @props.phone, @props.date_start, @props.date_end, @props.mega
      )(()=>
        
      )
    , 0
  formatDate: (str)->
    moment(str).format "DD.MM.YY HH:mm:ss"
  render: ->
    <tr>
      <td className="text-center">
        {@props.weight.lname}
      </td>
      <td className="text-center">
        {@props.weight.fname}
      </td>
      <td className="text-center">
        {@props.weight.phone}
      </td>
      <td className="text-center">
        {@formatDate(@props.weight.created_at)}
      </td>
      <td className="text-center">
        <input onBlur={@handleEdit} ref="weight" type="text" defaultValue={@props.weight.weight} className="text-center" />
      </td>      
      <td className="text-center">
        <select defaultValue={@props.weight.whos} onChange={@handleEdit} ref="whos">
          <option value="mega_ts">Тёплый стан</option>
          <option value="mega_bd">Белая Дача</option>
          <option value="mega_kh">Химки</option>
          <option value="mega_dy">Дыбенко</option>
          <option value="mega_pa">Парнас</option>
          <option value="mega_ad">Адыгея-Кубань</option>
          <option value="mega_ek">Екатеринбург</option>
          <option value="mega_ka">Казань</option>
          <option value="mega_nn">Нижний Новгород</option>
          <option value="mega_no">Новосибирск</option>
          <option value="mega_om">Омск</option>
          <option value="mega_ro">Ростов-на-Дону</option>
          <option value="mega_sa">Самара</option>
          <option value="mega_uf">Уфа</option>
          <option value="mobile_ts">Мобильная Мега - Тёплый стан</option>
          <option value="mobile_bd">Мобильная Мега - Белая Дача</option>
          <option value="mobile_kh">Мобильная Мега - Химки</option>
          <option value="mobile_dy">Мобильная Мега - Дыбенко</option>
          <option value="mobile_pa">Мобильная Мега - Парнас</option>
          <option value="mobile_ad">Мобильная Мега - Адыгея-Кубань</option>
          <option value="mobile_ek">Мобильная Мега - Екатеринбург</option>
          <option value="mobile_ka">Мобильная Мега - Казань</option>
          <option value="mobile_nn">Мобильная Мега - Нижний Новгород</option>
          <option value="mobile_no">Мобильная Мега - Новосибирск</option>
          <option value="mobile_om">Мобильная Мега - Омск</option>
          <option value="mobile_ro">Мобильная Мега - Ростов-на-Дону</option>
          <option value="mobile_sa">Мобильная Мега - Самара</option>
          <option value="mobile_uf">Мобильная Мега - Уфа</option>          
        </select>
      </td>
      <td className="text-center">
        <span onClick={@handleRemove} className="remove">+</span>
      </td>
    </tr>

WeightTable = React.createClass
  getInitialState: ->
    {add: false}
  componentWillReceiveProps: ->
    @setState {add: false}
  showAddButton: ->
    @setState {add: true}
  render: ->
    <div className="table-responsive overflow_auto text-center">
      {<div className="btn btn-primary" onClick={@showAddButton}>Добавить</div> if !!@props.weights and (@props.phone.length isnt 0) and (!@state.add) }
      <table className="table table-striped custab users_layout">
        <thead>
          <tr>
            <th className="text-center">Фамилия</th>
            <th className="text-center">Имя</th>
            <th className="text-center">Телефон</th>
            <th className="text-center">Дата сдачи</th>
            <th className="text-center">Сданный вес</th>
            <th className="text-center">ID точки</th>
            <th className="text-center">Действие</th>
          </tr>
        </thead>
        <tbody>
          {<AddRow mega={@props.mega} weight={@props.weights[0]} /> if !!@props.weights and (@props.phone.length isnt 0) and (@state.add)}
          {<WeightRow mega={@props.mega} weight={weight} key={weight._id} phone={@props.phone} /> for weight in @props.weights}
        </tbody>
      </table>
    </div>

WeightSearchComponent = React.createClass
  componentDidMount: ->
    $(@refs.phone).mask("+79999999999")
  onSubmit: (e)->
    e.preventDefault() if e isnt undefined
    loadPage 1, @refs.phone.value, @props.date_start, @props.date_end, @props.mega
  onRemove: ->
    @refs.phone.value = ""
    @onSubmit()
  render: ->
    <form className="form_horizontal border-no margin_top_20 " onSubmit={@onSubmit}>
      <div className="form-group">
        <div className="input-group col-sm-10 col-sm-offset-1">
          <input className="form-control phone" type="tel" id="phone_input" placeholder="Введите телефон" ref="phone" defaultValue={@props.phone} />
          <span className="input-group-btn">
            <button className="btn btn-secondary" type="submit">
              <i className="fa fa-search"></i>
            </button>
          </span>
        </div>
        <div className="form-group text-center">
          <button className="btn btn-primary" onClick={@onRemove}>отменить</button>
        </div>
      </div>
    </form>

WeightFilterComponent = React.createClass
  componentDidMount: ->
    dates = $(@refs.date_start).datepicker
      ###
      monthNames: {"Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август", 
          "Сентябрь","Октябрь","Ноябрь","Декабрь"}
      dayNamesMin: {"Вс","Пн", "Вт", "Ср", "Чт", "Пт", "Сб"} ###
      firstDay: 1
      dateFormat: 'dd.mm.yy'
      maxDate: @props.date_end
      onSelect: (selectedDate)=>
        $(@refs.date_end).datepicker "option", "minDate", selectedDate
        @onSubmit()
      onSwitchChange: =>
        @onSubmit()
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
        @onSubmit()
      onSwitchChange: =>
        @onSubmit()
    $(@refs.whos).chosen({"disable_search": true}).change =>
      @handleEdit()
  onSubmit: (e)->
    e.preventDefault() if e isnt undefined
    loadPage 1, @props.phone, @refs.date_start.value, @refs.date_end.value, @refs.whos.value
  handleEdit: ->
    setTimeout =>
      @onSubmit()
    , 0
  render: ->
    <form className="form_horizontal border-no" onSubmit={@onSubmit}>
      <h2 className="text-center overflow_hidden">Фильтры</h2>
      <div className="form-group col-sm-12">
        <label className="col-sm-3 col-xs-12 control-label text-center font_size_20">Время</label>
        <label className="col-xs-1 control-label text-center font_size_20">С</label>
        <div className="col-xs-3">
          <input type="text" ref="date_start" defaultValue={@props.date_start} className="date form-control" />
        </div>
        <label className="col-xs-1 control-label text-center font_size_20">По</label>
        <div className="col-xs-3">
          <input type="text" ref="date_end" defaultValue={@props.date_end} className="date form-control" />
        </div>      
      </div>
      <div className="form-group margin_top_20 col-sm-12">
        <label className="col-sm-3 col-xs-12 control-label text-center font_size_20">Выберите Мегу</label>
        <div className="col-sm-9">
          <select defaultValue={@props.mega} onChange={@handleEdit} ref="whos">
            <option value="-1">Все меги</option>
            <option value="mega_ts">Тёплый стан</option>
            <option value="mega_bd">Белая Дача</option>
            <option value="mega_kh">Химки</option>
            <option value="mega_dy">Дыбенко</option>
            <option value="mega_pa">Парнас</option>
            <option value="mega_ad">Адыгея-Кубань</option>
            <option value="mega_ek">Екатеринбург</option>
            <option value="mega_ka">Казань</option>
            <option value="mega_nn">Нижний Новгород</option>
            <option value="mega_no">Новосибирск</option>
            <option value="mega_om">Омск</option>
            <option value="mega_ro">Ростов-на-Дону</option>
            <option value="mega_sa">Самара</option>
            <option value="mega_uf">Уфа</option>
            <option value="mobile_ts">Мобильная Мега - Тёплый стан</option>
            <option value="mobile_bd">Мобильная Мега - Белая Дача</option>
            <option value="mobile_kh">Мобильная Мега - Химки</option>
            <option value="mobile_dy">Мобильная Мега - Дыбенко</option>
            <option value="mobile_pa">Мобильная Мега - Парнас</option>
            <option value="mobile_ad">Мобильная Мега - Адыгея-Кубань</option>
            <option value="mobile_ek">Мобильная Мега - Екатеринбург</option>
            <option value="mobile_ka">Мобильная Мега - Казань</option>
            <option value="mobile_nn">Мобильная Мега - Нижний Новгород</option>
            <option value="mobile_no">Мобильная Мега - Новосибирск</option>
            <option value="mobile_om">Мобильная Мега - Омск</option>
            <option value="mobile_ro">Мобильная Мега - Ростов-на-Дону</option>
            <option value="mobile_sa">Мобильная Мега - Самара</option>
            <option value="mobile_uf">Мобильная Мега - Уфа</option>          
          </select>
        </div>
      </div>
    </form>

WeightTablePagination = React.createClass
  goToPage: (e)->
    loadPage e.target.innerHTML, @props.phone, @props.date_start, @props.date_end, @props.mega
  goPrev: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      loadPage parseInt(@props.currentPage,10)-1, @props.phone, @props.date_start, @props.date_end, @props.mega
  goNext: (e)->
    if !$(e.target).closest('li').hasClass "disabled"
      loadPage parseInt(@props.currentPage,10)+1, @props.phone, @props.date_start, @props.date_end, @props.mega
  render: ->
    <ul className="pagination">
      <li onClick={@goPrev} key="back" className={if 1 is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Назад">«</a></li>
      {<li key={i} className={if i is parseInt(@props.currentPage,10) then "active" else ""}><a href="#" onClick={@goToPage}>{i}</a></li> for i in [1..@props.totalPages]}
      <li onClick={@goNext} key="forward" className={if @props.totalPages is parseInt(@props.currentPage,10) then "disabled" else ""}><a href="#" title="Вперед">»</a></li>
    </ul>

WeightComponent = React.createClass
  render: ->
    <div>
      {<h1 className="text-center">Результат по номеру {@props.phone} - {@props.total}</h1> if @props.phone.length isnt 0}
      {<h1 className="text-center">Введите номер</h1> if @props.phone.length is 0}
      <WeightSearchComponent mega={@props.mega} phone={@props.phone} date_start={@props.date_start} date_end={@props.date_end} />
      <WeightFilterComponent mega={@props.mega} phone={@props.phone} date_start={@props.date_start} date_end={@props.date_end} />
      {<WeightTable mega={@props.mega} currentPage={@props.currentPage} weights={@props.weights} phone={@props.phone} date_start={@props.date_start} date_end={@props.date_end} /> if @props.total isnt 0}
      {<div className="container text-center"><WeightTablePagination mega={@props.mega} totalPages={@props.totalPages} currentPage={@props.currentPage} weights={@props.weights} phone={@props.phone} date_start={@props.date_start} date_end={@props.date_end} /></div> if @props.totalPages > 1}
    </div>

loadPage = (num, phone="", date_start="09.03.2016", date_end, mega=-1)->
  date_end = moment().format("DD.MM.YYYY") if date_end is undefined
  JCapi("/api/preregister/weight/find", "GET", {page: num, phone: phone, date_end: date_end, date_start: date_start, mega: mega})((res)->
    totalPages = Math.round(res.total/100)+1
    React.render <WeightComponent mega={mega} currentPage={num} totalPages={totalPages} date_start={date_start} date_end={date_end} weights={res.weights} phone={phone} total={res.total} />, document.getElementById('weight_place')
  )
loadPage 1