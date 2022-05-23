<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.member.*" %>
<%@ page import="web.order.entity.*" %>
<%@ page import="web.order.service.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>認養紀錄</title>
    <!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/summernote/summernote-bs4.min.css">
<!-- sweetalert2 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/css/system.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/css/btn.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="https://kit.fontawesome.com/f944d9625b.js"></script>

<script src="<%=request.getContextPath()%>/resources/background/js/btn.js"></script>
<!-- js要在jQuery之後才能引進 -->
<script src="<%=request.getContextPath()%>/resources/background/js/system.js"></script>
	
<!-- Bootstrap 4 -->
 <script src="<%=request.getContextPath()%>/resources/background/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/background/js/adminlte.min.js"></script>
    
<!-- ------------------------------------------------------------------------------------------------------- -->
 <link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/bootstrap.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/member.css">
</head>
<body>
    <div class="container">
        <div class="row mb-3 justify-content-center mt-5">
            <div class="col-8 themed-grid-col">
              <div class="row memberTabBar">
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/member.jsp" class="">會員資料</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/myFavorite.jsp" class="">我的最愛</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/adoptLog.jsp" class="">認養紀錄</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/adoptLog.jsp"class="">捐款紀錄</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/OrdersServlet?action=get_Member_Order" class="active">訂單紀錄</a>
                  
                </div>
                <div class="col-2">
                  <a href="#" class="">我想登出</a>
                </div>
              </div>
            </div>
        </div>
    </div>
  <!-- -------------------------訂單-------------------------------------------------------------------- -->
  
   <div class="card-body table-responsive p-0">
		<table class="table table-hover text-nowrap">
			<thead>
				<tr>
					<th>訂單編號</th>
					<th>會員編號</th>
					<th>建立時間</th>
					<th>訂單價格</th>
					<th>訂單狀態</th>
					<th>支付方式</th>
					<th>寄送地址</th>
					<th>明細</th>
					<th>刪除</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach var="ordersVO" items="${list}">
				<tr>
					<td>${ordersVO.orderID}</td> 
					<td>${ordersVO.memID}</td>
					<td>${ordersVO.createTime}</td>
					<td>${ordersVO.orderPrice}</td>
					<td>${(ordersVO.orderStatus==1) ? "已出貨" : "未出貨"}</td>
					<td>${(ordersVO.paymentType==1) ? "信用卡" : "現金"}</td>
					<td>${ordersVO.address}</td>
					<td>
                    	<button class="btn btn-primary btnPurple theCheck" onClick="onSubmit(${ordersVO.orderID})">查看</button>

                	</td>	
					<td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" onClick="onDelete(${ordersVO.orderID})" style="margin-bottom: 0px;">
						<button type="button" class="btn_modal_del"  style="margin-right:15px">
                        	<i class="fa-solid fa-trash-can" type="button"></i>
                      	</button>
						<input type="hidden" name="orderID" value="${ordersVO.orderID}"> 
						<input type="hidden" name="action" value="delete">
					</FORM>
					</td>
				</tr>		
<!-- --------------------明細--------------------------------------------------------------------------- -->
              	<tr>
	                <td class="displayNone" colspan="6">
	                    <div class="orderListLog">
	                        <table class="table mb-0 align-middle ">
	                            <thead>
	                                <tr class="">
	                                	<th>訂單明細編號</th>
										<th>訂單編號</th>
										<th>規格編號</th>
										<th>商品名稱</th>
										<th>商品數量</th>
										<th>商品單價</th>
	                                </tr>
	                            </thead>
	                            <tbody id ="${ordersVO.orderID}" >
<!-- --------------------明細資料用AJAX插在這----------------------------------------------------------------- -->
                            	</tbody>
                        	</table>
                    	</div>
                  	</td>
              	</tr>
            </c:forEach>
           	</tbody> 
        </table>    
    </div>	
  
<script>
<!------------------------明細查看------------------------------------------------------------------------------>
  function onSubmit(orderID){
	  $.ajax({
	  		url: "<%=request.getContextPath()%>/OrdersServlet",           // 資料請求的網址
	        type: "POST",                                                 // GET | POST | PUT | DELETE | PATCH
	        data:{"action": "getDetail_By_Order",
	              "orderID": orderID,
	             },                                					      // 傳送資料到指定的 url
	        dataType: "json",                                             // 預期會接收到回傳資料的格式： json | xml | html
	        timeout: 0,                                                   // request 可等待的毫秒數 | 0 代表不設定 timeout
	        beforeSend: function(){                                       // 在 request 發送之前執行
	        },
	        headers: {                                                    // request 如果有表頭資料想要設定的話
	        },
	        statusCode: {                                                 // 狀態碼
	          200: function (res) {
	          },
	          404: function (res) {
	          },
	          500: function (res) {
	          }
	        },
	        success: function(data){   
	        	
	        	var data = JSON.parse(data);
	        	var list;
	        	
	        	for(let i =0; i< data.length;i++ ){
	        		console.log(data[i])
	         	list +=`
	        		<tr>
	        		<td>`+data[i]['orderDetailID']+`</td>
	        		<td>`+data[i]['orderID']+`</td>
	        		<td>`+data[i]['skuID']+`</td>
	        		<td>`+data[i]['prodName']+`</td>
	        		<td>`+data[i]['prodNum']+`</td>
	        		<td>`+data[i]['prodPrice']+`</td>
	        		</tr>
	        	`}
	        	$(".theCheck").on("click",function(){
	        		$(this).parent().parent().next().children().toggleClass("tableCell");
	        	});
	        	$("#"+orderID).html(list);	            
	        },
	        error: function(xhr){         // request 發生錯誤的話執行
	          console.log(xhr);
	        },
	        complete: function(xhr){      // request 完成之後執行(在 success / error 事件之後執行)
	          console.log(xhr);
	        }
	      });
  }
<!-----------------刪除------------------------------------------------------------------------------------>
function onDelete(orderID) {  
	 Swal.fire({
	       title: '確定要刪除嗎?',
	       text: "您將無法還原此內容！",
	       icon: 'warning',
	       showCancelButton: true,
	       confirmButtonColor: '#3085d6',
	       cancelButtonColor: '#d33',
	       cancelButtonText: '取消',
	       confirmButtonText: '是的， 刪除資料'
	       }).then(function(isConfirm) {  
	          if(isConfirm.value !=true) {  
	              return false;
	          } else {  
	            Swal.fire(
	                     '刪除成功!',   
	          );
	            $.ajax({
	                     url: "<%=request.getContextPath()%>/OrdersServlet", 
	                     data:{"action": "delete",
	              				"orderID": orderID,
	                       	  },
	                     type: "post",
	                     success:function (data) {
	         setTimeout(function(){window.location.reload();},2000);
	                     }
	                 });
	               }
	         })   
};
</script>  			      
<script src="<%=request.getContextPath()%>/views/member/js/address.js"></script>
<script src="<%=request.getContextPath()%>/views/member/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/views/member/js/orderListLog.js"></script>
<script src="<%=request.getContextPath()%>/views/member/js/memberTabBar.js"></script>
</body>
</html>