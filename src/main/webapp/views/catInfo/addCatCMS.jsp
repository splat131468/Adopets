<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.donate.entity.*"%>
<%@ page import="web.catInfo.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%

DonateVO donVO = (DonateVO) request.getAttribute("donVO");
session.getAttribute("adminVO");
session.getAttribute("auth");

CatInfoVO catInfoVO = (CatInfoVO) request.getAttribute("catInfoVO");

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

<style>
table {
	width: 550px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}

img.preview {
	width: 200px;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

ul>li {
	display: inline-block;
	vertical-align: top;
}
</style>

</style>

</head>
<body class="hold-transition sidebar-mini">

<script>
        window.addEventListener("load", function(){
  var the_file_element = document.getElementById("the_file");
  the_file_element.addEventListener("change", function(e){          

    // 寫在這
    var picture_list = document.getElementsByClassName("picture_list")[0];
    picture_list.innerHTML = ""; // 清空
    
    // 跑每個使用者選的檔案，留意 i 的部份
    console.log("this : " + this);
    for (let i = 0; i < this.files.length; i++) {
      let reader = new FileReader(); // 用來讀取檔案
      reader.readAsDataURL(this.files[i]); // 讀取檔案
      reader.addEventListener("load", function () {
        let li_html = `
                <li><img src="\${reader.result}" class="preview"></li>
              `;
        picture_list.insertAdjacentHTML("beforeend", li_html); // 加進節點
      });
    }
  });
});
    </script>


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
             <a href="<%=request.getContextPath()%>/views/catInfo/select_page.jsp" class="nav-link">
                <i class="nav-icon fa-solid fa-sack-dollar"></i>
                <p>貓咪管理</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fa-solid fa-gear"></i>
                <p>
                  系統管理
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                 <a href="<%=request.getContextPath()%>/views/admin/system.jsp" class="nav-link">
                    <i class="nav-icon fas"></i>
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
              <h1>新增貓咪</h1>
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
          
            


            <div class="card card-primary">
              <!-- /.card-header -->
              <div class="card-header" >
                <h3 class="card-title">新增貓咪資料</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>

              <div class="card-body" style="width: 900px;">
              	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
              <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/CatInfoServletCMS" name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>收容所名稱:</td>
				<td><input type="TEXT" name="shelterName" size="45"
					value="<%=(catInfoVO == null) ? "" : catInfoVO.getShelterName()%>" /></td>
			</tr>
			<tr>
				<td>貓咪名字:</td>
				<td><input type="TEXT" name="catName" size="45"
					value="<%=(catInfoVO == null) ? "" : catInfoVO.getCatName()%>" /></td>
			</tr>
			<tr>
				<td>貓咪年齡:</td>
				<td><select name="age" size="1">
						<option value="0" ${(catInfoVO.age == 0) ? 'selected' : ''}>幼貓</option>
						<option value="1" ${(catInfoVO.age == 1) ? 'selected' : ''}>小貓</option>
						<option value="2" ${(catInfoVO.age == 2) ? 'selected' : ''}>成貓</option>
						<option value="3" ${(catInfoVO.age == 3) ? 'selected' : ''}>老貓</option>
				</select></td>
			</tr>
			<tr>
				<td>貓咪品種:</td>
				<td><select name="breed" size="1">
						<option value="米克斯" ${(catInfoVO.breed == "米克斯") ? 'selected' : ''}>米克斯</option>
						<option value="美國短毛貓" ${(catInfoVO.breed == "美國短毛貓") ? 'selected' : ''}>美國短毛貓</option>
						<option value="英國短毛貓" ${(catInfoVO.breed == "英國短毛貓") ? 'selected' : ''}>英國短毛貓</option>
						<option value="金吉拉" ${(catInfoVO.breed == "金吉拉") ? 'selected' : ''}>金吉拉</option>
						<option value="布偶貓" ${(catInfoVO.breed == "布偶貓") ? 'selected' : ''}>布偶貓</option>
				</select></td>
			</tr>
			<tr>
				<td>貓咪性別:</td>
				<td><select name="sex" size="1">
						<option value="公" ${(catInfoVO.sex == '公') ? 'selected' : ''}>公</option>
						<option value="母" ${(catInfoVO.sex == '母') ? 'selected' : ''}>母</option>
				</select></td>
			</tr>
			<tr>
				<td>貓咪大小:</td>
				<td><select name="size" size="1">
						<option value="小型" ${(catInfoVO.size == "小型") ? 'selected' : ''}>小型</option>
						<option value="中型" ${(catInfoVO.size == "中型") ? 'selected' : ''}>中型</option>
						<option value="大型" ${(catInfoVO.size == "大型") ? 'selected' : ''}>大型</option>
				</select></td>
			</tr>
			<tr>
				<td>貓咪毛色:</td>
				<td><select name="coatColor" size="1">
						<option value="黑色" ${(catInfoVO.coatColor == "黑色") ? 'selected' : ''}>黑色</option>
						<option value="白色" ${(catInfoVO.coatColor == "白色") ? 'selected' : ''}>白色</option>
						<option value="虎斑" ${(catInfoVO.coatColor == "虎斑") ? 'selected' : ''}>虎斑</option>
						<option value="橘色" ${(catInfoVO.coatColor == "橘色") ? 'selected' : ''}>橘色</option>
						<option value="三花" ${(catInfoVO.coatColor == "三花") ? 'selected' : ''}>三花</option>
						<option value="藍色" ${(catInfoVO.coatColor == "藍色") ? 'selected' : ''}>藍色</option>
						<option value="玳瑁" ${(catInfoVO.coatColor == "玳瑁") ? 'selected' : ''}>玳瑁</option>
						<option value="豹紋" ${(catInfoVO.coatColor == "豹紋") ? 'selected' : ''}>豹紋</option>
				</select></td>
			</tr>
			<tr>
				<td>貓咪眼睛顏色:</td>
				<td><select name="eyeColor" size="1">
						<option value="黃色" ${(catInfoVO.eyeColor == "黃色") ? 'selected' : ''}>黃色</option>
						<option value="綠色" ${(catInfoVO.eyeColor == "綠色") ? 'selected' : ''}>綠色</option>
				</select></td>
			</tr>
			<tr>
				<td>貓咪健康情況:</td>
				<td><input type="TEXT" name="health" size="45"
					value="<%=(catInfoVO == null) ? "" : catInfoVO.getHealth()%>" /></td>
			</tr>
			<tr>
				<td>貓咪認養花費:</td>
				<td><input type="TEXT" name="adoptCost" size="45"
					value="<%=(catInfoVO == null) ? 0 : catInfoVO.getAdoptCost()%>" /></td>
			</tr>
			<tr>
				<td>貓咪是否施打疫苗:</td>
				<td><select name="haveVaccine" size="1">
						<option value="false"
							${(catInfoVO.haveVaccine == "false") ? 'selected' : ''}>否</option>
						<option value="true"
							${(catInfoVO.haveVaccine == "true") ? 'selected' : ''}>是</option>
				</select></td>
			</tr>
			<tr>
				<td>貓咪是否被認養:</td>
				<td><select name="adopt" size="1">
						<option value="false"
							${(catInfoVO.adopt == "false") ? 'selected' : ''}>否</option>
						<option value="true"
							${(catInfoVO.adopt == "true") ? 'selected' : ''}>是</option>
				</select></td>
			</tr>
			<tr>
				<td>新增日期:</td>
				<td><input type="TEXT" name="createDate" size="45" id="f_date1" /></td>
			</tr>
			<tr>
				<td>新增貓咪照片:</td>
				<td><input type="file" id="the_file" name="upfile1" multiple></td>
			</tr>
<%-- 			<jsp:useBean id="shelterInfoService" scope="page"
				class="web.catInfo.service.ShelterInfoService" /> --%>
			<%-- 	<tr>
		<td>部門:<font color=red><b>*</b></font></td>
		<td><select size="1" name="deptno">
			<c:forEach var="deptVO" items="${deptSvc.all}">
				<option value="${deptVO.deptno}" ${(catInfoVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname}
			</c:forEach>
		</select></td>
	</tr> --%>

		</table>
		<ul class="picture_list"></ul> <!-- 貓照片 -->
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="送出新增">
	</FORM>
				
			 
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card-body -->
        
        <!-- /.card -->

      </div>
    </div>
    <!-- /.content -->
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
  <!-- /.content-wrapper -->
  </div>

</body>

</html>


</body>

<%
java.sql.Date hiredate = null;
try {
	hiredate = catInfoVO.getCreateDate();
} catch (Exception e) {
	hiredate = new java.sql.Date(System.currentTimeMillis());
}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/catInfo/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/views/catInfo/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/views/catInfo/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>

</html>