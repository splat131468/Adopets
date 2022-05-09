<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="web.order.entity.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
OrderDetailVO orderDetailVO = (OrderDetailVO) request.getAttribute("orderDetailVO");
%>

<html>
<head>
<title>員工資料 - listOneOrderDetail.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>訂單明細資料 - ListOneOrderDetail.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/views/order/OrderDetail.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>訂單明細編號</th>
		<th>訂單編號</th>
		<th>規格編號</th>
		<th>商品名稱</th>
		<th>商品數量</th>
		<th>商品單價</th>
	</tr>
	<tr>
		<td><%=orderDetailVO.getOrderDetailID()%></td>
		<td><%=orderDetailVO.getOrderID()%></td>
		<td><%=orderDetailVO.getSkuID()%></td>
		<td><%=orderDetailVO.getProdName()%></td>
		<td><%=orderDetailVO.getProdNum()%></td>
		<td><%=orderDetailVO.getProdPrice()%></td>
	</tr>
</table>

</body>
</html>