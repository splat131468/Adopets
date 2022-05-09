<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>

<%
OrderDetailVO orderDetailVO = (OrderDetailVO) request.getAttribute("orderDetailVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�q����Ӹ�Ʒs�W - addOrderDetail.jsp</title>

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
				<h3>���Ӹ�Ʒs�W - addOrderDetail.jsp</h3>
			</td>
			<td>
				<h4>
					<a
						href="<%=request.getContextPath()%>/views/OrderDetail.jsp">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>��Ʒs�W:</h3>

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

						<jsp:useBean id="odrSvc" scope="page" class="web.order.service.OrdersService" />
				<tr>
					<td>�q��s��:<font color=red><b>*</b></font></td>
					<td><select size="1" name="orderID">
						<c:forEach var="OrdersVO" items="${odrSvc.all}">
							<option value="${OrdersVO.orderID}" ${(param.orderID==OrdersVO.orderID)? 'selected':'' } >${OrdersVO.orderID}
						</c:forEach>
					</select></td>
				</tr>
			<tr>
				<td>�W��s��:</td>
				<td><input type="text" name="skuID" size="45"
					value="<%=(orderDetailVO == null) ? "2" : orderDetailVO.getSkuID()%>" /></td>
			</tr>
				<%-- 		<jsp:useBean id="skuSvc" scope="page" class="com.sku.model.SkuService" /> --%>
			<!-- 	<tr> -->
			<!-- 		<td>�|���s��:<font color=red><b>*</b></font></td> -->
			<!-- 		<td><select size="1" name="skuID"> -->
			<%-- 			<c:forEach var="skuVO" items="${skuSvc.all}"> --%>
			<%-- 				<option value="${skuVO.skuID}" ${(param.skuID==skuVO.skuID)? 'selected':'' } >${skuVO.skuID} --%>
			<%-- 			</c:forEach> --%>
			<!-- 		</select></td> -->
			<!-- 	</tr> -->
			<tr>
				<td>�ӫ~�W��:</td>
				<td><input type="TEXT" name="prodName" size="45"
					value="<%=(orderDetailVO == null) ? "���㹫" : orderDetailVO.getProdName()%>" /></td>
			</tr>
			<tr>
				<td>�ӫ~�ƶq:</td>
				<td><input type="TEXT" name="prodNum" size="45"
					value="<%=(orderDetailVO == null) ? "30" : orderDetailVO.getProdNum()%>" /></td>
			</tr>
			<tr>
				<td>�ӫ~���:</td>
				<td><input type="TEXT" name="prodPrice" size="45"
					value="<%=(orderDetailVO == null) ? "200" : orderDetailVO.getProdPrice()%>" /></td>
			</tr>



		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="�e�X�s�W">
	</FORM>
</body>

</script>
</html>