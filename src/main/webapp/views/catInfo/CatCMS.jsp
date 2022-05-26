<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.catInfo.service.*"%>
<%@ page import="web.catInfo.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%

CatInfoService catInfoService = new CatInfoService();
List<CatInfoVO> list = catInfoService.getAll();
pageContext.setAttribute("list",list);
	
%>




<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Adopets</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/plugins/summernote/summernote-bs4.min.css">

<!-- sweetalert2 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/css/system.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/css/btn.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="https://kit.fontawesome.com/f944d9625b.js"></script>

<script
src="<%=request.getContextPath()%>/resources/background/js/btn.js"></script>
<!-- js要在jQuery之後才能引進 -->
<script
src="<%=request.getContextPath()%>/resources/background/js/system.js"></script>
	
<!-- Bootstrap 4 -->
 <script src="<%=request.getContextPath()%>/resources/background/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/background/js/adminlte.min.js"></script>



</head>
<body class="hold-transition sidebar-mini">
  <div class="wrapper">
  <%@ include file="/views/catInfo/pages/background.file" %>
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>貓咪管理</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/views/background_login/background.jsp">Home</a></li>
                <li class="breadcrumb-item active">貓咪管理</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>


      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title"></h3>

              <div class="card-tools">
              	<form METHOD="post" class="bd-example" action="<%=request.getContextPath() %>/CatInfoServletCMS">
	                <div class="input-group input-group-sm" style="width: 150px;">
	                    <input type="text" name="catID" class="form-control float-right" placeholder="Search CatID">
	                  <div class="input-group-append">
	                    <button type="submit" class="btn btn-default">
	                      <i class="fas fa-search"></i>
	                    </button>
	                     <input type="hidden" name="action" value="getOne_For_Display">
	                   </div>
	                </div>
                 </form>
              </div>
            <a href='${pageContext.request.contextPath}/views/catInfo/addCatCMS.jsp'>新增貓咪</a>
            </div>
            
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
              <table class="table table-hover text-nowrap">
                <thead>
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
		<!-- 			<th>delete</th> -->
                  </tr>
                </thead>
                <tbody>
                <%@ include file="pages/page1.file" %> 
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
			  <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/CatInfoServletCMS" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="catID"  value="${catInfoVO.catID}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
		     </FORM>
			</td>
<%-- 			<td>
			  <FORM METHOD="post" ACTION="catInfo" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="catID"  value="${catInfoVO.catID}">
			     <input type="hidden" name="action" value="delete">
			     </FORM>
			</td> --%>
		</tr>
	</c:forEach>
				 
                </tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <%@ include file="pages/page2.file" %>
          <!-- /.card -->
          
        </div>
      </div>
      <!-- /.content -->
    </div>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
      <div class="p-3">
        <h5>Title</h5>
        <p>Sidebar content</p>
      </div>
    </aside>


    <!-- Main Footer -->
    <footer class="main-footer">
      <!-- To the right -->
      <div class="float-right d-none d-sm-inline">
        Anything you want
      </div>
      <!-- Default to the left -->
      <strong>Copyright &copy; 2022 &nbsp <a href="<%=request.getContextPath()%>/views/background_login/background.jsp">Adopets.io</a>.</strong> All rights reserved.
    </footer>
    <!-- /.content-wrapper -->
  </div>

</body>

</html>