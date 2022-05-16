$(function () {

  $("body").click(function () {
    $(".overlay1").hide();
    $(".overlay2").hide();
  });


  $(".article-user").click(function (e) {
    e.stopPropagation();
  });

  $(".article-user2").click(function (e) {
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




 // 開啟 Modal 彈跳視窗
 $(".new_mam").on("click", function (e) {
  e.stopPropagation();
  $(".overlay2").fadeIn();
});


// 關閉 Modal
$(".btn_modal_close1").on("click", function (e) {
  e.stopPropagation();
  $(".overlay2").fadeOut();
});

  



  $(".btn_modal_del").on("click", function () {
    // alert("確定要刪除?");
    Swal.fire({
      title: '確定要刪除嗎?',
      text: "您將無法還原此內容！",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText: '取消',
      confirmButtonText: '是的， 刪除資料'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire(
          '刪除成功!',
          'Your file has been deleted.',
          'success'
        )
      }
    })
  });



  $(document).ready(function(){
    $("#CheckAll").click(function(){
     if($("#CheckAll").prop("checked")){//如果全選按鈕有被選擇的話（被選擇是true）
      $("input[name='Checkbox[]']").prop("checked",true);//把所有的核取方框的property都變成勾選
     }else{
      $("input[name='Checkbox[]']").prop("checked",false);//把所有的核取方框的property都取消勾選
     }
    })
   })

   $(document).ready(function(){
    $("#CheckAll-1").click(function(){
     if($("#CheckAll-1").prop("checked")){//如果全選按鈕有被選擇的話（被選擇是true）
      $("input[name='Checkbox[]']").prop("checked",true);//把所有的核取方框的property都變成勾選
     }else{
      $("input[name='Checkbox[]']").prop("checked",false);//把所有的核取方框的property都取消勾選
     }
    })
   })


});




