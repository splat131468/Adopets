<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.donate.entity.*"%>
<%@ page import="web.donate.service.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	DonateService donSvc = new DonateService();
	List<DonateVO> list = donSvc.getAll();
	pageContext.setAttribute("list", list);
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

   
 <%@ include file="/views/admin/pages/donate.file" %> 

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>捐款管理</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/views/background_login/background.jsp">Home</a></li>
                <li class="breadcrumb-item active">捐款管理</li>
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
              	<form METHOD="post" class="bd-example" action="<%=request.getContextPath() %>/DonateEditServlet">
	                <div class="input-group input-group-sm" style="width: 150px;">
	                    <input type="text" name="donateID" class="form-control float-right" placeholder="Search DonateID">
	                  <div class="input-group-append">
	                    <button type="submit" class="btn btn-default">
	                      <i class="fas fa-search"></i>
	                    </button>
	                     <input type="hidden" name="action" value="getOne_Donate">
	                   </div>
	                </div>
                 </form>
              </div>
            </div>
            
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
              <table class="table table-hover text-nowrap">
                <thead>
                  <tr>
                    <th>捐款序號</th>
                    <th>會員ID</th>
                    <th>會員姓名</th>
                    <th>領養貓咪ID</th>
                    <th>被捐款方</th>
                    <th>捐款金額</th>
                    <th>付款狀態</th>
                    <th>捐款時間</th>
                    <th>操作</th>
                  </tr>
                </thead>
                <tbody>
                <%@ include file="pages/page1.file" %> 
				  <c:forEach var="donVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                  <tr>
                    <td>${donVO.donateID}</td>
                    <td>${donVO.memID}</td>
                    <td>${donVO.donateName}</td>
                    <td>${donVO.catID}</td>
                    <td>${donVO.shelterName}</td>
                    <td>${donVO.donateAmo}</td>
                    <td><c:choose>
							<c:when test="${donVO.donateStatus==0}">   
				           	  處理中
				            </c:when>
				            <c:when test="${donVO.donateStatus==2}">
				              失敗
				            </c:when>
				        	<c:otherwise>
				              成功
				            </c:otherwise>
				        </c:choose>
					</td>
                    <td><fmt:formatDate value="${donVO.donateDate}" pattern='yyyy-MM-dd HH:mm'/></td>
                    <td>
                    <FORM METHOD="post" style="float: left;" ACTION="<%=request.getContextPath()%>/DonateEditServlet">
                       	 <button type="submit" class="btn btn-danger">查看</button>
	                     <input type="hidden" name="donateID"  value="${donVO.donateID}">
				         <input type="hidden" name="action"	value="getOne_For_Donate">	
                    </FORM>
                    </td>
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