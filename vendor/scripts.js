//GEOIP

$(document).ready(function(){
  if ((window.City) && $("body").hasClass("show_final")) {
    var area = City.region;
    if (area == "08") {
      $(".popup_nocart.ufa").addClass("active");
      
    }else{
      $(".popup_nocart.sam").addClass("active");
    }

  }   
 

Chart.defaults.global.pointHitDetectionRadius = 1;
Chart.defaults.global.customTooltips = function(tooltip) {

    var tooltipEl = $('#chartjs-tooltip');

    if (!tooltip) {
        tooltipEl.css({
            opacity: 0
        });
        return;
    }

    tooltipEl.removeClass('above below');
    tooltipEl.addClass(tooltip.yAlign);

    var innerHtml = '';
    for (var i = tooltip.labels.length - 1; i >= 0; i--) {
      innerHtml += [
        '<div class="chartjs-tooltip-section">',
        ' <span class="chartjs-tooltip-key" style="background-color:' + tooltip.legendColors[i].fill + '"></span>',
        ' <span class="chartjs-tooltip-value">' + tooltip.labels[i] + '</span>',
        '</div>'
      ].join('');
    }
    tooltipEl.html(innerHtml);

    tooltipEl.css({
        opacity: 1,
        left: tooltip.chart.canvas.offsetLeft + tooltip.x + 'px',
        top: tooltip.chart.canvas.offsetTop + tooltip.y + 'px',
        fontFamily: tooltip.fontFamily,
        fontSize: tooltip.fontSize,
        fontStyle: tooltip.fontStyle,
    });
};

});


$(window).load(function(){

  var lineChartData = {
    labels: dates,
    datasets: [{
        label: "My First dataset",
        fillColor: "rgba(255, 192, 100, 0.34)",
        strokeColor: "#ffc064",
        pointColor: "#ffc064",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)",
        data: weights
    }]
  };

  var lineChartData2 = {
      labels: dates,
      datasets: [{
          label: "My First dataset",
          fillColor: "rgba(39, 157, 193, 0.78)",
          strokeColor: "#22b0dc",
          pointColor: "#22b0dc",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: weights
      }]
  };

  if ($("body.graph").length>0) {


    var ctx1 = document.getElementById("chart1").getContext("2d");

    window.myLine = new Chart(ctx1).Line(lineChartData, {
      showScale: false,
      pointDot : false,
      responsive: true,
      datasetStrokeWidth : 4,
      datasetStroke : true,
      scaleOverride : true,
      scaleSteps: 1,
      scaleStartValue:0,
      scaleStepWidth: 300000
    });  

    if ($("body.graph2").length>0) {

      var ctx2 = document.getElementById("chart2").getContext("2d");

      window.myLine2 = new Chart(ctx2).Line(lineChartData2, {
        showScale: false,
        pointDot : false,
        responsive: true,
        datasetStrokeWidth : 4,
        datasetStroke : true,
        scaleOverride : true,
        scaleSteps: 1,
        scaleStartValue:0,
        scaleStepWidth: 300000
      });  
    }

  }
  get_width_graph();
});

var dates = [];
var weights = [];
//var dates = ["09.03.16", "10.03.16", "11.03.16","12.03.16", "13.03.16", "14.03.16", "15.03.16", "16.03.16", "17.03.16", "18.03.16", "19.03.16", "20.03.16", "21.03.16", "22.03.16","23.03.16", "24.03.16", "25.03.16" , "26.03.16", "27.03.16", "28.03.16", "29.03.16", "30.03.16", "31.03.16", "01.04.16", "02.04.16"];
//var weights = [367,         1102.3,     2539.4,    6807.6,     12762,     16081.9,    19662.1,     23702.5,    28225.4,    33377.4,   43922.5,    56965.7,    63998,       72202,     80433,     89489,       99107,       111429,      129011,    139449,     152285,     164032,     175620,      184995,    198085];


function sort_duble_array(m){
  var count = m.length-1;
  for (var i = 0; i < count; i++) 
    for (var j = 0; j < count-i; j++)
      if (m[j].day> m[j+1].day) {
         var max = m[j].day;
         var maxweight = m[j].weight;
         m[j].day = m[j+1].day;
         m[j].weight = m[j+1].weight;
         m[j+1].day = max;
         m[j+1].weight = maxweight;
      }
  return m;
}

function weight_optimize(res) {
  weight = res.weight;
  console.log(weight);

  for (var i = 0; i< weight.length; i++) {
    weight[i].day = moment(weight[i].day, "DD.MM.YYYY")._d;
  }
  console.log(weight);

  weight = sort_duble_array(weight);
  console.log(weight);
  var old = 0;


  for (var i = 0; i< weight.length; i++) { 
    old+=weight[i].weight;
    weights.push(old);
    dates.push(weight[i].day.toString());
    if (i == 31) break;
  }
  console.log(weights);
  console.log(dates);

  //sum

  sum = Math.floor(weights[weights.length-1]);
  $("#total_weight").html(accounting.formatNumber(sum, 0, " ", ",") + " кг")
  console.log(sum);
  var a = Math.floor(sum/100000);
  sum = sum - 100000 * a;
  console.log(sum);
  var b = Math.floor(sum/10000);
  sum = sum - 10000 * b;
  console.log(sum);
  var c = Math.floor(sum/1000);
  sum = sum - 1000 * c;
  console.log(sum);
  var d = Math.floor(sum/100);
  sum = sum - 100 * d;
  console.log(sum);
  var e = Math.floor(sum/10);
  sum = sum - 10 * e;
  console.log(sum);
  var f = Math.floor(sum/1);

  
  $(".counter ul").append("<li>"+a+"</li>");
  $(".counter ul").append("<li>"+b+"</li>");
  $(".counter ul").append("<li class='lefted'>"+c+"</li>");
  $(".counter ul").append("<li>"+d+"</li>");
  $(".counter ul").append("<li>"+e+"</li>");
  $(".counter ul").append("<li>"+f+"</li>");

  //width graph

  $(".graph_date").css("width", (weights.length/32*91)+"%");
}

function get_width_graph() {

  /*
    var startDate = new Date("2016-03-09");
    var endDate = new Date()
    var daterange = Math.floor((endDate - startDate) / 86400000);
    console.log(daterange);
    $(".graph_date").each(function(){
      var width_cur = parseInt($(this).width()) - 100;
      console.log(width_cur+"px");
      $(this).find("canvas").css("width",(daterange/32)*width_cur+"%!important");  
    });
  */
}

$(document).ready(function() {

  //canvas width
  get_width_graph();

  //scrollspy
    $("body").scrollspy({target: "#spy", offset: 150});


    $('[data-spy="scroll"]').each(function () {
      var $spy = $(this).scrollspy('refresh')
    })

  //Ближайший активный мобильный пункт
  var date = new Date();
  var cur_date = date.getDate();

  $(".about_mega_dates").each(function(){
    $(this).find("span").each(function(){
      if ($(this).text() >= cur_date) {
        $(this).click();
        return false;
      }
    })
  });

  $(".expert_center_experttext, #support_mobile_place, .expert_menu_item:contains('Загрузить лук'), .about_change, .expert_getlook" ).click(function(){
     $('body, html').animate({
        scrollTop: 0
      }, delay);
  });

  $('a[href^="#"]').click(function(){
    var el = $(this).attr('href');
    $('body').animate({ scrollTop: $(el).offset().top}, 1000);return false;
  });


  $(".child_about .close_popup, .child_graph .close_popup, .child_nocart .close_popup").on("click",function(){
    $(".popup").removeClass("active");
  });

  $(".counter").on("click",function(){
    ga('send', 'event', 'reg', 'open_clothes_popap');
    $(".popup.popup_graph").addClass("active"); 
  });

  $(".about_where").on("click",function(){
    if ($(this).hasClass("spb")) $(".popup.about_spb").addClass("active"); 
    if ($(this).hasClass("mos")) $(".popup.about_mos").addClass("active"); 
    if ($(this).hasClass("kaz")) $(".popup.about_kaz").addClass("active"); 
    if ($(this).hasClass("spb")) $(".popup.about_spb").addClass("active"); 
    if ($(this).hasClass("ros")) $(".popup.about_ros").addClass("active"); 
    if ($(this).hasClass("adg")) $(".popup.about_adg").addClass("active"); 
    if ($(this).hasClass("sam")) $(".popup.about_sam").addClass("active"); 
    if ($(this).hasClass("ufa")) $(".popup.about_ufa").addClass("active"); 
    if ($(this).hasClass("ekb")) $(".popup.about_ekb").addClass("active"); 
    if ($(this).hasClass("omsk")) $(".popup.about_omsk").addClass("active"); 
    if ($(this).hasClass("nov")) $(".popup.about_nov").addClass("active"); 
    if ($(this).hasClass("nig")) $(".popup.about_nig").addClass("active"); 
  });

  $(".about_mega_dates").on("click","span",function(){
    var indexnub = $(this).index()
    if ($(this).hasClass("active")) return;
    $(this).parent().parent().find(".about_mega_dates span").removeClass("active");
    $(this).addClass("active");
    $(this).parent().parent().find(".about_mega_time").removeClass("active");
    $(this).parent().parent().find(".about_mega_time:eq("+indexnub+")").addClass("active");

  });

  var weight = 0

  $(".calc_calc_round .remove").on("click", function(event){
    event.preventDefault();
    event.stopPropagation();
    ga('send', 'event', 'click', 'calc_click');
    var text = parseInt($(this).parent().find(".count").text());
    text--;
    if (text < 1) {
      $(this).parent().find(".count").text("0");
      $(this).parent().removeClass("active");
    }else{
      $(this).parent().find(".count").text(text);
    }
    reset_cost();
  });

  $(".calc_calc_round").on("click", function(){
    if ($(this).hasClass("share")) return;
    if ($(this).hasClass("remove_all")) {
       $(".calc_calc_round .count").text("0")
       $(".counter_round").removeClass("active");
       reset_cost();
      return
    }

    $(this).find(".counter_round").addClass("active");
    $(this).find(".counter_round .count").text(parseInt($(this).find(".counter_round .count").text())+1);
    reset_cost();
  });


  function reset_cost(){
    var cur_weight = 0;    
    cur_weight+=$(".calc_calc_round_1 .count").text() * 0.6;
    cur_weight+=$(".calc_calc_round_2 .count").text() * 0.45;
    cur_weight+=$(".calc_calc_round_3 .count").text() * 0.4;
    cur_weight+=$(".calc_calc_round_4 .count").text() * 0.1;
    cur_weight+=$(".calc_calc_round_5 .count").text() * 0.175;
    cur_weight+=$(".calc_calc_round_6 .count").text() * 0.3;
    cur_weight+=$(".calc_calc_round_7 .count").text() * 0.25;
    cur_weight+=$(".calc_calc_round_8 .count").text() * 0.35;
    cur_weight+=$(".calc_calc_round_9 .count").text() * 0.2;
    cur_weight+=$(".calc_calc_round_0 .count").text() * 0.2;

    if (cur_weight>=15) {
      cur_weight = 15;
      $(".calc_line").addClass("red");
      $(".calc_block_result").addClass("red");

    }else{
      $(".calc_line").removeClass("red");
      $(".calc_block_result").removeClass("red");
    }



    var cost = (cur_weight.toFixed(1) * 100).toFixed(0);
    $(".calc_calc_cost").text(cost);


    if (cur_weight==0) {
     
      $(".calc_sub").html("Ну-ка,<br> посмотрим, что у <br>тебя есть в гардеробе");
      $(".calc_text_2").html("");
    }

    if ((cur_weight>0) && (cur_weight<1))
      {
        $(".calc_sub").html("Отлично!<br> Движемся к первому<br> килограмму!");
        $(".calc_text_2").html("Это пока немного, но этот<br> вклад уже достоин награды!<br> Приноси вещи в МЕГУ и мы <br>сразу начислим "+cost+" рублей на<br> твой бонусный счет!<br> Давай попробуем собрать 2,5 кг?");   
      }

    if ((cur_weight>=1) && (cur_weight<2.5))
      {
        $(".calc_sub").html("ОГО!<br> Уже "+cur_weight.toFixed(1)+" кг!<br><br>");
        $(".calc_text_2").html('Ты находишься всего в нескольких<br> кг от получения подарочной карты <br>МЕГИ, это так волнующе!<br> Давай добавим что-нибудь еще?..<br>   Собери 2,5 кг, чтобы получить карту <br>"МЕГА подарок" или ИКЕА на 250 рублей.');

      }

    if ((cur_weight>=2.5) && (cur_weight<5))
      {
        $(".calc_sub").html("WOW!<br> Уже "+cur_weight.toFixed(1)+" кг!<br><br>");
        $(".calc_text_2").html('Приноси скорее всё это в МЕГУ<br> и получай карту "МЕГА подарок" или ИКЕА на 250 руб.<br>Следующий уровень – 5 кг!<br>Дойди до него и участвуй в розыгрыше<br>– МОДНОГО ГАРДЕРОБА НА ГОД!');
      }

    if ((cur_weight>=5) && (cur_weight<10))
      {
        $(".calc_sub").html("НЕ МОЖЕТ БЬIТЬ!<br>"+cur_weight.toFixed(1)+" кг!<br><br>");
        $(".calc_text_2").html('Ты уже можешь претендовать на<br> главный приз – МОДНЫЙ ГАРДЕРОБ<br> НА ГОД!<br>Приноси вещи в МЕГУ, получай<br>карты "МЕГА подарок" или ИКЕА на<br>250 руб. за каждые 2,5 кг.');
      }

    if ((cur_weight>=10) && (cur_weight<15))
      {
        $(".calc_sub").html(cur_weight.toFixed(1)+" кг?! В ШКАФУ<br>ЧТО-НИБУДЬ<br> ОСТАЛОСЬ?");
        $(".calc_text_2").html('Мы бережем наших посетителей и не<br> принимаем больше 5 кг вещей в день<br> и 15 кг за весь период акции. Поэтому не <br>жадничай. Собери всё, отбери только вещи<br> в хорошем состоянии, сложи их аккуратно<br> и приезжай скорее в МЕГУ – <br>получай карты "МЕГА подарок" или ИКЕА на <br>250 руб. за каждые 2,5 кг.');
      }

     if ((cur_weight>=15) && (cur_weight<16))
      {
        $(".calc_sub").html(cur_weight.toFixed(1)+" кг! Воу-воу! Потише, <br>скоро в твоем гардеробе <br>совсем ничего не останется!");
        $(".calc_text_2").html('Спасибо, что проявляешь такое рвение, <br>чтобы сделать планету чище и красивее, <br>но по условиям проекта мы принимаем <br>не более 15 кг вещей от одного человека.<br>Пусть остальные килограммы подождут <br>следующего проекта “Меняйся”!');
        $(".calc_text_2").html('Спасибо, что проявляешь такое рвение, <br>чтобы сделать планету чище и красивее. <br>Увы, но мы сможем вознаградить тебя только <br>за 15 кг вещей на протяжении всей акции. <br>Но не унывай - остальные килограммы <br>станут безвозмездным пожертвованием, <br>а ты - Героем Переработки!');
      }





    var height = $(".calc_block_line").height();
    var line_height = (cur_weight/15)*height;

    $(".calc_line").css("height",line_height);
    $(".calc_block_result").css("bottom", line_height);

    $(".calc_calc_weight, .calc_block_result").text(cur_weight.toFixed(1));  

    
  }
});

