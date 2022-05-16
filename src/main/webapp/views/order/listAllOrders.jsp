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
<title>�����q�� - listAllOrders.jsp</title>

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

<%-- ���~��C  --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">�Эץ��H�U���~:</font>
 	<ul>
  		<c:forEach var="message" items="${errorMsgs}">
   			<li style="color: red">${message}</li>
  		</c:forEach>
	</ul>
</c:if>
	<!-- Content Header (Page header) -->
<section class="content-header">
	<div class="container-fluid">
   		<h1>�Ҧ��q��</h1>
  	</div>
</section>
  	<div class="row">
		<div class="col-12">
	 		<div class="card">
	  			<div class="card-header">
					<h3 class="card-title">
						<ul>
			 				<li><a href='<%=request.getContextPath()%>/views/order/addOrders.jsp'>�s�W</a>�q��</li>
						</ul>
					</h3>
					<h3 class="card-title">
						<ul>
			 				<li><a href='<%=request.getContextPath()%>/views/order/Orders.jsp'>��^</a>�q��޲z</li>
						</ul>
					</h3>
	  			</div>
			</div>
		</div>
	</div>
 <!-- --------------------�q��---------------------------- -->
  <div class="card-body table-responsive p-0">
		<table class="table table-hover text-nowrap">
            <thead>
              <tr>
            	<th>�q��s��</th>
				<th>�|���s��</th>
				<th>�إ߮ɶ�</th>
				<th>�q�����</th>
				<th>�q�檬�A</th>
				<th>�I�ڤ覡</th>
				<th>�H�e�a�}</th>
				<th>����</th>
				<th>�ק�</th>
				<th>�R��</th>
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
				<td>${(OrdersVO.orderStatus==1) ? "�w�X�f" : "���X�f"}</td>
				<td>${(OrdersVO.paymentType==1) ? "�H�Υd" : "�{��"}</td>
				<td>${OrdersVO.address}</td>
				<td>
                    <button class="btn btn-primary btnPurple theCheck" onClick="onSubmit(${OrdersVO.orderID})">�d��</button>

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
<!-- --------------------����---------------------------- -->
              <tr>
                <td class="displayNone" colspan="6">
                    <div class="orderListLog">
                        <table class="table mb-0 align-middle ">
                            <thead>
                                <tr class="">
                                	<th>�q����ӽs��</th>
									<th>�q��s��</th>
									<th>�W��s��</th>
									<th>�ӫ~�W��</th>
									<th>�ӫ~�ƶq</th>
									<th>�ӫ~���</th>
                                </tr>
                            </thead>
                            <tbody id ="${OrdersVO.orderID}" >
<!-- --------------------���Ӹ�ƥ�AJAX���b�o---------------------------- -->
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
 <!------------------------���Ӭd��--------------------------------------->
  function onSubmit(orderID){
	  $.ajax({
	  		url: "<%=request.getContextPath()%>/OrdersServlet",           // ��ƽШD�����}
	        type: "POST",                                                 // GET | POST | PUT | DELETE | PATCH
	        data:{"action": "getDetail_By_Order",
	              "orderID": orderID,
	             },                                					      // �ǰe��ƨ���w�� url
	        dataType: "json",                                             // �w���|������^�Ǹ�ƪ��榡�G json | xml | html
	        timeout: 0,                                                   // request �i���ݪ��@��� | 0 �N���]�w timeout
	        beforeSend: function(){                                       // �b request �o�e���e����
	        },
	        headers: {                                                    // request �p�G�����Y��ƷQ�n�]�w����
	        },
	        statusCode: {                                                 // ���A�X
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
	        error: function(xhr){         // request �o�Ϳ��~���ܰ���
	          console.log(xhr);
	        },
	        complete: function(xhr){      // request �����������(�b success / error �ƥ󤧫����)
	          console.log(xhr);
	        }
	      });
  }
  <!------------------------�R��--------------------------------------->
	function onDelete(orderID) {  
		 Swal.fire({
		       title: '�T�w�n�R����?',
		       text: "�z�N�L�k�٭즹���e�I",
		       icon: 'warning',
		       showCancelButton: true,
		       confirmButtonColor: '#3085d6',
		       cancelButtonColor: '#d33',
		       cancelButtonText: '����',
		       confirmButtonText: '�O���A �R�����'
		       }).then(function(isConfirm) {  
		          if(isConfirm.value !=true) {  
		              return false;
		          } else {  
		            Swal.fire(
		                     '�R�����\!',   
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