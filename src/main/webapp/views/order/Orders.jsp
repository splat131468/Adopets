<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>
<%@ page import="web.order.service.*"%>
<html>
<head>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/orders/css/adminlte.min.css">

<script src="https://kit.fontawesome.com/f944d9625b.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/orders/css/btn.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="<%=request.getContextPath()%>/resources/orders/js/adminlte.min.js"></script>

</head>
<body>

	<%-- 錯誤表列 --%>
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
			<h1>訂單管理</h1>
		</div>
	</section>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">
						<ul>
							<li><a href='listAllOrders.jsp'>全部</a> 訂單搜尋 <br> <br></li>
						</ul>
					</h3>
					<h3 class="card-title">
						<ul>
							<li><a href='addOrders.jsp'>新增</a> 訂單</li>
						</ul>
					</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">
						<ul>
							<li>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet">
									<b>輸入訂單編號 (如1):</b> <input type="text" name="orderID">
									<input type="hidden" name="action" value="getOne_For_Display">
									<input type="submit" value="送出">
								</FORM>
							</li>

							<jsp:useBean id="odrSvc" scope="page" class="web.order.service.OrdersService" />
							<li>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet">
									<b>選擇訂單編號:</b> 
									<select size="1" name="orderID">
										<c:forEach var="OrdersVO" items="${odrSvc.all}">
											<option value="${OrdersVO.orderID}">${OrdersVO.orderID}
										</c:forEach>
									</select> 
									<input type="hidden" name="action" value="getOne_For_Display">
									<input type="submit" value="送出">
								</FORM>
							</li>
						</ul>
					</table>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
	</div>
	
</body>
</html>