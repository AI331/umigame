$(window).on('load',function(){
  $("#splash-logo_room").delay(1200).fadeOut('slow');//ロゴを1.2秒でフェードアウトする記述
  
  //=====ここからローディングエリア（splashエリア）を1.5秒でフェードアウトした後に動かしたいJSをまとめる
  $("#splash_room").delay(1500).fadeOut('slow',function(){//ローディングエリア（splashエリア）を1.5秒でフェードアウトする記述
  
  $(".body_room").addClass('appear');//フェードアウト後bodyにappearクラス付与
  
  });
  //=====ここまでローディングエリア（splashエリア）を1.5秒でフェードアウトした後に動かしたいJSをまとめる
  
  //=====ここから背景が伸びた後に動かしたいJSをまとめたい場合は
  $(".splashbg_room").on('animationend', function() { 
  //この中に動かしたいJSを記載
  });
  //=====ここまで背景が伸びた後に動かしたいJSをまとめる
  
  });





  $('#timer2').yycountdown({
    startDateTime : '2021/08/08 23:59:55',  //カウントダウン開始日時
    endDateTime   : '2020/08/27 00:00:00',  //カウントダウン終了日時
    unit          : {m: '分', s: '秒'},  //カウントダウン単位
    complete      : function(_this){  //カウントダウン完了時のコールバック
                      _this.find('.yycountdown-box').css({color:'red'});
                    }
  });
  