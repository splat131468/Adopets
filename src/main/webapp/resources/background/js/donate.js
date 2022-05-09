$(function () {
	$(".price_set_btn div").on("mouseenter", function(){
	
	   $(this).toggleClass("active");
	});
	$(".price_set_btn div").on("mouseleave", function(){
	
	   $(this).toggleClass("active");
	});

});

$(function () {
 
    $(".price_set_btn div").on("click",function() {
        $(this).addClass("active-1").siblings().removeClass("active-1");
        })

});



// ---------------------------------------------切換-----------------------------------------------------

$(document).ready(function(){
    $('a.btn_pure').click(function() {
      $('#content-main1').show();
      $('#content-main2').hide();
      $('#content-main').hide();
      
    });
});



$(document).ready(function(){
    $('.btn_next').click(function() {
      $('#content-main2').show();

      $('#content-main1').hide();
      $('#content-main').hide();
      
    });
});


$(document).ready(function(){
    $('.content6 .btn').click(function() {
      $('#content-main').show();

      $('#content-main1').hide();
      $('#content-main2').hide();
      
    });
});


$(document).ready(function(){
    $('.btn_content .btn').click(function() {
      $('#content-main').show();

      $('#content-main1').hide();
      $('#content-main2').hide();
      
    });
});

$(document).ready(function(){
    $('.custom_next .btn').click(function() {
      $('#content-main1').show();

      $('#content-main').hide();
      $('#content-main2').hide();
      
    });
});




