<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>
<title>貓咪後台管理</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>ADOPETS</h3>
				<h4>(貓咪後台管理)</h4></td>
		</tr>
	</table>

	<h3>查詢貓咪:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='${pageContext.request.contextPath}/views/catInfo/listAllCat.jsp'>列出</a> 所有貓咪 <br> <br></li>
		<li>
			<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/CatInfoServlet">
				<b>輸入貓咪編號 :</b> 
				<input type="text" name="catID"> 
				<input type="hidden" name="action" value="getOne_For_Display"> 
				<input type="submit" value="送出">
			</FORM>
		</li>

<%-- 		<jsp:useBean id="empSvc" scope="page"
			class="web.catInfo.service.CatInfoService" /> --%>


	</ul>


	<h3>新增貓咪</h3>

	<ul>
		<li><a href='${pageContext.request.contextPath}/views/catInfo/addCat.jsp'>新增</a> 一筆貓咪</li>
	</ul>

</body>
</html>