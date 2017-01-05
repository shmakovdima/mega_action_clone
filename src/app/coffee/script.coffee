$(document).ready ()->  
  jQuery.scrollDepth()
  new WOW().init()

  JCapi("/api/weight/graph", "GET")((res)->
    arr = res
    console.log(res)
    weight_optimize(res)
  )   

$(window).load ()->
  $(".nav-stacked li").removeClass("active")
  anchor = location.hash
  console.log(anchor)
  if anchor == ""
    $(".nav-stacked .about_menu_item[href='#about']").parent().addClass("active")
  if anchor == "#good"
    $(".nav-stacked .about_menu_item[href='#about']").parent().addClass("active")
  if anchor == "#100"
    $(".nav-stacked .about_menu_item[href='#100']").parent().addClass("active")
  if anchor == "#future"
    $(".nav-stacked .about_menu_item[href='#future']").parent().addClass("active")
  if anchor == "#need"
    $(".nav-stacked .about_menu_item[href='#need']").parent().addClass("active")
  if anchor == "#where"
    $(".nav-stacked .about_menu_item[href='#where']").parent().addClass("active")


  

  