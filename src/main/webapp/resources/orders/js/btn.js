$(function () {

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

// 	<script> 
// 	function onAdminSubmit(orderID) {  
//  console.log(orderID);
//  Swal.fire({
//        title: '確定要刪除嗎?',
//        text: "您將無法還原此內容！",
//        icon: 'warning',
//        showCancelButton: true,
//        confirmButtonColor: '#3085d6',
//        cancelButtonColor: '#d33',
//        cancelButtonText: '取消',
//        confirmButtonText: '是的， 刪除資料'
//        }).then(function(isConfirm) {  
//           if(isConfirm.value !=true) {  
//               return false;
//           } else {  
//             Swal.fire(
//                      '刪除成功!',
                    
//           );
//             $.ajax({
//                      url: ""<%=request.getContextPath()%>/OrdersServlet"", 
//                      data:{
//                        "action": "delete",
//               "orderID": orderID,
//                         },
//                      type: "post",
//                      success:function (data) {
//         window.location.href='<%=request.getContextPath()%>/views/orders/Orders.jsp'; 
//          //document.location.reload();
//          setTimeout(function(){window.location.reload();},2000);
//                      }
//                  });
//                }
//          })   
// }
//	</script>

  // $(".mt-2").on("click", "li", function () {
  //   var sId = $(this).data("id"); //获取data-id的值
  //   window.location.hash = sId; //设置锚点
  //   loadInner(sId);
  // });

  // function loadInner(sId) {
  //   var sId = window.location.hash;
  //   var pathn, i;
  //   switch (sId) {
  //     case "#member_M":
  //       pathn = "member.html";
  //       i = 0;
  //       break;
  //     case "#check_M":
  //       pathn = "checked.html";
  //       i = 1;
  //       break;
  //     case "#store_M":
  //       pathn = "goods.html";
  //       i = 2;
  //       break;
  //     case "#list_M":
  //       pathn = "lists.html";
  //       i = 3;
  //       break;
  //     case"money_M":
  //       pathn = "money.html";
  //       i = 0;
  //       break;
  //   }
  //   $(".content-wrapper").load(pathn); //加载相对应的内容
  //   // $(".userMenu li").eq(i).addClass("current").siblings().removeClass("current"); //当前列表高亮
  // }
  // var sId = window.location.hash;
  // loadInner(sId);


});








