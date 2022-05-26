<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.donate.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
          
            


            <div class="card card-primary">
              <!-- /.card-header -->
              <div class="card-header" >
                <h3 class="card-title">捐款明細</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>

              <div class="card-body" style="width: 900px;">
				
			  <FORM METHOD="post" style="width: 400px;" ACTION="<%=request.getContextPath()%>/DonateEditServlet">
		 		
					
	                <div class="form-group">
	                  <label for="inputName">捐款序號:</label>
	                  <input type="text" id="inputName" class="form-control" name="donateID" value="${donVO.donateID}" disabled="disabled">
	                </div>
	
	                <div class="form-group">
	                  <label for="inputName">會員ID:</label>
	                  <input type="text" id="inputName" class="form-control" name="memID" value="${donVO.memID}" disabled="disabled">
	                </div>
	
	                <div class="form-group">
	                  <label for="inputName">會員姓名:</label>
	                  <input type="text" id="inputName" class="form-control" name="donateName" value="${donVO.donateName}" disabled="disabled">
	                </div>
	                
	                <div class="form-group">
	                  <label for="inputName">被領養貓咪ID:</label>
	                  <input type="text" id="inputName" class="form-control" name="catID" value="${donVO.catID}" disabled="disabled">
	                </div>
	
	                <div class="form-group">
	                  <label for="inputName">被捐款方:</label>
	                  <input type="text" id="inputName" class="form-control" name="shelterName" value="${donVO.shelterName}" disabled="disabled">
	                </div>
	
	
	                <div class="form-group">
	                  <label for="inputName">捐款金額:</label>
	                  <input type="text" id="inputName" class="form-control" name="donateAmo" value="${donVO.donateAmo}" disabled="disabled">
	                </div>
	                
	                <div class="form-group">
	                  <label for="inputStatus">付款狀態:</label>
	                  <select id="inputStatus" class="form-control custom-select" style="font-weight: 900;" name="donateStatus">
	                        <option disabled>Select one</option>
		                    <option  value="0"  ${donVO.donateStatus ==0 ?'selected':''}>處理中</option>
		                    <option  value="2"  ${donVO.donateStatus ==2 ?'selected':''}>失敗</option>
		                    <option  value="1"  ${donVO.donateStatus ==1 ?'selected':''}>成功</option>
	                  </select>
	                </div>
	
	                <div class="form-group">
	                  <label for="inputName">付款時間:</label>
	                  <input type="datetime" id="inputName" class="form-control" name="donateDate" value="<fmt:formatDate value="${donVO.donateDate}" pattern='yyyy-MM-dd HH:mm'/>" disabled="disabled">
	                </div>
	
	                <div class="form-group">
	                  <label for="inputName">電話:</label>
	                  <input type="text" id="inputName" class="form-control" name="phone" value="${donVO.phone}" disabled="disabled">
	                </div>
	
	                <div class="form-group">
	                  <label for="inputName">Email:</label>
	                  <input type="text" id="inputName" class="form-control" name="donateEmail" value="${donVO.donateEmail}" disabled="disabled">
	                </div>
	
	                <div class="form-group">
	                  <label for="inputName">地址:</label>
	                  <input type="text" id="inputName" class="form-control" name="donateAddr" value="${donVO.donateAddr}" disabled="disabled">
	                </div>
	
	              
	                <div class="form-group">
	                  <label for="inputDescription">備註留言:</label>
	                  <textarea id="inputDescription" class="form-control"
	                    rows="4" disabled="disabled">${donVO.donateMes}</textarea>
	                </div>
	
	                <p style="margin-top: 25px;">
	                   <button type="submit" class="btn_sub1">送出修改</button>
				       <button type="button" class="btn_modal_close" onclick="window.location='<%=request.getContextPath()%>/views/donate/donateBackground.jsp'">關閉</button>
	                </p>
               		<input type="hidden" name="action" value="update_Donate">
					<input type="hidden" name="donateID" value="${donVO.donateID}">
                
           		
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
</html>