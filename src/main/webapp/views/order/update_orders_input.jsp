<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>

<%
OrdersVO ordersVO = (OrdersVO) request.getAttribute("ordersVO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�q���ƭק� - update_orders_input.jsp</title>


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
<!-- js�n�bjQuery����~��޶i -->
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
<body>
<div class="wrapper">
 <%@ include file="/views/order/pages/background.file" %>

<!-- ------------------------------------------------------------------------------------- -->
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<!-- ------------------------------------------------------------------------------------- -->
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<h1>�ק�q��</h1>
		</div>
	</section>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">
						<ul>
							<li><a href='<%=request.getContextPath()%>/views/order/Orders.jsp'>��^</a>�q��޲z</li>
						</ul>
					</h3>
					<h3 class="card-title">
						<ul>
							<li><a href='<%=request.getContextPath()%>/views/order/listAllOrders.jsp'>��^</a>�Ҧ��q��</li>
						</ul>
					</h3>
				</div>
<!-- ------------------------------------------------------------------------------------- -->
	<div class="overlay-edit" style="border: 1px solid white;">
           <article class="article-user" style="margin-left: 35px;">
                <fieldset>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" name="form1">
							<table>
								<tr>
									<td>�q��s��:<font color=red><b>*</b></font></td>
									<td><%=ordersVO.getOrderID()%></td>
								</tr>
								<tr>
									<td>�|���s��:<font color=red><b>*</b></font></td>
									<td><%=ordersVO.getMemID()%></td>

								</tr>
								<tr>
									<td>�إ߮ɶ�:<font color=red><b>*</b></font></td>
									<td><%=ordersVO.getCreateTime()%></td>
								</tr>
								<tr>
									<td>�q�����:</td>
									<td><input type="TEXT" name="orderPrice" size="45"
										value="<%=ordersVO.getOrderPrice()%>" />
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
										value="<%=ordersVO.getAddress()%>" />
									</td>
								</tr>
							</table>
								<input type="hidden" name="action" value="update">
								<input type="hidden" name="orderID"value="<%=ordersVO.getOrderID()%>">
								<input type="hidden" name="memID" value="<%=ordersVO.getMemID()%>">
								<input type="hidden" name="createTime" value="<%=ordersVO.getCreateTime()%>"> 
								<input type="submit" value="�e�X�ק�">
						</FORM>
		    		</fieldset>
                 </article>
               </div>
			</div>
<!-- ------------------------------------------------------------------------------------- -->
		</div>
	 </div>
  </div>
</div>

</body>
</html>