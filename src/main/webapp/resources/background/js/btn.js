
$("body").click(function () {
  $(".overlay1").hide();
});


$(".article-user").click(function (e) {
  e.stopPropagation();
});

// 開啟 Modal 彈跳視窗
$(".btn_modal").on("click", function (e) {
  e.stopPropagation();
  $(".overlay1").fadeIn();
});


// 關閉 Modal
$(".btn_modal_close").on("click", function (e) {
  e.stopPropagation();
  $(".overlay1").fadeOut();
});





function showAtRight(url) {
  $.ajax({
    type: "POST",
    url: url,
    dataType: "html",
    success: function (data) {
      $(".content-wrapper").html(data);
    },
    error: function () {
      $(".content-wrapper").html("頁面載入失敗！");
    }
  });
}











