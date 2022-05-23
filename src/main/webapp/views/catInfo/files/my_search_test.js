

$(".dropdown-menu li").on("click", function(){

    $(".dropdown-menu li").removeClass('selected');
    $(this).addClass('selected');
      var value = $('.dropdown-menu li.selected').attr('value');
    //   alert('Selected menu value: ' + value);
      $.ajax({
             url: "\${pageContext.request.contextPath}/CatInfoServlet",
              data: {
                "value": value
              },
              type: "POST",
              success: function (data) {
                /* console.log(data); */
                //  $("#catlist").load("http://localhost:8081/Adopets/views/catInfo/My_search.jsp #catlist");
                 /* $('body').load("http://localhost:8081/Adopets/views/catInfo/listAllCat.jsp); */
                $("#catlist").css("border", "1px solid red");
/* 	                $(".animalSearchBody").load("\${pageContext.request.contextPath}/CatInfoServlet"); */
              }
      })

}); 