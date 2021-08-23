$(window).on('load',function(){
  $("#splash-logo_home").delay(1200).fadeOut('slow');//ロゴを1.2秒でフェードアウトする記述

  //=====ここからローディングエリア（splashエリア）を1.5秒でフェードアウトした後に動かしたいJSをまとめる
  $("#splash_home").delay(1500).fadeOut('slow',function(){//ローディングエリア（splashエリア）を1.5秒でフェードアウトする記述
  
      $(".body_home").addClass('appear');//フェードアウト後bodyにappearクラス付与

  });
  //=====ここまでローディングエリア（splashエリア）を1.5秒でフェードアウトした後に動かしたいJSをまとめる
  
 //=====ここから背景が伸びた後に動かしたいJSをまとめたい場合は
  $('.splashbg1_home').on('animationend', function() {    
      //この中に動かしたいJSを記載
  });
  $('.splashbg2_home').on('animationend', function() {    
    //この中に動かしたいJSを記載
});
  //=====ここまで背景が伸びた後に動かしたいJSをまとめる
   
});