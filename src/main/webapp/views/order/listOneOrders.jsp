<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="web.order.entity.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
OrdersVO ordersVO = (OrdersVO) request.getAttribute("ordersVO"); 
%>

<html>
<head>

<title>�q���� - listOneOrders.jsp</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/orders/css/adminlte.min.css">

<script src="https://kit.fontawesome.com/f944d9625b.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/orders/css/btn.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="<%=request.getContextPath()%>/resources/orders/js/adminlte.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/orders/plugins/jquery/jquery.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/orders/js/btn.js"></script>

</head>
<body>

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
							<li><a href='<%=request.getContextPath()%>/views/order/listAllOrders.jsp'>����</a>�q��j�M</li>
					</h3>
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
				<!-- /.card-header -->
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
			<!-- /.card -->
		</div>
	</div>
	
</body>
</html>