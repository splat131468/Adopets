<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.catInfo.entity.*"%>

<%
  CatInfoVO catInfoVO = (CatInfoVO) request.getAttribute("catInfoVO");
%>

<html>
<head>
<title>貓咪資料 - listOneCat.jsp</title>

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


<table id="table-1">
	<tr><td>
		 <h3>貓咪資料 - ListOneCat.jsp</h3>
		 <h4><a href="${pageContext.request.contextPath}/views/catInfo/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>
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
	</tr>
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
	</tr>
</table>

</body>
</html>