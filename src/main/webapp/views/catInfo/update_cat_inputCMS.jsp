<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.catInfo.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%

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
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
 table {
	width: 600px;
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
  
  img {
  	width: 200px;
  }
 .pic {
  	display: inline-block;
  	margin: 10px;
  }
  img.preview{
    width: 200px;
  }
  ul{
    list-style: none;
    margin: 0;
    padding: 0;
  }
  ul > li{
    display: inline-block;
    vertical-align: top;
  }
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
  <%@ include file="/views/catInfo/pages/background.file" %>

    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>貓咪資料修改</h1>
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
                <h3 class="card-title">資料修改</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>

              <div class="card-body">
              	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
              <jsp:useBean id="catPhotoGalleryService" scope="page" class="web.catInfo.service.CatPhotoGalleryService" />
		<p>目前貓咪照片:</p>
		<c:forEach var="catPhotoGalleryVO" items="${catPhotoGalleryService.getOneCat(catInfoVO.catID)}">
			<div class="pic">
				<!-- 暫時先用這隻讀檔 -->
				<img src="${pageContext.request.contextPath}/DBGifReader?id=${catPhotoGalleryVO.imgID}">
			</div>
		</c:forEach> 

<FORM METHOD="post" ACTION="CatInfoServletCMS" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>貓咪編號:<font color=red><b>*</b></font></td>
		<td><%=catInfoVO.getCatID()%></td>
	</tr>
	<tr>
		<td>貓咪品種:<font color=red><b>*</b></font></td>
		<td><%=catInfoVO.getBreed()%></td>
	</tr>
	<tr>
		<td>貓咪年齡:<font color=red><b>*</b></font></td>
		
		<c:choose>
		   <c:when	 test="${catInfoVO.age == 0}">
		   	<td>幼貓</td>
		   </c:when>
		   <c:when	 test="${catInfoVO.age == 1}">
		   	<td>小貓</td>
		   </c:when>
		   <c:when	 test="${catInfoVO.age == 2}">
		   	<td>成貓</td>
		   </c:when>
		   <c:otherwise>
			<td>老貓</td>		   	
		   </c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<td>貓咪大小:<font color=red><b>*</b></font></td>
		<td><%=catInfoVO.getSize()%></td>
	</tr>
	<tr>
		<td>貓咪性別:<font color=red><b>*</b></font></td>
		<td><%=catInfoVO.getSex()%></td>
	</tr>
	<tr>
		<td>貓咪毛色:<font color=red><b>*</b></font></td>
		<td><%=catInfoVO.getCoatColor()%></td>
	</tr>
	<tr>
		<td>貓咪眼睛顏色:<font color=red><b>*</b></font></td>
		<td><%=catInfoVO.getEyeColor()%></td>
	</tr>
	<tr>
		<td>認養人會員編號:</td>
		<c:choose>
		   <c:when	 test="${catInfoVO.memID == 0}">
		   	<td><input type="TEXT" name="memID" size="50" value='' placeholder="請填入會員編號	"/></td>
		   </c:when>
		   <c:otherwise>
			<td><input type="TEXT" name="memID" size="30" value="${catInfoVO.memID}" /></td>		   	
		   </c:otherwise>
		</c:choose>

	</tr>
	<tr>
		<td>收容所名稱:</td>
		<td><input type="TEXT" name="shelterName" size="45"	value="<%=catInfoVO.getShelterName()%>" /></td>
	</tr>
	<tr>
		<td>貓咪名稱:</td>
		<td><input type="TEXT" name="catName" size="45"	value="<%=catInfoVO.getCatName()%>" /></td>
	</tr>
	<tr>
		<td>是否有打疫苗:</td>
		<td><input type="TEXT" name="haveCaccine" size="45"	value="<%=catInfoVO.getHaveVaccine()%>" /></td>
	</tr>
	<tr>
		<td>健康情況:</td>
		<td><input type="TEXT" name="health" size="45" value="<%=catInfoVO.getHealth()%>" /></td>
	</tr>
	<tr>
		<td>認養金額:</td>
		<td><input type="TEXT" name="adoptCost" size="45" value="<%=catInfoVO.getAdoptCost()%>" /></td>
	</tr>
	<tr>
		<td>是否認養:</td>
		<td><input type="TEXT" name="adopt" size="45" value="<%=catInfoVO.getAdopt()%>" /></td>
	</tr>
	<tr>
		<td>新增貓咪照片:</td>
		<td><input type="file" id="the_file" name="upfile1" multiple></td>
	</tr>
</table>
<ul class="picture_list"></ul> <!-- 貓照片 -->
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="catID" value="<%=catInfoVO.getCatID()%>">
<input type="submit" value="送出修改">
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