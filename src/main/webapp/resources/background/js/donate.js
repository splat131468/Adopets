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
        $("#custom-other-amount").val("");
    })

});

function test(thisDiv){  
    let val=$(thisDiv).children("span").eq(0).text(); 
	
    console.log(val);
    if(val!=null){
        $('.price').html(val); 
        $('#moneyD').val(val);
        $(".btn").removeAttr("disabled");
        document.getElementById("errorM").innerHTML = "";
    }
}

function selectValue() {
 
    let value = document.getElementById("custom-other-amount").value;
    
    if(value>0){
        console.log(value);
        $('.price').html(value);
        $('#moneyD').val(value);
        $(".btn").removeAttr("disabled");
        document.getElementById("errorM").innerHTML = "";
    }
}







  $(document).ready(function(){
    $('.custom_next .btn').click(function() {
        var val=$(".active-1").children("span").eq(0).text();
        var value = document.getElementById("custom-other-amount").value;
        console.log(val);
        console.log(value);
  if (value==""&&val=="") {
    document.getElementById("errorM").innerHTML = "<font>請輸入一個有效的金額。捐款金額要大於等於 100</font>";
  }else if(val>0||value>0) {
    document.getElementById("errorM").innerHTML = ""
    $(".btn").removeAttr("disabled");
    $('#content-main1').show();
    $('#content-main').hide();
    $('#content-main2').hide();
  }     
    });
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


function validate_phone(phone) {
    console.log("AAA");
    var phoneReg = /^[0-9]{10}$/g;
    if (phone != "" && phone.search(phoneReg) != -1) {
        document.getElementById("errorP").innerHTML = "";
        $(".btn_next").removeAttr("disabled");
    } else if (phone == null || phone == '' || phone == undefined) {
        document.getElementById("errorP").innerHTML = "<font>電話: 請勿空白</font>";
        $(".btn_next").attr("disabled", "true");
    } else {
        document.getElementById("errorP").innerHTML = "<font>電話號碼格式有誤！（09-12123123）</font>";
        $(".btn_next").attr("disabled", "true");
    }
}



function validate_account(account) {
    console.log("AAA");
    var accountReg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
    if (account != "" && account.search(accountReg) != -1) {
        document.getElementById("errorE").innerHTML = "";
        $(".btn_next").removeAttr("disabled");
    } else if (account == null || account == '' || account == undefined) {
        document.getElementById("errorE").innerHTML = "<font>email: 請勿空白</font>";
        $(".btn_next").attr("disabled", "true");
    } else {
        document.getElementById("errorE").innerHTML = "<font>email: 請輸入正確的格式。</font>";
        $(".btn_next").attr("disabled", "true");
    }
}





$(document).ready(function () {
    $('.btn_next').click(function () {
        var val = $(".phone_name").val();
        var value = document.getElementById("email-5").value;
        console.log(val);
        console.log(value);
        if (value == "" || val == "") {
            document.getElementById("errorN").innerHTML = "<font>【電子信箱、電話為必填欄位，請勿留空。】</font>";
            $(".btn_next").attr("disabled", "true");
        } else if (val > 0 || value > 0) {
            document.getElementById("errorN").innerHTML = ""
            $(".btn_next").removeAttr("disabled");
            $('#content-main2').show();
            $('#content-main1').hide();
            $('#content-main').hide();
        }
    });

});



 


