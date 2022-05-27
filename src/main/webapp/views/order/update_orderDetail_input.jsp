<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>

<%
OrderDetailVO orderDetailVO = (OrderDetailVO) request.getAttribute("orderDetailVO"); 

%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>訂單資料修改 - update_orderDetail_input.jsp</title>
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
<style>
tr,td {
  height: 50px;
  padding: 5px 0px;
}
</style>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <%@ include file="/views/order/pages/background.file" %>
<!-- --------------------------------------------------------------------------------------- -->


	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
<!-- --------------------------------------------------------------------------------------- -->
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<h1>修改訂單</h1>
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
<!-- --------------------------------------------------------------------------------------- -->
<div class="overlay-edit" style="border: 1px solid white;">
	<article class="article-user" style="margin-left: 35px;">
    	<fieldset>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/OrderDetailServlet" name="form1">
				<table>
					<tr>
						<td>明細編號:<font color=red><b>*</b></font></td>
						<td><%=orderDetailVO.getOrderDetailID()%></td>
					</tr>
					<tr>
						<td>訂單編號:<font color=red><b>*</b></font></td>
						<td><%=orderDetailVO.getOrderID()%></td>
						
					</tr>
					<tr>
						<td>規格編號:<font color=red><b>*</b></font></td>
						<td><%=orderDetailVO.getSkuID()%></td>
					</tr>
					<tr>
						<td>商品名稱:</td>
						<td><input type="TEXT" name="prodName" size="45"
							value="<%=orderDetailVO.getProdName()%>" /></td>
					</tr>
					<tr>
						<td>商品數量:</td>
						<td><input type="TEXT" name="prodNum" size="45"
							value="<%=orderDetailVO.getProdNum()%>" /></td>
					</tr>
					<tr>
						<td>商品單價:</td>
						<td><input type="TEXT" name="prodPrice" size="45"
							value="<%=orderDetailVO.getProdPrice()%>" /></td>	
					</tr>
				
				</table>
				<br> <input type="hidden" name="action" value="update"> 
				<input type="hidden" name="orderDetailID" value="<%=orderDetailVO.getOrderDetailID()%>">
				<input type="hidden" name="orderID" value="<%=orderDetailVO.getOrderID() %>">
				<input type="hidden" name="skuID" value="<%=orderDetailVO.getSkuID() %>">
				<input type="submit" value="送出修改">
			</FORM>
	      </fieldset>
        </article>
       </div>
	</div>
<!-- ------------------------------------------------------------------------------------- -->
  </div>
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