$(document).ready ()->
  new WOW().init()



  wt = $('#weight_table')
  if wt.length isnt 0
    editHandler = (day)->
      (e)->
        JCapi("/api/weight/graph", "PUT", {day: day, weight: e.target.value})
    compare_weights = (a, b)->
      if moment(a.date, "DD.MM.YYYY").isBefore moment(b.date, "DD.MM.YYYY") then -1 else 1
    JCapi("/api/weight", "GET")((res)->
      arr = res.result.sort(compare_weights)
      for str in arr
        el = $('<tr><td>' + str.date + '</td><td>' + str.sum.toFixed(2) + '</td><td><input type="text" class="text-center" value="' + str.graph.toFixed(2) + '" /></td></tr>')
        el.find("input").on "blur", editHandler(str.date)
        wt.append el
    )

  money_paid = $("#money_paid")
  if money_paid.length isnt 0
    JCapi("/api/dashboard", "GET")((res)->
      dash = res.dashboard
      $("#money_paid").html accounting.formatNumber(dash.money_paid, 0, " ", ",") + " рублей"
      $("#members_count").html accounting.formatNumber(dash.members_count, 0, " ", ",") + " человек"
      #$("#total_weight").html accounting.formatNumber(dash.total_weight, 0, " ", ",") + " кг"
      $("#photos_count").html accounting.formatNumber(dash.photos_count, 0, " ", ",") + " фотографий"
    )

  $(".export-link").on "click", (e)->
    e.preventDefault()

    JCapi($(e.target).closest("a").attr("href"), "GET")((res)->
      swal({   
        title: window.language.global.success,   
        text: "Ваш запрос принят. Файл будет доступен по <a target='_blank' href='http://change.megamall.ru/static/csv/" + res.name + "'>cсылке</a> через 5-10 минут.",
        html: true,
        type: 'success' 
      })
    )  

  JCapi("/api/weight/graph", "GET")((res)->
    arr = res
    console.log(res)
    weight_optimize(res)
  )     

