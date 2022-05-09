<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="web.order.entity.*"%>
<%@ page import="web.order.service.*"%>

<%
OrdersService odrSvc = new OrdersService();
List<OrdersVO> list = odrSvc.getAll();
pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>全部訂單 - listAllOrders.jsp</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/orders/css/adminlte.min.css">

<script src="https://kit.fontawesome.com/f944d9625b.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/orders/css/btn.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="<%=request.getContextPath()%>/resources/orders/js/adminlte.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/orders/plugins/jquery/jquery.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/orders/js/btn.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/css_bootstrap/bootstrap.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member.css">

</head>
<body>

<%-- 錯誤表列  --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">請修正以下錯誤:</font>
 	<ul>
  		<c:forEach var="message" items="${errorMsgs}">
   			<li style="color: red">${message}</li>
  		</c:forEach>
	</ul>
</c:if>
	<!-- Content Header (Page header) -->
<section class="content-header">
	<div class="container-fluid">
   		<h1>所有訂單</h1>
  	</div>
</section>
  	<div class="row">
		<div class="col-12">
	 		<div class="card">
	  			<div class="card-header">
					<h3 class="card-title">
						<ul>
			 				<li><a href='<%=request.getContextPath()%>/views/order/addOrders.jsp'>新增</a>訂單</li>
						</ul>
					</h3>
					<h3 class="card-title">
						<ul>
			 				<li><a href='<%=request.getContextPath()%>/views/order/Orders.jsp'>返回</a>訂單管理</li>
						</ul>
					</h3>
	  			</div>
			</div>
		</div>
	</div>
 <!-- --------------------訂單---------------------------- -->
  <div class="card-body table-responsive p-0">
		<table class="table table-hover text-nowrap">
            <thead>
              <tr>
            	<th>訂單編號</th>
				<th>會員編號</th>
				<th>建立時間</th>
				<th>訂單價格</th>
				<th>訂單狀態</th>
				<th>付款方式</th>
				<th>寄送地址</th>
				<th>明細</th>
				<th>修改</th>
				<th>刪除</th>
              </tr>
            </thead>
            <tbody >
	<%@ include file="page1.file"%>
	<c:forEach var="OrdersVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			  <tr>
				<td>${OrdersVO.orderID}</td>
				<td>${OrdersVO.memID}</td>
				<td>${OrdersVO.createTime}</td>
				<td>${OrdersVO.orderPrice}</td>
				<td>${(OrdersVO.orderStatus==1) ? "已出貨" : "未出貨"}</td>
				<td>${(OrdersVO.paymentType==1) ? "信用卡" : "現金"}</td>
				<td>${OrdersVO.address}</td>
				<td>
                    <button class="btn btn-primary btnPurple theCheck" onClick="onSubmit(${OrdersVO.orderID})">查看</button>

                </td>										
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" style="margin-bottom: 0px;">
						<button type="submit" class="btn_modal" style="margin-right: 15px">
							<i class="nav-icon fas fa-edit" type="button"></i>
						</button>
						<input type="hidden" name="orderID" value="${OrdersVO.orderID}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" onClick="onDelete(${OrdersVO.orderID})" style="margin-bottom: 0px;">
						<button type="button" class="btn_modal_del"  style="margin-right:15px">
                        	<i class="fa-solid fa-trash-can" type="button"></i>
                      	</button>
						<input type="hidden" name="orderID" value="${OrdersVO.orderID}"> 
						<input type="hidden" name="action" value="delete">

					</FORM>
				</td>
			  </tr>
<!-- --------------------明細---------------------------- -->
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
                            <tbody id ="${OrdersVO.orderID}" >
<!-- --------------------明細資料用AJAX插在這---------------------------- -->
                            </tbody>
                        </table>
                    </div>
                  </td>
              </tr>
            </c:forEach>
           </tbody> 
        </table>
             <%@ include file="page2.file"%>
    </div>
    
<script src="<%=request.getContextPath()%>/resources/jquery-3.6.0.min.js"></script>
    
<script src="<%=request.getContextPath()%>/resources/js/orderListLog.js"></script>

<script>
 <!------------------------明細查看--------------------------------------->
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
  <!------------------------刪除--------------------------------------->
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
		         setTimeout(function(){window.location.reload();},1000);
		                     }
		                 });
		               }
		         })   
	};
  </script>
</body>
</html>