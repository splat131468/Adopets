$(".memberTabBar a").on("click",function(){
    $(this).addClass("active");
    $(this).closest("div").siblings().find("a").removeClass("active");
});