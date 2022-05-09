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






});


//新增管理員的前端驗證
function validate_account(account) {
	console.log("AAA");
  var accountReg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
  if (account != "" && account.search(accountReg) != -1) {
    document.getElementById("error2").innerHTML = "";
    $(".btn_sub1").removeAttr("disabled");
  } else if (account == null || account == '' || account == undefined) {
    document.getElementById("error2").innerHTML = "<font>帳號: 請勿空白</font>";
    $(".btn_sub1").attr("disabled", "true");
  } else {
    document.getElementById("error2").innerHTML = "<font>帳號: 請輸入正確的格式。</font>";
    $(".btn_sub1").attr("disabled", "true");
  }
}


function validate_password(password) {
  var passwordReg = /^[0-9A-Za-z]{8,20}$/;
  if (password != "" && password.search(passwordReg) != -1) {
    document.getElementById("error").innerHTML = "";
    $(".btn_sub1").removeAttr("disabled");
  } else if (password == null || password == '' || password == undefined) {
    document.getElementById("error").innerHTML = "<font>密碼: 請勿空白</font>";
    $(".btn_sub1").attr("disabled", "true");
  } else {
    document.getElementById("error").innerHTML = "<font>密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫</font>";
    $(".btn_sub1").attr("disabled", "true");
  }
}



function validate_name(name) {
  var nameReg = /^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$/;
  if (name != "" && name.search(nameReg) != -1) {
    document.getElementById("error1").innerHTML = "";
    $(".btn_sub1").removeAttr("disabled");
  } else if (name == null || name == '' || name == undefined) {
    document.getElementById("error1").innerHTML = "<font>員工姓名: 請勿空白</font>";
    $(".btn_sub1").attr("disabled", "true");
  } else {
    document.getElementById("error1").innerHTML = "<font>員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間</font>";
    $(".btn_sub1").attr("disabled", "true");
  }
}






//修改管理員的前端驗證
function validate_password(password) {
  var passwordReg = /^[0-9A-Za-z]{8,20}$/;
  if (password != "" && password.search(passwordReg) != -1) {
    document.getElementById("error").innerHTML = "";
    $(".btn_sub").removeAttr("disabled");
  } else if (password == null || password == '' || password == undefined) {
    document.getElementById("error").innerHTML = "<font>密碼: 請勿空白</font>";
    $(".btn_sub").attr("disabled", "true");
  } else {
    document.getElementById("error").innerHTML = "<font>密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫</font>";
    $(".btn_sub").attr("disabled", "true");
  }
}



function validate_name(name) {
  var nameReg = /^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$/;
  if (name != "" && name.search(nameReg) != -1) {
    document.getElementById("error1").innerHTML = "";
    $(".btn_sub").removeAttr("disabled");
  } else if (name == null || name == '' || name == undefined) {
    document.getElementById("error1").innerHTML = "<font>員工姓名: 請勿空白</font>";
    $(".btn_sub").attr("disabled", "true");
  } else {
    document.getElementById("error1").innerHTML = "<font>員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間</font>";
    $(".btn_sub").attr("disabled", "true");
  }
}



 //點選全選，子複選框被選中
 function demo(){
  var allcheck=document.getElementById("allcheck");
  var choice=document.getElementsByName("choice");
  for(var i=0;i<choice.length;i++){
      choice[i].checked=allcheck.checked;
  }
}

//點選子複選框,全選框 選中、取消
function setAll(){
  if(!$(".checknum").checked){
      $("#allcheck").prop("checked",false); // 子複選框某個不選擇，全選也被取消
  }
  var choicelength=$("input[type='checkbox'][class='checknum']").length;
  var choiceselect=$("input[type='checkbox'][class='checknum']:checked").length;

  if(choicelength==choiceselect){
      $("#allcheck").prop("checked",true);   // 子複選框全部部被選擇，全選也被選擇；1.對於HTML元素我們自己自定義的DOM屬性，在處理時，使用attr方法；2.對於HTML元素本身就帶有的固有屬性，在處理時，使用prop方法。
  }

}