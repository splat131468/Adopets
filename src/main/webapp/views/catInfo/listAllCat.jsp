<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.catInfo.service.*"%>
<%@ page import="web.catInfo.entity.*"%>

<%
	CatInfoService catInfoService = new CatInfoService();
    List<CatInfoVO> list = catInfoService.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>listAllCat.jsp</title>

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
	width: 100%;
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

<table id="table-1">
	<tr><td>
		 <h3>貓咪列表 (listAllCat.jsp)</h3>
		 <h4><a href="${pageContext.request.contextPath}/views/catInfo/select_page.jsp">回後台首頁</a></h4>
		 <h4><a href="${pageContext.request.contextPath}/views/catInfo/My_search.jsp">回Adopets search首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>Cat ID</th>
		<th>Member ID</th>
		<th>Shelter Name</th>
		<th>Cat Name</th>
		<th>Age</th>
		<th>Breed</th>
		<th>Size</th>
		<th>Sex</th>
		<th>Coat Color</th>
		<th>Eye Color</th>
		<th>Health</th>
		<th>Adopt Cost</th>
		<th>Create Date</th>
		<th>Have Vaccine</th>
		<th>Adopt</th>
		<th>modify</th>
		<th>delete</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="catInfoVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${catInfoVO.catID}</td>
 			<td>${catInfoVO.memID}</td>
			<td>${catInfoVO.shelterName}</td>
			<td>${catInfoVO.catName}</td>
			<td>${catInfoVO.age}</td>
			<td>${catInfoVO.breed}</td> 
			<td>${catInfoVO.size}</td>
			<td>${catInfoVO.sex}</td>
			<td>${catInfoVO.coatColor}</td>
			<td>${catInfoVO.eyeColor}</td>
			<td>${catInfoVO.health}</td>	
			<td>${catInfoVO.adoptCost}</td>
			<td>${catInfoVO.createDate}</td>
			<td>${catInfoVO.haveVaccine}</td>
			<td>${catInfoVO.adopt}</td>
			<td>
			  <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/CatInfoServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="catID"  value="${catInfoVO.catID}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
		     </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="catInfo" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="catID"  value="${catInfoVO.catID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>