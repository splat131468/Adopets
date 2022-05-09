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

	<%-- ���~��C --%>
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
			<h1>�q��޲z</h1>
		</div>
	</section>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">
						<ul>
							<li><a href='listAllOrders.jsp'>����</a> �q��j�M <br> <br></li>
						</ul>
					</h3>
					<h3 class="card-title">
						<ul>
							<li><a href='addOrders.jsp'>�s�W</a> �q��</li>
						</ul>
					</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">
						<ul>
							<li>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet">
									<b>��J�q��s�� (�p1):</b> <input type="text" name="orderID">
									<input type="hidden" name="action" value="getOne_For_Display">
									<input type="submit" value="�e�X">
								</FORM>
							</li>

							<jsp:useBean id="odrSvc" scope="page" class="web.order.service.OrdersService" />
							<li>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet">
									<b>��ܭq��s��:</b> 
									<select size="1" name="orderID">
										<c:forEach var="OrdersVO" items="${odrSvc.all}">
											<option value="${OrdersVO.orderID}">${OrdersVO.orderID}
										</c:forEach>
									</select> 
									<input type="hidden" name="action" value="getOne_For_Display">
									<input type="submit" value="�e�X">
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