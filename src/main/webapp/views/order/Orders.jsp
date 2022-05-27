<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>
<%@ page import="web.order.service.*"%>
<%@ page import="web.member.service.impl.*"%>
<%

session.getAttribute("adminVO");
session.getAttribute("auth");
%>


<%
OrdersVO ordersVO = (OrdersVO) request.getAttribute("ordersVO"); 
%>

<html>
<head>
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
<!----------------------- Content Header (Page header)-------------------------------------- -->
<div class="content-wrapper">
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
							<li><a href='listAllOrders.jsp'>全部</a> 訂單查詢 <br> <br></li>
						</ul>
					</h3>
					<h3 class="card-title">
						<ul>
							<li><a href='listAllOrderDetail.jsp'>全部</a> 明細查詢</li>
						</ul>
					</h3>
				</div>
				<div class="card">
					<div class="card-header">
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
					</div>
				</div>
<!-- -------------------------------新增訂單--------------------------------------------------- -->
		
				<!-- /.card-header -->
	 <div class="overlay-edit" style="border: 1px solid white;">
           <article class="article-user" style="margin-left: 35px;">
                <fieldset>

					<legend>新增訂單</legend>
				
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" name="form1">
						 
							<table >
										<jsp:useBean id="memSvc" scope="page" class="web.member.service.impl.MemberService"  />
									<tr>
										<td>會員編號:<font color=red><b>*</b></font></td>
										<td><select size="1" name="memID">
											<c:forEach var="MemberVO" items="${memSvc.all}">
												<option value="${MemberVO.memID}" ${(param.memID==MemberVO.memID)? 'selected':'' } >${MemberVO.name}
											</c:forEach>
										</select></td>
									</tr>
								
						
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
				    </fieldset>
                 </article>
              </div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
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