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
    
StartDateComponent = React.createClass
  componentDidMount: ->
    $(@refs.date_start).datepicker
      ###
      monthNames: {"Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август", 
          "Сентябрь","Октябрь","Ноябрь","Декабрь"}
      dayNamesMin: {"Вс","Пн", "Вт", "Ср", "Чт", "Пт", "Сб"} ###
      firstDay: 1
      changeMonth: false
      changeYear: false
      dateFormat: 'dd.mm.yy'
      onSelect: =>
        @submitForm()
      minDate: 0
    
      onSwitchChange: =>
        @submitForm()
  submitForm: (e)->
    setTimeout =>
      JCapi "/api/config/startdate", "POST",
        date_start: @refs.date_start.value
        is_begin: @refs.is_begin.checked
    , 0
  render: ->
    <form className="form_horizontal">
      <div className="form-group">
        <label className="col-sm-6 control-label">Дата начала акции</label>
        <div className="col-sm-6">
          <input ref="date_start" type="text" className="date form-control" id="date_start" name="date_start" placeholder="Выберите дату" defaultValue={window.date_start} />
        </div>
      </div>
      <div className="form-group">
        <div className="col-sm-12">
          <div>
            <label className="col-sm-6 control-label">
              Начать досрочно
            </label>
            <div className="col-sm-6">
              <div className="checkbox">
                <label>
                  { <input ref="is_begin" type="checkbox" name="is_begin" id="is_begin" /> if !window.is_begin }
                  { <input ref="is_begin" type="checkbox" name="is_begin" id="is_begin" defaultChecked /> if window.is_begin }
                  Начать досрочно
                </label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>

React.render <StartDateComponent/>, document.getElementById('startdate_place')