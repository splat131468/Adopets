<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

</head>
<body>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<ul>
		<li><a href='listAllOrderDetail.jsp'>List</a> all orderDetail <br> <br></li>
		<ul>
			<li>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/OrderDetailServlet">
					<b>��J�q����ӽs�� (�p1):</b> <input type="text" name="orderDetailID"> <input
						type="hidden" name="action" value="getOne_For_Display"> <input
						type="submit" value="�e�X">
				</FORM>
			</li>

			<jsp:useBean id="odrdtlSvc" scope="page" class="web.order.service.OrderDetailService" />
			<li>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrderDetailServlet">
					<b>��ܭq����ӽs��:</b> 
					<select size="1" name="orderDetailID">
						<c:forEach var="OrderDetailVO" items="${odrdtlSvc.all}">
							<option value="${OrderDetailVO.orderDetailID}">${OrderDetailVO.orderDetailID}
						</c:forEach>
					</select>
					 <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="�e�X">
				</FORM>
			</li>


			<h3>�q��޲z</h3>

			<ul>
				<li><a href='addOrderDetail.jsp'>Add</a> a new order</li>
			</ul>

		</ul>
</body>
</html>