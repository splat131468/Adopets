$(function(){
    // 開啟彈跳視窗
    $(".btnPurple").on("click", function(){
      $(".mask").fadeIn();
      $(".forgotPwd").fadeIn();
    });
    // 關閉 
    $("div.close").on("click", function(){
      $(".mask").fadeOut();
      $(".forgotPwd").fadeOut();
    });
    $(".mask").on("click", function(){
      $(".mask").fadeOut();
      $(".forgotPwd").fadeOut();
    });
  });