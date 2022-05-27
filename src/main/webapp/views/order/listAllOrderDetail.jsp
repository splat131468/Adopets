<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="web.order.service.*"%>
<%@ page import="web.order.entity.*"%>

<%
    OrderDetailService odrdtlSvc = new OrderDetailService();
    List<OrderDetailVO> list = odrdtlSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllOrderDetail.jsp</title>

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

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/css_bootstrap/bootstrap.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member.css">

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

<%@ include file="/views/order/pages/background.file" %>
<!-- ------------------------------------------------------------------------------------------- -->
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
   				<h1>所有訂單明細</h1>
  			</div>
		</section>
  			<div class="row">
				<div class="col-12">
	 				<div class="card">
	  					<div class="card-header">
							<h3 class="card-title">
								<ul>
			 						<li><a href='<%=request.getContextPath()%>/views/order/Orders.jsp'>返回</a>訂單管理</li>
								</ul>
							</h3>
	  					</div>
					</div>
				</div>
			</div>

<!-- ------------------------------------------------------------------------------------------- -->
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<!-- ------------------------------------------------------------------------------------------- -->
 	<div class="card-body table-responsive p-0">
		<table class="table table-hover text-nowrap">
			<tr>
				<th>訂單明細編號</th>
				<th>訂單編號</th>
				<th>規格編號</th>
				<th>商品名稱</th>
				<th>商品數量</th>
				<th>商品單價</th>
				<th>修改</th>
				<th>刪除</th>
			</tr>
			<%@ include file="page1.file" %> 
			<c:forEach var="OrderDetailVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${OrderDetailVO.orderDetailID}</td>
				<td>${OrderDetailVO.orderID}</td>
				<td>${OrderDetailVO.skuID}</td>
				<td>${OrderDetailVO.prodName}</td>
				<td>${OrderDetailVO.prodNum}</td>
				<td>${OrderDetailVO.prodPrice}</td>
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrderDetailServlet" style="margin-bottom: 0px;">
						<button type="submit" class="btn_modal" style="margin-right: 15px">
							<i class="nav-icon fas fa-edit" type="button"></i>
						</button>
						<input type="hidden" name="orderDetailID" value="${OrderDetailVO.orderDetailID}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrderDetailServlet" onClick="onDelete(${OrderDetailVO.orderDetailID})" style="margin-bottom: 0px;">
						<button type="submit" class="btn_modal_del"  style="margin-right:15px">
                        	<i class="fa-solid fa-trash-can" type="button"></i>
                      	</button>
						<input type="hidden" name="orderDetailID" value="${OrderDetailVO.orderDetailID}"> 
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
			</c:forEach>
		</table>
			<%@ include file="page2.file" %>
<!-- ------------------------------------------------------------------------------------------- -->
	</div>
  </div>
    <footer class="main-footer">
      <!-- To the right -->
      <div class="float-right d-none d-sm-inline">
        Anything you want
      </div>
      <!-- Default to the left -->
      <strong style="color: #869099;">Copyright &copy; 2022 &nbsp <a href="<%=request.getContextPath()%>/views/background_login/background.jsp">Adopets.io</a>.</strong> All rights reserved.
    </footer>
</div>

</body>
</html>