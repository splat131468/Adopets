<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.admin.entity.*"%>
<%@ page import="web.auth.entity.*"%>
<%@ page import="web.authconfigure.entity.*"%>



<jsp:useBean id="authConfigureSvc" scope="page" class="web.authconfigure.service.AuthConfigureService" />

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

    <%@ include file="/views/admin/pages/editEmp.file" %> 







    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>權限管理</h1>

            </div>
            <div class="col-sm-6" style="height: 38x;">
              <ol class="breadcrumb float-sm-right">
                <div class="new_user">
                  <button type="button" style="width:100%" class="new_mam">
                  <a style="color: #fff;" href="<%=request.getContextPath()%>/views/admin/newEmp.jsp">
                  新增管理員</button>
                  
                  
                  
                </div>
                <li class="breadcrumb-item"><a href="#">系統管理</a></li>
                <li class="breadcrumb-item active">權限管理</li>
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
              	<form METHOD="post" class="bd-example" action="<%=request.getContextPath() %>/AuthConfigureServlet">
                	<div class="input-group input-group-sm" style="width: 150px;">
                   	   <input type="text" name="adminID" class="form-control float-right" placeholder="Search AdminID">
	                   	 <div class="input-group-append">
		                      <button type="submit" class="btn btn-default">
		                        <i class="fas fa-search"></i>
		                      </button>
		                      <input type="hidden" name="action" value="getOne_Admin"> 
	                     </div>
                     </div>
                </form>
              </div>
            </div>


            <!-- /.card-header ---------------------------------------------------------------------------------------------->
            <div class="card-body table-responsive p-0">
              <table class="table table-hover text-nowrap">
                <thead>
                  <tr>
                    <th>管理員編號</th>
                    <th>管理員</th>
                    <th>使用者帳號</th>
                    <th>權限資訊</th>
                    <th>狀態</th>
                    <th>操作</th>
                  </tr>
                </thead>
                <tbody>

			                  <tr>
								<td>${admVO.adminID}</td>
								<td>${admVO.name}</td>
								<td>${admVO.account}</td>
								<td><c:forEach var="authConfigureVO" items="${authConfigureSvc.getFindByManager(admVO.adminID)}">
				                    ${authConfigureVO.authName}
				                </c:forEach>
								</td>
								<td>
									<div class="py-3 d-flex justify-content-center">
										<div class="switch-div">
											啟用 <label class="switch"> 
											<!-- 大於0啟用 --> 
											<c:choose>
												<c:when test="${admVO.accStatus}">    如果
												<input type="checkbox" disabled="true">
												</c:when>
												<c:otherwise>  否则
												   <input type="checkbox" checked disabled="true">
												</c:otherwise>
											 </c:choose>
												<span class="slider"></span>
											</label> 禁用
										</div>
									</div>
								  </td>
				                    <td>
					                      <FORM METHOD="post" style="float: left;" ACTION="<%=request.getContextPath()%>/AuthConfigureServlet">	
					                      <button type="submit" class="btn_modal" style="margin-right:15px" id="btn_modal">
					 							<i class="nav-icon fas fa-edit" type="button"></i>
										  </button>
											   <input type="hidden" name="adminID"  value="${admVO.adminID}">
			  								   <input type="hidden" name="action"	value="getOne_For_Manager">		
										  </FORM>
									
   				                          <button type="button" class="btn_modal_del" style="margin-right:25px" onclick="onAdminSubmit(${admVO.adminID})">
					                        <i class="fa-solid fa-trash-can" type="button"></i>
					                      </button>
				                       
				                    
				                    </td>
								</tr>

						</tbody>
					</table>
				</div>
			</div>
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

	
  		


</body>

<script>


function onAdminSubmit(adminID) {  
	console.log(adminID);
	Swal.fire({
			    title: '確定要刪除嗎?',
			    text: "您將無法還原此內容！",
			    icon: 'warning',
			    showCancelButton: true,
			    confirmButtonColor: '#3085d6',
			    cancelButtonColor: '#d33',
			    cancelButtonText: '取消',
			    confirmButtonText: '是的， 刪除資料'
		     }).then(function(isConfirm) {  
			       if(isConfirm.value !=true) {  
			           return false;
			       } else {  
				       	Swal.fire(
		         		        '刪除成功!',
		         		        'Your Admin has been deleted.',
		         		        'success'
			 		    );
			      	 	$.ajax({
			                  url: "<%=request.getContextPath()%>/AuthServlet",
			                  data:{
			               	    "action": "delete",
			      					"adminID": adminID,
			                    	},
			                  type: "post",
			                  success:function (data) {
									<%-- window.location.href='<%=request.getContextPath()%>/views/admin/systemAuth.jsp'; --%>
									//document.location.reload();
									setTimeout(function(){window.location.reload();},2000);
			                  }
			              });
		             }
		       })   
} 
 



</script>



</html>