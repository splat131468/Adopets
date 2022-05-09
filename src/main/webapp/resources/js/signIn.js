$(function(){
    // 開啟彈跳視窗
    $(".homepage").on("click", function(){
      $(".mask").fadeIn();
      console.log("ttt");
      $(".login-box").fadeIn();
    });
    // 關閉 
    $("div.close").on("click", function(){
      $(".mask").fadeOut();
      $(".login-box").fadeOut();
    });
    $(".mask").on("click", function(){
      $(".mask").fadeOut();
      $(".login-box").fadeOut();
    });
});