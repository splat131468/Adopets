<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.admin.entity.*"%>
<%@ page import="web.auth.entity.*"%>
<%@ page import="web.authconfigure.entity.*"%>

<%


AdminVO admVO = (AdminVO) request.getAttribute("admVO");
session.getAttribute("adminVO");
session.getAttribute("auth");
	
	
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

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<%=request.getContextPath()%>/views/background_login/background.jsp" class="nav-link">Home</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="#" class="nav-link">Contact</a>
        </li>
      </ul>

      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto">
        <!-- Navbar Search -->
        <li class="nav-item">
          <a class="nav-link" data-widget="navbar-search" href="#" role="button">
            <i class="fas fa-search"></i>
          </a>
          <div class="navbar-search-block">
            <form class="form-inline">
              <div class="input-group input-group-sm">
                <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                  <button class="btn btn-navbar" type="submit">
                    <i class="fas fa-search"></i>
                  </button>
                  <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
            </form>
          </div>
        </li>

        <!-- Messages Dropdown Menu -->
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="far fa-comments"></i>
            <span class="badge badge-danger navbar-badge">3</span>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    Brad Diesel
                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">Call me whenever you can...</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    John Pierce
                    <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">I got your message bro</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    Nora Silvester
                    <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">The subject goes here</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
          </div>
        </li>
        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="far fa-bell"></i>
            <span class="badge badge-warning navbar-badge">15</span>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <span class="dropdown-header">15 Notifications</span>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-envelope mr-2"></i> 4 new messages
              <span class="float-right text-muted text-sm">3 mins</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-users mr-2"></i> 8 friend requests
              <span class="float-right text-muted text-sm">12 hours</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-file mr-2"></i> 3 new reports
              <span class="float-right text-muted text-sm">2 days</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
          </div>
        </li>

        <li class="nav-item">
          <a class="nav-link" data-widget="fullscreen" href="#" role="button">
            <i class="fas fa-expand-arrows-alt"></i>
          </a>
        </li>

      <!-- 右上角管理員資訊 -->
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="fa-solid fa-circle-user"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
            <a href="<%=request.getContextPath()%>/views/admin/system.jsp" class="dropdown-item">
              <i class="fas fa-key mr-2" style="margin-left: 2.5px;"></i>修改密碼
            </a>
            <div class="dropdown-divider"></div>
            
            <a href="<%=request.getContextPath()%>/LogoutServlet" class="dropdown-item">
              <i class="fas fa-sign-out mr-2"></i>登出
            </a>
      
          </div>
        </li>
      </ul>
    </nav>
    <!-- /.navbar -->

   <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- 首頁 Logo -->
      <a href="starter.html" class="brand-link">
        <span class="brand-text font-weight-light"><img src="<%=request.getContextPath()%>/resources/background/img/Adopets.svg" width="55%"></span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <img src="${pageContext.request.contextPath}/UploadAdmImg?adminID=${adminVO.adminID}" class="img-circle elevation-2" alt="User Image">
          </div>
          <div class="info">
            <a href="#" class="d-block">${adminVO.name}</a>
          </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
          <div class="input-group" data-widget="sidebar-search">
            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
            <div class="input-group-append">
              <button class="btn btn-sidebar">
                <i class="fas fa-search fa-fw"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/views/backgroundMember/backgroundMember.jsp" class="nav-link">
                <i class="nav-icon fa-solid fa-user"></i>
                <p>會員管理</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="checked.html" class="nav-link">
                <i class="nav-icon fas fa-edit"></i>
                <p>審核管理</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="goods.html" class="nav-link">
                <i class="nav-icon fa-solid fa-store"></i>
                <p>商品管理</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/views/order/Orders.jsp" class="nav-link">
                <i class="nav-icon fa-solid fa-clipboard-list"></i>
                <p>訂單管理</p>
              </a>
            </li>

            <li class="nav-item">
       		    <a href="<%=request.getContextPath()%>/views/donate/donateBackground.jsp" class="nav-link">
                <i class="nav-icon fa-solid fa-sack-dollar"></i>
                <p>捐款管理</p>
              </a>
            </li>



            <li class="nav-item">
              <a href="#" class="nav-link active">
                <i class="nav-icon fa-solid fa-gear"></i>
                <p>
                  系統管理
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/views/admin/system.jsp" class="nav-link">
                    <i style="margin-left: 33px;"></i>
                    <p>使用者管理</p>
                  </a>
                </li>

                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/views/admin/systemAuth.jsp" class="nav-link">
                    <i style="margin-left: 33px;"></i>
                    <p>權限管理</p>
                  </a>
                </li>

              </ul>
            </li>

          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>







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
		                      for="chk_5">捐款管理</label>
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <input id="chk_6" type="checkbox" name="choice" class="checknum" onclick="setAll()"  value="6" ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('6')!=-1 ?'checked':''}/><label
		                      for="chk_6">使用者管理</label>
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <input id="chk_7" type="checkbox" name="choice" class="checknum" onclick="setAll()"  value="7" ${authConfigureSvc.getOneAuthConfigure(admVO.adminID).toString().indexOf('7')!=-1 ?'checked':''}><label
		                      for="chk_7">權限管理</label>

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