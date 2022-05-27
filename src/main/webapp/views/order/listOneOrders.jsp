<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="web.order.entity.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
OrdersVO ordersVO = (OrdersVO) request.getAttribute("ordersVO"); 
%>

<html>
<head>

<title>�q���� - listOneOrders.jsp</title>
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

</head>
<body>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
 <%@ include file="/views/order/pages/background.file" %>
<!-- ----------------------------------------------------------------------------------- -->
<div class="content-wrapper">
<section class="content-header">
	<div class="container-fluid">
   		<h1>�浧�q��</h1>
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
	  			</div>
			</div>
		</div>
	</div>		
<!-- -------------------------------------------------------------------------------------- -->		
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">
						<thead>
							<tr>
								<th>�q��s��</th>
								<th>�|���s��</th>
								<th>�إ߮ɶ�</th>
								<th>�q�����</th>
								<th>�q�檬�A</th>
								<th>��I�覡</th>
								<th>�H�e�a�}</th>
								<th>�ק�</th>
								<th>�R��</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=ordersVO.getOrderID()%></td>
								<td><%=ordersVO.getMemID()%></td>
								<td><%=ordersVO.getCreateTime()%></td>
								<td><%=ordersVO.getOrderPrice()%></td>
								<td><%=ordersVO.getOrderStatus() == 1 ? "�H�Υd" : "�{��"%></td>
								<td><%=ordersVO.getPaymentType() == 1 ? "�w�X�f" : "���X�f"%></td>
								<td><%=ordersVO.getAddress()%></td>
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" style="margin-bottom: 0px;">
										<button type="submit" class="btn_modal" style="margin-right:15px">
                        					<i class="nav-icon fas fa-edit" type="button"></i>
                      					</button>
										<input type="hidden" name="orderID" value="<%=ordersVO.getOrderID()%>"> 
										<input type="hidden" name="action" value="getOne_For_Update">
									</FORM>
								</td>
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" id="delete" style="margin-bottom: 0px;">
										<button type="button" class="btn_modal_del" style="margin-right:15px">
                        					<i class="fa-solid fa-trash-can" type="button"></i>
                      					</button>
										<input type="hidden" name="orderID" value="<%=ordersVO.getOrderID()%>"> 
										<input type="hidden" name="action" value="delete">
									</FORM>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- /.card-body -->
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