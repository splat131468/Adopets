<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.catInfo.service.*"%>
<%@ page import="web.catInfo.entity.*"%>
<%
CatInfoService catSvc = new CatInfoService();
List<CatInfoVO> list = catSvc.getAll();
pageContext.setAttribute("list", list);
%>

<html>
<head>
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
<!-------------------------------------------cat------------------------------------------------------------------------------------->

<!-------------------------------------------------------------------------------------------------------------------------------->
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

<style>
tr,td {
  height: 50px;
  padding: 5px 0px;
}
</style>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
<%@ include file="/views/chatroom/pages/background.file" %>
<div class="content-wrapper">
<section class="content-header">
	<div class="container-fluid">
   		<h1>所有貓咪</h1>
  	</div>
</section>
  	<div class="row">
		<div class="col-12">
	 		<div class="card">
	  			<div class="card-header">
					<h3 class="card-title">
						
					</h3>
	  			</div>
			</div>
		</div>
	</div>
<!-- -------------------------------新增訂單--------------------------------------------------- -->
	  <div class="card-body table-responsive p-0">
		<table class="table table-hover text-nowrap">
            <thead>
              <tr>
            	<th>貓咪編號</th>
				<th>貓咪姓名</th>
				<th>查看</th>
              </tr>
            </thead>
            <tbody >
	<%@ include file="page1.file"%>
	<c:forEach var="catInfoVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			  <tr>
				<td>${catInfoVO.catID}</td>
				<td>${catInfoVO.catName}</td>
				
				<td><button class="btn btn-primary btnPurple">
                   <a  href="${pageContext.request.contextPath}/ChatServlet?action=getCatback&catID=${catInfoVO.catID}" style="color: white">聊天
                   </button>
					 
                </td>										
			
			  </tr>

            </c:forEach>
           </tbody> 
        </table>
             <%@ include file="page2.file"%> 
    </div>
   </div> 
   </div> 
	
  </div>
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
</html>