<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>

<%
OrdersVO ordersVO = (OrdersVO) request.getAttribute("ordersVO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�q���Ʒs�W - addOrders.jsp</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/orders/css/adminlte.min.css">

<script src="https://kit.fontawesome.com/f944d9625b.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/orders/css/btn.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
			<h1>�s�W�q��</h1>
		</div>
	</section>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
				<h3 class="card-title">
					<ul>
						<li><a href='<%=request.getContextPath()%>/views/orders/Orders.jsp'>��^</a>�q��޲z</li>
					</ul>
					</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">

						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" name="form1">
							<table>
								<%-- 		<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService" /> --%>
								<!-- 	<tr> -->
								<!-- 		<td>�|���s��:<font color=red><b>*</b></font></td> -->
								<!-- 		<td><select size="1" name="memID"> -->
								<%-- 			<c:forEach var="MemberVO" items="${memSvc.all}"> --%>
								<%-- 				<option value="${MemberVO.memID}" ${(param.memID==MemberVO.memID)? 'selected':'' } >${MemberVO.name} --%>
								<%-- 			</c:forEach> --%>
								<!-- 		</select></td> -->
								<!-- 	</tr> -->
								<tr>
									<td>�|���s��:</td>
									<td><input type="TEXT" name="memID" size="45"
										value="<%=(ordersVO == null) ? "5" : ordersVO.getMemID()%>" /></td>
								</tr>
								<tr>
									<td>�q�����:</td>
									<td><input type="TEXT" name="orderPrice" size="45"
										value="<%=(ordersVO == null) ? "100" : ordersVO.getOrderPrice()%>" />
									</td>
								</tr>
								<tr>
									<td>�q�檬�A:</td>
									<td>
									<select size="1" name="orderStatus">
											<option value=1>�w�X�f
											<option value=0>���X�f
									</select>
									</td>
								</tr>
								<tr>
									<td>��I�覡:</td>
									<td>
									<select size="1" name="paymentType">
											<option value=1>�H�Υd
											<option value=0>�{��
									</select>
									</td>
								</tr>
								<tr>
									<td>�H�e�a�}:</td>
									<td><input type="TEXT" name="address" size="45"
										value="<%=(ordersVO == null) ? "�򶩥��n�a���@�q89��" : ordersVO.getAddress()%>" />
									</td>
								</tr>
							</table>
							 <input type="hidden" name="action" value="insert">
							<input type="submit" value="�e�X�s�W">
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