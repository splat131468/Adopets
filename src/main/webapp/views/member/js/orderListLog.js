$(".theCheck").on("click",function(){
    $(this).parent().parent().next().children().toggleClass("tableCell");
});
$(document).ready(function(){
    let z = 0;
    // x = "迴圈的次數";
    $(".orderListCount").text(z);
});