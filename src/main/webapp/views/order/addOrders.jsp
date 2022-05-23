<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>
<%@ page import="web.member.service.impl.*"%>
<%
OrdersVO ordersVO = (OrdersVO) request.getAttribute("ordersVO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>訂單資料新增 - addOrders.jsp</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/orders/css/adminlte.min.css">

<script src="https://kit.fontawesome.com/f944d9625b.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/orders/css/btn.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
			<h1>新增訂單</h1>
		</div>
	</section>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
				<h3 class="card-title">
					<ul>
						<li><a href='<%=request.getContextPath()%>/views/orders/Orders.jsp'>返回</a>訂單管理</li>
					</ul>
					</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">

						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" name="form1">
							<table>
										<jsp:useBean id="memSvc" scope="page" class="web.member.service.impl.MemberService" />
									<tr>
										<td>會員編號:<font color=red><b>*</b></font></td>
										<td><select size="1" name="memID">
											<c:forEach var="MemberVO" items="${memSvc.all}">
												<option value="${MemberVO.memID}" ${(param.memID==MemberVO.memID)? 'selected':'' } >${MemberVO.name}
											</c:forEach>
										</select></td>
									</tr>
<!-- 								<tr> -->
<!-- 									<td>會員編號:</td> -->
<!-- 									<td><input type="TEXT" name="memID" size="45" -->
<%-- 										value="<%=(ordersVO == null) ? "5" : ordersVO.getMemID()%>" /></td> --%>
<!-- 								</tr> -->
								<tr>
									<td>訂單價格:</td>
									<td><input type="TEXT" name="orderPrice" size="45"
										value="<%=(ordersVO == null) ? "100" : ordersVO.getOrderPrice()%>" />
									</td>
								</tr>
								<tr>
									<td>訂單狀態:</td>
									<td>
									<select size="1" name="orderStatus">
											<option value=1>已出貨
											<option value=0>未出貨
									</select>
									</td>
								</tr>
								<tr>
									<td>支付方式:</td>
									<td>
									<select size="1" name="paymentType">
											<option value=1>信用卡
											<option value=0>現金
									</select>
									</td>
								</tr>
								<tr>
									<td>寄送地址:</td>
									<td><input type="TEXT" name="address" size="45"
										value="<%=(ordersVO == null) ? "基隆市南榮路一段89號" : ordersVO.getAddress()%>" />
									</td>
								</tr>
							</table>
							 <input type="hidden" name="action" value="insert">
							<input type="submit" value="送出新增">
						</FORM>
					</table>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
	</div>

</body>
</html>