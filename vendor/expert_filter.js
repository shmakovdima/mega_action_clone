$(document).on("click",".expert_center_filter-block", function(event){
  event.preventDefault();
  console.log(event.target.nodeName);
  if ((event.target.nodeName == "SPAN") && (event.target.className!="city")) {
    $(this).removeClass("visible");
    return;
  }
  if ((event.target.className=="city")) return;


  if ($(this).hasClass("visible")) {
    $(this).removeClass("visible"); 
    return;
  }
  $(".expert_center_filter-block").removeClass("visible");
  $(this).addClass("visible")

});


jQuery(function($){
  $(document).mouseup(function (event){ // событие клика по веб-документу
    var div = $(".expert_center_filter"); // тут указываем ID элемента
    if (!div.is(event.target) // если клик был не по нашему блоку
        && (div.has(event.target).length === 0)
        &&(event.target.className!="city")) { // и не по его дочерним элементам
     $(".expert_center_filter-block").removeClass("visible"); // скрываем его
    }
  });
});


