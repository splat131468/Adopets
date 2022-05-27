<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.admin.entity.AdminVO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="web.member.entity.*"%>
<%@ page import="web.member.service.impl.*"%>
<!DOCTYPE html>
<%

session.getAttribute("adminVO");
session.getAttribute("auth");
%>
<%
    MemberService memSvc = new MemberService();
    List<MemberVO> list = memSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Starter</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/summernote/summernote-bs4.min.css">

  <script src="https://kit.fontawesome.com/f944d9625b.js" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/css/btn.css">

  <!-- sweetalert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


  <!-- jQuery -->
  <script src="<%=request.getContextPath()%>/resources/background/plugins/jquery/jquery.min.js"></script>
  <!-- js要在jQuery之後才能引進 -->
  <script src="<%=request.getContextPath()%>/resources/background/js/btn.js"></script>

  <!-- Bootstrap 4 -->
  <script src="<%=request.getContextPath()%>/resources/background/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="<%=request.getContextPath()%>/resources/background/js/adminlte.min.js"></script>

</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">
  
 <%@ include file="/views/backgroundMember/pages/background.file" %>
  
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>會員管理</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/views/background_login/background.jsp">Home</a></li>
                <li class="breadcrumb-item active">會員管理</li>
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
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                  <div class="input-group-append">
                    <button type="submit" class="btn btn-default">
                      <i class="fas fa-search"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
              <table class="table table-hover text-nowrap">
                <thead>
                  <tr>
                    <th>會員編號</th>
                    <th>會員帳號</th>
                    <th>會員名稱</th>
                    <th>會員電話</th>
                    <th>註冊日期</th>
                  </tr>
                </thead>
                <tbody>
                
                <%@ include file="page1.file" %> 
					<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<tr>
							<td>${memberVO.memID}</td>
							<td>${memberVO.account}</td>
							<td>${memberVO.name}</td>
							<td>${memberVO.phone}</td>
							<td>${memberVO.createDate}</td>
						</tr>
					</c:forEach>
				</table>
				<%@ include file="page2.file" %>
<!--                   <tr> -->
<!--                     <td>183</td> -->
<!--                     <td>yoyo@gmail.com</td> -->
<!--                     <td>ohohoh</td> -->
<!--                     <td>0987987467</td> -->
<!--                     <td>2014-11-09</td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td>219</td> -->
<!--                     <td>Alexander Pierce</td> -->
<!--                     <td>女</td> -->
<!--                     <td>0987987467</td> -->
<!--                     <td>yoyo@gmail.com</td> -->
<!--                     <td>2014-11-09</td> -->
<!--                     <td><span class="tag tag-warning">Pending</span></td> -->

<!--                     <td> -->
<!--                       <button type="button" class="btn_modal" style="margin-right:15px"> -->
<!--                         <i class="nav-icon fas fa-edit" type="button"></i> -->
<!--                       </button> -->

<!--                       <button type="button" class="btn_modal_del" style="margin-right:15px"> -->
<!--                         <i class="fa-solid fa-trash-can" type="button"></i> -->
<!--                       </button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td>657</td> -->
<!--                     <td>Bob Doe</td> -->
<!--                     <td>女</td> -->
<!--                     <td>0987987467</td> -->
<!--                     <td>yoyo@gmail.com</td> -->
<!--                     <td>2014-11-09</td> -->
<!--                     <td><span class="tag tag-primary">Approved</span></td> -->

<!--                     <td> -->
<!--                       <button type="button" class="btn_modal" style="margin-right:15px"> -->
<!--                         <i class="nav-icon fas fa-edit" type="button"></i> -->
<!--                       </button> -->

<!--                       <button type="button" class="btn_modal_del" style="margin-right:15px"> -->
<!--                         <i class="fa-solid fa-trash-can" type="button"></i> -->
<!--                       </button> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td>175</td> -->
<!--                     <td>Mike Doe</td> -->
<!--                     <td>男</td> -->
<!--                     <td>0987987467</td> -->
<!--                     <td>yoyo@gmail.com</td> -->
<!--                     <td>2014-11-09</td> -->
<!--                     <td><span class="tag tag-danger">Denied</span></td> -->
<!--                     <td> -->
<!--                       <button type="button" class="btn_modal" style="margin-right:15px"> -->
<!--                         <i class="nav-icon fas fa-edit" type="button"></i> -->
<!--                       </button> -->

<!--                       <button type="button" class="btn_modal_del" style="margin-right:15px"> -->
<!--                         <i class="fa-solid fa-trash-can" type="button"></i> -->
<!--                       </button> -->
<!--                     </td> -->
<!--                   </tr> -->
                </tbody>
              </table>

            </div>

            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>





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
  </div>

  </div>

</body>

</html>