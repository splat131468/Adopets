<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="web.order.entity.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
OrdersVO ordersVO = (OrdersVO) request.getAttribute("ordersVO"); 
%>

<html>
<head>

<title>訂單資料 - listOneOrders.jsp</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
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
<!-- sweetalert2 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/css/system.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/css/btn.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="https://kit.fontawesome.com/f944d9625b.js"></script>

<script src="<%=request.getContextPath()%>/resources/background/js/btn.js"></script>
<!-- js要在jQuery之後才能引進 -->
<script src="<%=request.getContextPath()%>/resources/background/js/system.js"></script>
	
<!-- Bootstrap 4 -->
 <script src="<%=request.getContextPath()%>/resources/background/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/background/js/adminlte.min.js"></script>

</head>
<body>
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
              <a href="member.html" class="nav-link">
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
              <a href="<%=request.getContextPath()%>/views/order/Orders.jsp" class="nav-link active">
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
              <a href="#" class="nav-link ">
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
<!-- ----------------------------------------------------------------------------------- -->
<div class="content-wrapper">
<section class="content-header">
	<div class="container-fluid">
   		<h1>單筆訂單</h1>
  	</div>
</section>
  	<div class="row">
		<div class="col-12">
	 		<div class="card">
	  			<div class="card-header">
					<h3 class="card-title">
						<ul>
			 				<li><a href='<%=request.getContextPath()%>/views/order/Orders.jsp'>返回</a>訂單管理</li>
						</ul>
					</h3>
	  			</div>
			</div>
		</div>
	</div>		
<!-- -------------------------------------------------------------------------------------- -->		
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">
						<thead>
							<tr>
								<th>訂單編號</th>
								<th>會員編號</th>
								<th>建立時間</th>
								<th>訂單價格</th>
								<th>訂單狀態</th>
								<th>支付方式</th>
								<th>寄送地址</th>
								<th>修改</th>
								<th>刪除</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=ordersVO.getOrderID()%></td>
								<td><%=ordersVO.getMemID()%></td>
								<td><%=ordersVO.getCreateTime()%></td>
								<td><%=ordersVO.getOrderPrice()%></td>
								<td><%=ordersVO.getOrderStatus() == 1 ? "信用卡" : "現金"%></td>
								<td><%=ordersVO.getPaymentType() == 1 ? "已出貨" : "未出貨"%></td>
								<td><%=ordersVO.getAddress()%></td>
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" style="margin-bottom: 0px;">
										<button type="submit" class="btn_modal" style="margin-right:15px">
                        					<i class="nav-icon fas fa-edit" type="button"></i>
                      					</button>
										<input type="hidden" name="orderID" value="<%=ordersVO.getOrderID()%>"> 
										<input type="hidden" name="action" value="getOne_For_Update">
									</FORM>
								</td>
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrdersServlet" id="delete" style="margin-bottom: 0px;">
										<button type="button" class="btn_modal_del" style="margin-right:15px">
                        					<i class="fa-solid fa-trash-can" type="button"></i>
                      					</button>
										<input type="hidden" name="orderID" value="<%=ordersVO.getOrderID()%>"> 
										<input type="hidden" name="action" value="delete">
									</FORM>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
	</div>
	</div>
</body>
</html>