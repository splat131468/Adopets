<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.admin.entity.*"%>


<%
AdminVO admVO = (AdminVO) request.getAttribute("admVO");
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
<!-- js??????jQuery?????????????????? -->
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
		              <h1>???????????????</h1>
		
		            </div>
		            <div class="col-sm-6">
		              <ol class="breadcrumb float-sm-right">
		                <li class="breadcrumb-item"><a href="#">????????????</a></li>
		                <li class="breadcrumb-item active">???????????????</li>
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
			                <form METHOD="post" class="bd-example" action="<%=request.getContextPath() %>/AdminServlet">
			                  <div class="input-group input-group-sm" style="width: 150px;">
			                    <input type="text" name="adminID" class="form-control float-right" placeholder="Search">
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
	        	
		
		            <!-- /.card-header -->
		            <div class="card-body table-responsive p-0">
		              <table class="table table-hover text-nowrap">
		                <thead>
		                  <tr>
		                    <th style="width: 200px;">???????????????</th>
		                    <th style="width: 230px;">?????????</th>
		                    <th style="width: 300px;">???????????????</th>
		                    <th style="width: 325px;">??????</th>
		                    <th>??????</th>
		                  </tr>
		                </thead>

						<tbody>
							
								
								<tr>
									<td><%=admVO.getAdminID()%></td>
									<td><%=admVO.getName()%></td>
									<td><%=admVO.getAccount()%></td>
									<td>
										<div class="py-3 d-flex justify-content-center">
											<div class="switch-div">
												?????? <label class="switch"> 
												<!-- ??????0?????? --> 
												<c:choose>
   													<c:when test="<%=admVO.isAccStatus()%>">    ??????
   														<input type="checkbox" disabled="true">
													</c:when>
													<c:otherwise>  ??????
													   <input type="checkbox" checked disabled="true">
													</c:otherwise>
												</c:choose>
													<span class="slider"></span>
												</label> ??????
											</div>
										</div>
									</td>
									<td>
										<button type="button" class="btn_modal" style="margin-right:15px" id="btn_modal" onclick="onEditButtonClick(${admVO.adminID})">
                    							<i class="nav-icon fas fa-edit" type="button"></i>
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
	<!-- /.content -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
      <div class="p-3">
        <h5>Title</h5>
        <p>Sidebar content</p>
      </div>
    </aside>


    <footer class="main-footer">
      <!-- To the right -->
      <div class="float-right d-none d-sm-inline">
        Anything you want
      </div>
      <!-- Default to the left -->
      <strong>Copyright &copy; 2022 &nbsp <a href="<%=request.getContextPath()%>/views/background_login/background.jsp">Adopets.io</a>.</strong> All rights reserved.
    </footer>
</div>

	<div class="overlay1" style="border: 1px solid white;">
		<article class="article-user">
			<form METHOD="post" class="bd-example" enctype="multipart/form-data" action="<%=request.getContextPath() %>/AdminServlet">
		
				<fieldset>
					<legend>???????????????</legend>
				    
					<p>
						<label for="email">??????:</label> 
						<label id="email"></label>
					</p>

					<p>
						<label for="password">??????:</label> 
						<input type="current-password" id="password" name="password" value="" 
						required="required" onblur="validate_password(this.value)">
					</p>

					<label for="pwd" generated="true" class="error" id="error" ></label>
					

					<p>
						<label for="input">????????????:</label> 
						<input type="text" id="name" name="name" value="" onblur="validate_name(this.value)" required="required">
					</p>

					<label for="pwd" generated="true" class="error" id="error1"></label>
					

					<p>
						<label for="file">???????????????:</label> 
						<input type="file" id="personImg" name="personImg" value=""  multiple="multiple" required="required">
					</p>

				
					

					<p style="margin-top: 40px;">
						<button type="submit" class="btn_sub">????????????</button>
						<button type="button" class="btn_modal_close">??????</button>
					</p>



				</fieldset>
				<input type="hidden" name="action" value="update_EMP"/>
				<input type="hidden" id="adminIDHidden" name="adminID" value="" />
				<input type="hidden" id="account" name="account" value="" />
			</form>
			</article>

	       </div>
  		


</body>


<script>
function onEditButtonClick(adminID) {
	if (adminID != null) {
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/AdminServlet",
			data : {
				"action": "getOne_For_Display",
				"adminID": adminID,
			},
			cache : false,
			dataType : "json",
			success : function(data) {
				$('#email').html(data.account);
				$('#password').attr('value',data.password);
				$('#name').attr('value',data.name);
				$('#personImg').attr('value',data.personImg);
				$('#adminIDHidden').attr('value',data.adminID);
				$('#account').attr('value',data.account);
				
			},
			error : onError
		});
	}
}

function onError(xhr, ajaxOptions, thrownError) {
	alert("?????????????????????????????????");
}




</script>
</html>