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
    
{ div, form, input, span, button, label, br, h2, img, a } = React.DOM

PhotoItem = React.createClass
  getAvatar: ->
    author = switch
      when @props.photo.comment_by is "olga1" then "/static/images/expert/exp_2.png"
      when @props.photo.comment_by is "olga2" then "/static/images/expert/expert_photo.png"
      when @props.photo.comment_by is "katya1" then "/static/images/expert/exp3.png"
      when true then "Великий эксперт"
    return author
  getAuthor: ->
    author = switch
      when @props.photo.comment_by is "olga1" then "Ольга Шелест"
      when @props.photo.comment_by is "olga2" then "Ольга Мальцева"
      when @props.photo.comment_by is "katya1" then "Екатерина Климова"
      when true then "Великий эксперт"
  getSrc: ->
    "/static/uploaded_images/" + @props.photo.src
  getClassName: ->
    if @props.photo.isPretty then "col-sm-6 expert_item expert_item_ok margin_top_60" else "col-sm-6 expert_item expert_item_no margin_top_60"
  ShareOk: ()->
    Share.popup "/api/photo/" + @props.photo._id + "/share?type=ok"
    # Share.odnoklassniki("http://change.megamall.ru/photo/" + @props.photo._id, "Получи совет от одного из экспертов моды проекта “Меняйся”! Загрузи свой лук на change.megamall.ru и получи шанс выиграть одну из карт “МЕГА Подарок” на 3000 р.!")
  ShareTw: ()->
    Share.popup "/api/photo/" + @props.photo._id + "/share?type=tw"
    # Share.twitter("http://change.megamall.ru/photo/" + @props.photo._id,  "Получи совет от одного из экспертов моды проекта “Меняйся”! Загрузи свой лук на change.megamall.ru и получи шанс выиграть одну из карт “МЕГА Подарок” на 3000 р.!")
  ShareVk: ()->
    Share.popup "/api/photo/" + @props.photo._id + "/share?type=vk"
    # Share.vkontakte "http://change.megamall.ru/photo/" + @props.photo._id, "Эксперт моды оценил мой лук! " , "http://change.megamall.ru/api/photo/" + @props.photo._id + "/share.png" , "Получи совет от одного из экспертов моды проекта “Меняйся”! Загрузи свой лук на change.megamall.ru и получи шанс выиграть одну из карт “МЕГА Подарок” на 3000 р.!"
  ShareFb: ()->
    Share.popup "/api/photo/" + @props.photo._id + "/share?type=fb"
    # Share.facebook "http://change.megamall.ru/photo/" + @props.photo._id, "Эксперт моды оценил мой лук! " ,"http://change.megamall.ru/api/photo/" + @props.photo._id + "/share.png", "Получи совет от одного из экспертов моды проекта “Меняйся”! Загрузи свой лук на change.megamall.ru и получи шанс выиграть одну из карт “МЕГА Подарок” на 3000 р.!"
  render: ->
    div {className: @getClassName()},
      div {className: "expert_item_block"},
        div {className: "expert_item_img"},
          img {className: "img-responsive", src: @getSrc()}
          div {className: "expert_item_status"}
          div {className: "expert_item_share"},
            a {className: "soc ok", href:"javascript:void(0)", title:"Мы в Одноклассниках", onClick: @ShareOk}
            a {className: "soc tw", href:"javascript:void(0)", title:"Мы в Твиттере", onClick: @ShareTw}
            a {className: "soc fb", href:"javascript:void(0)", title:"Мы в Facebook", onClick: @ShareFb}
            a {className: "soc vk", href:"javascript:void(0)", title:"Мы в ВКонтакте", onClick: @ShareVk}
            span {className: "soc share"}
        div {className: "expert_item_footer"},
          div {className: "expert_item_title"},
            div {className: "expert_item_title_img", style: {"backgroundImage": "url(" + @getAvatar() + ")"}}
            div {className: "expert_item_title_text"}, @getAuthor()
          div {className: "expert_item_text"}, @props.photo.comment
          div {className: "expert_item_share bottom_share"},
            a {className: "soc ok", href:"javascript:void(0)", title:"Мы в Одноклассниках", onClick: @ShareOk}
            a {className: "soc tw", href:"javascript:void(0)", title:"Мы в Твиттере", onClick: @ShareTw}
            a {className: "soc fb", href:"javascript:void(0)", title:"Мы в Facebook", onClick: @ShareFb}
            a {className: "soc vk", href:"javascript:void(0)", title:"Мы в ВКонтакте", onClick: @ShareVk}

PhotosGridComponent = React.createClass
  addPhotos: (photos)->
    for photo in photos
      @props.photos.push photo
    @setState {photos: photos}
  getPair: (pointer)->
    console.log pointer
    <div>
      <PhotoItem photo={@props.photos[pointer*2]} key={@props.photos[pointer*2]._id} />
      {<PhotoItem photo={@props.photos[pointer*2+1]} key={@props.photos[pointer*2+1]._id} /> if @props.photos[pointer*2+1] isnt undefined}
    </div>
  render: ->
    <div className="expert_body margin_top_20">
      <div className="row">
        {@getPair(i) for i in [0..Math.floor((@props.photos.length-1)/2)] if @props.photos.length isnt 0}
      </div>
    </div>

PhotosFilterComponent = React.createClass
  componentDidMount: ->
    $(@refs.mega).find('[data-value="' + (if @props.filters.mega isnt undefined then parseInt(@props.filters.mega, 10) else -1) + '"]').addClass "active"
    $(@refs.isPretty).find('[data-value="' + (if @props.filters.isPretty isnt undefined then @props.filters.isPretty else -1) + '"]').addClass "active"
    $(@refs.dates).find('[data-value="' + (if @props.filters.date isnt undefined then parseInt(@props.filters.date, 10) else 1) + '"]').addClass "active"    
  filter: (e)->
    el = $ e.target
    el.siblings().removeClass "active"
    el.addClass "active"

    mega = $(@refs.mega).find(".active")[0].getAttribute "data-value"
    isPretty = $(@refs.isPretty).find(".active")[0].getAttribute "data-value"
    date = $(@refs.dates).find(".active")[0].getAttribute "data-value"

    filters = {}
    filters.mega = mega if mega isnt "-1"
    filters.isPretty = isPretty if isPretty isnt "-1"
    filters.date = date

    loadPage 1, filters
  getMegaText: (mega_num)->
    res = switch
      when mega_num is 0 then 'Тёплый стан'
      when mega_num is 1 then 'Белая дача'
      when mega_num is 2 then 'Химки'
      when mega_num is 3 then 'Дыбенко'
      when mega_num is 4 then 'Парнас'
      when mega_num is 5 then 'Адыгея-Кубань'
      when mega_num is 6 then 'Екатеринбург'
      when mega_num is 7 then 'Казань'
      when mega_num is 8 then 'Нижний Новгород'
      when mega_num is 9 then 'Новосибирск'
      when mega_num is 10 then 'Омск'
      when mega_num is 11 then 'Ростов-на-Дону'
      when mega_num is 12 then 'Самара'
      when mega_num is 13 then 'Уфа'
      when true then 'Все МЕГИ'
  getDecisionText: (isPretty)->
    res = switch
      when isPretty is "1" then "Оставить"
      when isPretty is "0" then "Отдать"
      when true then "Все мнения"
  getDatesText: (dates_id)->
    res = switch
      when dates_id is 0 then "Все фото"
      when dates_id is 1 then "9 — 15 марта"
      when dates_id is 2 then "16 — 22 марта"
      when dates_id is 3 then "23 — 29 марта"
      when dates_id is 4 then "30 — 9 апреля"
  render: ->
    <div className="filters_block margin_top_40">
      <div className="row">
        <div className="col-md-4 expert_center_filter">
          <div className="expert_center_filter-block">
            <div className="expert_center_filter-title">{@getMegaText(if @props.filters.mega isnt undefined then parseInt(@props.filters.mega, 10) else -1)}</div>
            <div className="expert_center_filter_hidden" ref="mega">
              <span onClick={@filter} data-value="-1">Все МЕГИ</span>
              <span className="city">Москва</span>
              <span onClick={@filter} data-value="0">Теплый Стан</span>
              <span onClick={@filter} data-value="1">Белая Дача</span>
              <span onClick={@filter} data-value="2">Химки</span>
              <span className="city">Санкт-петербург</span>
              <span onClick={@filter} data-value="3">Дыбенко</span>
              <span onClick={@filter} data-value="4">Парнас</span>
              <span className="city">Другие города</span>
              <span onClick={@filter} data-value="5">Адыгея-Кубань</span>
              <span onClick={@filter} data-value="6">Екатеринбург</span>
              <span onClick={@filter} data-value="7">Казань</span>
              <span onClick={@filter} data-value="8">Нижний Новгород</span>
              <span onClick={@filter} data-value="9">Новосибирск</span>
              <span onClick={@filter} data-value="10">Омск</span>
              <span onClick={@filter} data-value="11">Ростов-на-Дону</span>
              <span onClick={@filter} data-value="12">Самара</span>
              <span onClick={@filter} data-value="13">Уфа</span>
            </div>
          </div>
        </div>
        <div className="col-md-4 expert_center_filter">
          <div className="expert_center_filter-block">
            <div className="expert_center_filter-title">{@getDecisionText(if @props.filters.isPretty isnt undefined then @props.filters.isPretty else -1)}</div>
            <div className="expert_center_filter_hidden" ref="isPretty">
              <div onClick={@filter} data-value="-1">Все мнения ({@props.total})</div>
              <span onClick={@filter} data-value="1">Оставить</span>
              <span onClick={@filter} data-value="0">Отдать</span>
            </div>
          </div>
        </div>
        <div className="col-md-4 expert_center_filter">
          <div className="expert_center_filter-block">
            <div className="expert_center_filter-title">{@getDatesText(if @props.filters.date isnt undefined then parseInt(@props.filters.date, 10) else 1)}</div>
            <div className="expert_center_filter_hidden" ref="dates">
                <span onClick={@filter} data-value="0">Все фото</span>
                <span onClick={@filter} data-value="1">9 — 15 марта</span>
                <span onClick={@filter} data-value="2">16 — 22 марта</span>
                <span onClick={@filter} data-value="3">23 — 29 марта</span>
                <span onClick={@filter} data-value="4" defaultSelected="true">30 марта — 9 апреля</span>
            </div>
          </div>
        </div>
      </div>
    </div>

window.PhotosComponent = React.createClass
  getInitialState: ->
    {opened: false}
  open: (e)->
    e.preventDefault() if e isnt undefined
    @setState {opened: true}
  close: ->
    @setState {opened: false}
  getButton: ()->
    t = parseInt @props.total, 10
    cp = parseInt @props.currentPage, 10
    @fake_props = {t: t, cp: cp}
    text = switch
      when t < 20*cp then ""
      when t < 20*(cp+1) then "Показать еще " + (t - 20*cp) + " мнений"
      when true then "Показать еще 20 мнений"
    el = if text.length isnt 0 then <button ref="more_button" className="btn btn-more" onClick={@loadMore}>{text}</button> else <span></span>
    return el
  loadMore: (e)->
    e.preventDefault()
    loadPage parseInt(@fake_props.cp, 10)+1, @props.filters, (res)=>
      @refs.grid.addPhotos res.photos
      @fake_props.cp = parseInt(@fake_props.cp, 10)+1
      @fake_props.t = res.total

      t = parseInt @fake_props.t, 10
      cp = parseInt @fake_props.cp, 10
      text = switch
        when t <= 20*cp then ""
        when t < 20*(cp+1) then "Показать еще " + (t - 20*cp) + " мнений"
        when true then "Показать еще 20 мнений"
      if text.length isnt 0 
        @refs.more_button.innerHTML = text 
        @refs.more_button.style.display = "block" 
      else 
        @refs.more_button.style.display = "none"    
  render: ->
    div {}, 
      <RenderInBody><UploadPopupComponent close={@close} /></RenderInBody> if @state.opened
      <h1 className="expert_header hidden-xs hidden-sm">Получи взвешенное<br/> мнение экспертов моды</h1>
      span {className: "expert_line expert_center_subtitle text-center-sm text-center-xs"}, "Отдать нельзя оставить?"
      span {className: "expert_center_description margin_top_20 text-left"}, "Время от времени каждый сталкивается с вопросом — а мы, наконец, нашли способ дать на него ответ"
      
      div {className: "expert_center_experttext hidden-lg hidden-md", onClick: @open},
        span {} , "Эксперты моды и редакция журнала " 
          span {className: "font_play_bold"}, "МЕГАStyle" 
          span {}, " оценят "  
        span {}, "твой лук и дадут советы — что отдать, что оставить, а что — освежить аксессуарами."

      <div className="expert_person  overflow_hidden hidden-lg hidden-md">
        <div className="expert_person_item margin_top_20">
          <div  className="expert_person_img expert_person_img_1"></div>
          <span className="expert_person_title">Ольга Шелест</span>
          <span className="expert_person_description">Самая популярная и жизнерадостная телеведущая, икона стиля</span>
        </div>
        <div className="expert_person_item margin_top_20">
          <div  className="expert_person_img expert_person_img_2"></div>
          <span className="expert_person_title">Екатерина Климова</span>
          <span className="expert_person_description">Одна из самых известных и талантливых стилистов России и журнала МЕГАStyle</span>
        </div>
        <div className="expert_person_item margin_top_20">
          <div className="expert_person_img expert_person_img_3"></div>
          <span className="expert_person_title">Ольга Мальцева</span>
          <span className="expert_person_description"> Главный редактор  Высшей Школы Шоппинга, Fashion-журналист и стилист</span>
        </div>
      </div>

      <PhotosFilterComponent filters={@props.filters} total={@props.total} />
      <PhotosGridComponent photos={@props.photos} ref="grid" />
      div {className: "expert_body expert_button text_center"},
        @getButton()

loadPage = (num, filters, cb)->
  query = {page: num, filters: filters}
  query.start_id = window.location.pathname.split('/')[2] if window.location.pathname.split('/').length is 3
  JCapi("/api/photo", "GET", query)((res)->
    if typeof cb is "function" then cb(res) else React.render <PhotosComponent photos={res.photos} currentPage={num} total={res.total} loadPage={loadPage} filters={filters} />, document.getElementById('photos_place')
  )
loadPage(1, {date: 4})
