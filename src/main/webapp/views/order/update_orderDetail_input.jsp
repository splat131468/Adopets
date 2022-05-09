<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>

<%
OrderDetailVO orderDetailVO = (OrderDetailVO) request.getAttribute("orderDetailVO"); 

%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�q���ƭק� - update_orderDetail_input.jsp</title>

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
				<h3>�q����Ӹ�ƭק� - update_orderDetail_input.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/views/order/OrderDetail.jsp">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>��ƭק�:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
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
				<td>���ӽs��:<font color=red><b>*</b></font></td>
				<td><%=orderDetailVO.getOrderDetailID()%></td>
			</tr>
			<tr>
				<td>�q��s��:<font color=red><b>*</b></font></td>
				<td><%=orderDetailVO.getOrderID()%></td>
				
			</tr>
			<tr>
				<td>�W��s��:<font color=red><b>*</b></font></td>
				<td><%=orderDetailVO.getSkuID()%></td>
			</tr>
			<tr>
				<td>�ӫ~�W��:</td>
				<td><input type="TEXT" name="prodName" size="45"
					value="<%=orderDetailVO.getProdName()%>" /></td>
			</tr>
			<tr>
				<td>�ӫ~�ƶq:</td>
				<td><input type="TEXT" name="prodNum" size="45"
					value="<%=orderDetailVO.getProdNum()%>" /></td>
			</tr>
			<tr>
				<td>�ӫ~���:</td>
				<td><input type="TEXT" name="prodPrice" size="45"
					value="<%=orderDetailVO.getProdPrice()%>" /></td>	
			</tr>
		



		</table>
		<br> <input type="hidden" name="action" value="update"> 
		<input type="hidden" name="orderDetailID" value="<%=orderDetailVO.getOrderDetailID()%>">
		<input type="hidden" name="orderID" value="<%=orderDetailVO.getOrderID() %>">
		<input type="hidden" name="skuID" value="<%=orderDetailVO.getSkuID() %>">
		<input type="submit" value="�e�X�ק�">
	</FORM>
</body>

</script>
</html>