
function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}

var share_winners_url = "http://change.megamall.ru/photo/56fe9fa95f2dd46f6654a298";
var share_winners_img = "http://change.megamall.ru/api/photo/56fe9fa95f2dd46f6654a298/share.png";
var share_winners_title = "Эксперт моды оценил мой лук!";
var share_winners_text = "Получи совет от одного из экспертов моды проекта “Меняйся”! Загрузи свой лук на change.megamall.ru и получи шанс выиграть одну из карт “МЕГА Подарок” на 3000 р.!";


var share_url = "http://change.megamall.ru";
var share_img = "http://change.megamall.ru/static/images/share2.png";
var share_title = 'Меняйся с МЕГОЙ!';
var share_text = 'С 9 марта по 9 апреля приноси ненужную одежду в МЕГУ, участвуй в онлайн-конкурсе и получай призы!';

var share_calc_image = "http://change.megamall.ru/static/images/calc/share_calc.png";
var share_calc_title = 'Посчитай, сколько ты получишь за ненужные вещи!';
var share_calc_text = "Приноси ставшие ненужными вещи в зону “Меняйся”. МЕГА отправит их на благотворительность или переработку, а ты получишь 100 р. за каждый 1 кг вещей!";
var share_calc_url = "http://change.megamall.ru/calculate";


$(document).on("click",".open_menu",function(){
  $(".header_menu").addClass("active");
  console.log('open');
});

$(document).on("click",".mega_close",function(){
  $(".header_menu").removeClass("active");
});

/*Sharer*/

Share = {
  vkontakte: function(purl, ptitle, pimg, text, type) {
    url  = 'http://vkontakte.ru/share.php?';
    url += 'url='          + encodeURIComponent(purl);
    url += '&title='       + encodeURIComponent(ptitle);
    url += '&description=' + encodeURIComponent(text);
    url += '&image='       + pimg;
    url += '&noparse=true';

    Share.popup(url);

    if (type=="calc") {
      ga('send', 'event', 'share', 'calc_share');
    }
    if (type == "expert") {
      ga('send', 'event', 'share', 'expert_share');
    }
    if (type =="footer") {
      ga('send', 'event', 'share', 'site_share');
    }

    
  },
  odnoklassniki: function(purl, text, type) {
    url  = 'http://www.odnoklassniki.ru/dk?st.cmd=addShare&st.s=1';
    url += '&st.comments=' + encodeURIComponent(text);
    url += '&st._surl='    + encodeURIComponent(purl);
    Share.popup(url);
    
    if (type=="calc") {
      ga('send', 'event', 'share', 'calc_share');
    }
    if (type == "expert") {
      ga('send', 'event', 'share', 'expert_share');
    }
    if (type =="footer") {
      ga('send', 'event', 'share', 'site_share');
    }
  },
  facebook: function(purl, ptitle, pimg, text, type) {
    url  = 'http://www.facebook.com/sharer.php?s=100';
    url += '&p[title]='     + encodeURIComponent(ptitle);
    url += '&p[summary]='   + encodeURIComponent(text);
    url += '&p[url]='       + encodeURIComponent(purl);
    url += '&p[images][0]=' + encodeURIComponent(pimg);
    Share.popup(url);
    
    if (type=="calc") {
      ga('send', 'event', 'share',  'calc_share');
    }
    if (type == "expert") {
      ga('send', 'event', 'share',  'expert_share');
    }
    if (type =="footer") {
      ga('send', 'event', 'share',  'site_share');
    }
    
  },
  twitter: function(purl, ptitle, type) {
    url  = 'http://twitter.com/share?';
    url += 'text='      + encodeURIComponent(ptitle);
    url += '&url='      + encodeURIComponent(purl);
    url += '&counturl=' + encodeURIComponent(purl);
    Share.popup(url);
   

    if (type=="calc") {
      ga('send', 'event', 'share', 'calc_share');
    }
    if (type == "expert") {
      ga('send', 'event', 'share', 'expert_share');
    }
    if (type =="footer") {
      ga('send', 'event', 'share', 'site_share');
    }
   
  },

  popup: function(url) {
    window.open(url,'','toolbar=0,status=0,width=626,height=436');
  }
};



//превью
var opts = {
  lines: 13, // The number of lines to draw
  length: 20, // The length of each line
  width: 10, // The line thickness
  radius: 30, // The radius of the inner circle
  corners: 1, // Corner roundness (0..1)
  rotate: 0, // The rotation offset
  direction: 1, // 1: clockwise, -1: counterclockwise
  color: '#ec0933', // #rgb or #rrggbb or array of colors
  speed: 1, // Rounds per second
  trail: 60, // Afterglow percentage
  shadow: false, // Whether to render a shadow
  hwaccel: false, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: '43%', // Top position relative to parent
  left: '50%' // Left position relative to parent
};
      



var top_show = 250; // В каком положении полосы прокрутки начинать показ кнопки "Наверх"
  var delay = 1000; // Задержка прокрутки
  $(document).ready(function() {
    $(window).scroll(function () { // При прокрутке попадаем в эту функцию
      /* В зависимости от положения полосы прокрукти и значения top_show, скрываем или открываем кнопку "Наверх" */
      if ($(this).scrollTop() > top_show) $('.expert_up').addClass("active");
      else $('.expert_up').removeClass("active");
    });
    $('.expert_up').click(function () { // При клике по кнопке "Наверх" попадаем в эту функцию
      /* Плавная прокрутка наверх */
      $('body, html').animate({
        scrollTop: 0
      }, delay);
    });
  });



