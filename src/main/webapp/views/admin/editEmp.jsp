<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.admin.entity.*"%>
<%@ page import="web.auth.entity.*"%>
<%@ page import="web.authconfigure.entity.*"%>


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
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/views/admin/systemAuth.jsp">權限管理</a></li>
                <li class="breadcrumb-item active">修改管理員</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>





      <div class="row">
        <div class="col-12">
          <div class="card">
            <!-- -----------------------------------------修改管理員----------------------------------------- -->
            <div class="overlay-edit" style="border: 1px solid white;">
              <article class="article-user" style="margin-left: 35px;">
                <fieldset>
					<FORM METHOD="post" style="float: left;" enctype="multipart/form-data" ACTION="<%=request.getContextPath()%>/AuthConfigureServlet">	
                 		 <legend>管理員資訊</legend>
                 
			                  <p style="margin-top: 10px;">
			                    <label for="email">帳號:</label>
			                    <input type="email" id="email" name="account" value="${admVO.account}" disabled="disabled">
			                    <input type="hidden" id="account" name="account" value="${admVO.account}" />
			                  </p>
			
			                  <p>
			                    <label for="password">密碼:</label>
			                    <input type="current-password" id="password" name="password" value="${admVO.password}" onblur="validate_password(this.value)">
			                  </p>
			                  
			                  <label for="pwd" generated="true" class="error" id="error"></label>
			
			                  <p>
			                    <label for="input">員工姓名:</label>
			                    <input type="text" id="name" name="name" value="${admVO.name}" onblur="validate_name(this.value)">
			                  </p>
			                  
			                  <label for="name" generated="true" class="error" id="error1"></label>
			
			                  <p>
			                   <label for="file">員工大頭貼:</label> 
								<input type="file" id="personImg" name="personImg" value="${admVO.personImg}"  multiple="multiple">
			                  </p>
			

		                  
			                  <div class="status-1">
			                    <label>狀態：</label><br>
			                    <input type="radio" name="accStatus" value="true" id="status1" ${(admVO.accStatus=='true')?'checked' : ''}>
			                    <label for="status1">啟用</label>
			                    <input type="radio" name="accStatus" value="false" id="status2" style="margin-left: 12px;" ${(admVO.accStatus=='false')?'checked' : ''}>
			                    <label for="status2">禁用</label>
			                  </div>
			                  
				           <jsp:useBean id="authSvc" scope="page" class="web.auth.service.AuthService" />
		
						   <jsp:useBean id="authConfigureSvc" scope="page" class="web.authconfigure.service.AuthConfigureService" />
					     
			     	    								

						
			            <div class="checkbox_sys" style="margin-top: 5px;">
		                    <label>權限設置:</label>
		                    <br>
		                    <input type="checkbox" id="allcheck" onclick="demo()"   }/>
		                    <label for="allcheck">全選</label>
		
		                    <br>

							
							
		                    <input id="chk_1" type="checkbox" name="choice" class="checknum" onclick="setAll()" value="1"  ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('1')!=-1 ?'checked':''} /><label
		                      for="chk_1">會員管理</label>
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <input id="chk_2" type="checkbox" name="choice" class="checknum" onclick="setAll()"  value="2" ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('2')!=-1 ?'checked':''} /><label
		                      for="chk_2">商品管理</label>
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <input id="chk_3" type="checkbox" name="choice" class="checknum" onclick="setAll()"  value="3" ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('3')!=-1 ?'checked':''} /><label
		                      for="chk_3">訂單管理</label>
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <input id="chk_4" type="checkbox" name="choice" class="checknum" onclick="setAll()"  value="4" ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('4')!=-1 ?'checked':''}/><label
		                      for="chk_4">貓咪管理</label>
		
		                    <br>
		
		                    <input id="chk_5" type="checkbox" name="choice" class="checknum" onclick="setAll()"  value="5" ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('5')!=-1 ?'checked':''}/><label
		                      for="chk_5">審核管理</label>
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <input id="chk_6" type="checkbox" name="choice" class="checknum" onclick="setAll()"  value="6" ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('6')!=-1 ?'checked':''}/><label
		                      for="chk_6">捐款管理</label>
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <input id="chk_7" type="checkbox" name="choice" class="checknum" onclick="setAll()"  value="7" ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('7')!=-1 ?'checked':''}><label
		                      for="chk_7">使用者管理</label>
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <input id="chk_8" type="checkbox" name="choice" class="checknum" onclick="setAll()"  value="8" ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('8')!=-1 ?'checked':''}><label
		                      for="chk_8">權限管理</label>

		                  </div>

			                  <p style="margin-top: 25px;">
			                    <button type="submit" class="btn_sub1" >送出修改</button>
			                    <button type="button" class="btn_modal_close" onclick="window.location='<%=request.getContextPath()%>/views/admin/systemAuth.jsp'">關閉</button>
			                  </p>
						
								<input type="hidden" name="action" value="Manager_Edit_Emp">
								<input type="hidden" name="adminID" value="${admVO.adminID}">
				   		</FORM>
				   		
                </fieldset>
              </article>
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
      <strong style="color: #869099;">Copyright &copy; 2022 &nbsp <a href="<%=request.getContextPath()%>/views/background_login/background.jsp">Adopets.io</a>.</strong> All rights reserved.
    </footer>
  </div>

</body>

<script>

</script>

</html>