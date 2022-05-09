<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.order.entity.*"%>

<%
OrderDetailVO orderDetailVO = (OrderDetailVO) request.getAttribute("orderDetailVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>訂單明細資料新增 - addOrderDetail.jsp</title>

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
				<h3>明細資料新增 - addOrderDetail.jsp</h3>
			</td>
			<td>
				<h4>
					<a
						href="<%=request.getContextPath()%>/views/OrderDetail.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

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

						<jsp:useBean id="odrSvc" scope="page" class="web.order.service.OrdersService" />
				<tr>
					<td>訂單編號:<font color=red><b>*</b></font></td>
					<td><select size="1" name="orderID">
						<c:forEach var="OrdersVO" items="${odrSvc.all}">
							<option value="${OrdersVO.orderID}" ${(param.orderID==OrdersVO.orderID)? 'selected':'' } >${OrdersVO.orderID}
						</c:forEach>
					</select></td>
				</tr>
			<tr>
				<td>規格編號:</td>
				<td><input type="text" name="skuID" size="45"
					value="<%=(orderDetailVO == null) ? "2" : orderDetailVO.getSkuID()%>" /></td>
			</tr>
				<%-- 		<jsp:useBean id="skuSvc" scope="page" class="com.sku.model.SkuService" /> --%>
			<!-- 	<tr> -->
			<!-- 		<td>會員編號:<font color=red><b>*</b></font></td> -->
			<!-- 		<td><select size="1" name="skuID"> -->
			<%-- 			<c:forEach var="skuVO" items="${skuSvc.all}"> --%>
			<%-- 				<option value="${skuVO.skuID}" ${(param.skuID==skuVO.skuID)? 'selected':'' } >${skuVO.skuID} --%>
			<%-- 			</c:forEach> --%>
			<!-- 		</select></td> -->
			<!-- 	</tr> -->
			<tr>
				<td>商品名稱:</td>
				<td><input type="TEXT" name="prodName" size="45"
					value="<%=(orderDetailVO == null) ? "玩具鼠" : orderDetailVO.getProdName()%>" /></td>
			</tr>
			<tr>
				<td>商品數量:</td>
				<td><input type="TEXT" name="prodNum" size="45"
					value="<%=(orderDetailVO == null) ? "30" : orderDetailVO.getProdNum()%>" /></td>
			</tr>
			<tr>
				<td>商品單價:</td>
				<td><input type="TEXT" name="prodPrice" size="45"
					value="<%=(orderDetailVO == null) ? "200" : orderDetailVO.getProdPrice()%>" /></td>
			</tr>



		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>

</script>
</html>