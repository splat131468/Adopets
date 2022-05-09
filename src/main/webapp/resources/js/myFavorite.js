// $(function(){
//     // 開啟彈跳視窗
// $(".cancelBtn").on("click", function(){
//         console.log(this); 
//         $(".mask").fadeIn();
//         $(".confirmBox").fadeIn();
//     });
//         // 關閉 
//         $(".cancelNo").on("click", function(){
//         $(".mask").fadeOut();
//         $(".confirmBox").fadeOut();
//     });
//     $(".mask").on("click", function(){
//         $(".mask").fadeOut();
//         $(".confirmBox").fadeOut();
//     });

//     $(".cancelYes").on("click",function(){
//         $(".mask").fadeOut();
//         $(".confirmBox").fadeOut();
//     });
//     $(".cancelBtn").on("click", function(){
//             $(".cancelBox").animate({
//                 "opacity":0
//             },1000,"swing",function(){
//                 $(this).remove();
//             });
//     }); 
// });



$(".cancelBox").on("click",".cancelBtn",function(){
    let r = confirm("確認要把我移除最愛嗎QQ?");
    if(r){
        $(this).closest(".cancelBox").animate({
            "opacity":0
        },1000,"swing",function(){
            $(this).remove();
        });
    }
});
