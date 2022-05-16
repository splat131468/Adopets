<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="web.order.entity.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
OrdersVO ordersVO = (OrdersVO) request.getAttribute("ordersVO"); 
%>

<html>
<head>

<title>訂單資料 - listOneOrders.jsp</title>
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
			<h1>訂單管理</h1>
		</div>
	</section>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">
						<ul>
							<li><a href='<%=request.getContextPath()%>/views/order/listAllOrders.jsp'>全部</a>訂單搜尋</li>
					</h3>
					<h3 class="card-title">
						<ul>
							<li><a href='<%=request.getContextPath()%>/views/order/addOrders.jsp'>新增</a>訂單</li>
						</ul>
					</h3>
					<h3 class="card-title">
						<ul>
							<li><a href='<%=request.getContextPath()%>/views/order/Orders.jsp'>返回</a>訂單管理</li>
						</ul>
					</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">
						<thead>
							<tr>
								<th>訂單編號</th>
								<th>會員編號</th>
								<th>建立時間</th>
								<th>訂單價格</th>
								<th>訂單狀態</th>
								<th>支付方式</th>
								<th>寄送地址</th>
								<th>修改</th>
								<th>刪除</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=ordersVO.getOrderID()%></td>
								<td><%=ordersVO.getMemID()%></td>
								<td><%=ordersVO.getCreateTime()%></td>
								<td><%=ordersVO.getOrderPrice()%></td>
								<td><%=ordersVO.getOrderStatus() == 1 ? "信用卡" : "現金"%></td>
								<td><%=ordersVO.getPaymentType() == 1 ? "已出貨" : "未出貨"%></td>
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