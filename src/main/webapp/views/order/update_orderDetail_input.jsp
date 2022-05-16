<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>

<%
OrderDetailVO orderDetailVO = (OrderDetailVO) request.getAttribute("orderDetailVO"); 

%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>訂單資料修改 - update_orderDetail_input.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>訂單明細資料修改 - update_orderDetail_input.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/views/order/OrderDetail.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/OrderDetailServlet" name="form1">
		<table>
			<tr>
				<td>明細編號:<font color=red><b>*</b></font></td>
				<td><%=orderDetailVO.getOrderDetailID()%></td>
			</tr>
			<tr>
				<td>訂單編號:<font color=red><b>*</b></font></td>
				<td><%=orderDetailVO.getOrderID()%></td>
				
			</tr>
			<tr>
				<td>規格編號:<font color=red><b>*</b></font></td>
				<td><%=orderDetailVO.getSkuID()%></td>
			</tr>
			<tr>
				<td>商品名稱:</td>
				<td><input type="TEXT" name="prodName" size="45"
					value="<%=orderDetailVO.getProdName()%>" /></td>
			</tr>
			<tr>
				<td>商品數量:</td>
				<td><input type="TEXT" name="prodNum" size="45"
					value="<%=orderDetailVO.getProdNum()%>" /></td>
			</tr>
			<tr>
				<td>商品單價:</td>
				<td><input type="TEXT" name="prodPrice" size="45"
					value="<%=orderDetailVO.getProdPrice()%>" /></td>	
			</tr>
		



		</table>
		<br> <input type="hidden" name="action" value="update"> 
		<input type="hidden" name="orderDetailID" value="<%=orderDetailVO.getOrderDetailID()%>">
		<input type="hidden" name="orderID" value="<%=orderDetailVO.getOrderID() %>">
		<input type="hidden" name="skuID" value="<%=orderDetailVO.getSkuID() %>">
		<input type="submit" value="送出修改">
	</FORM>
</body>

</script>
</html>