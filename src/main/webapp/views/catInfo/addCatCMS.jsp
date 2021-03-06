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
<!-- js??????jQuery?????????????????? -->
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

    // ?????????
    var picture_list = document.getElementsByClassName("picture_list")[0];
    picture_list.innerHTML = ""; // ??????
    
    // ??????????????????????????????????????? i ?????????
    console.log("this : " + this);
    for (let i = 0; i < this.files.length; i++) {
      let reader = new FileReader(); // ??????????????????
      reader.readAsDataURL(this.files[i]); // ????????????
      reader.addEventListener("load", function () {
        let li_html = `
                <li><img src="\${reader.result}" class="preview"></li>
              `;
        picture_list.insertAdjacentHTML("beforeend", li_html); // ????????????
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
              <h1>????????????</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/views/background_login/background.jsp">Home</a></li>
                <li class="breadcrumb-item active">????????????</li>
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
                <h3 class="card-title">??????????????????</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>

              <div class="card-body" style="width: 900px;">
              	<c:if test="${not empty errorMsgs}">
		<font style="color: red">?????????????????????:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
              <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/CatInfoServletCMS" name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>???????????????:</td>
				<td><input type="TEXT" name="shelterName" size="45"
					value="<%=(catInfoVO == null) ? "" : catInfoVO.getShelterName()%>" /></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><input type="TEXT" name="catName" size="45"
					value="<%=(catInfoVO == null) ? "" : catInfoVO.getCatName()%>" /></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><select name="age" size="1">
						<option value="0" ${(catInfoVO.age == 0) ? 'selected' : ''}>??????</option>
						<option value="1" ${(catInfoVO.age == 1) ? 'selected' : ''}>??????</option>
						<option value="2" ${(catInfoVO.age == 2) ? 'selected' : ''}>??????</option>
						<option value="3" ${(catInfoVO.age == 3) ? 'selected' : ''}>??????</option>
				</select></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><select name="breed" size="1">
						<option value="?????????" ${(catInfoVO.breed == "?????????") ? 'selected' : ''}>?????????</option>
						<option value="???????????????" ${(catInfoVO.breed == "???????????????") ? 'selected' : ''}>???????????????</option>
						<option value="???????????????" ${(catInfoVO.breed == "???????????????") ? 'selected' : ''}>???????????????</option>
						<option value="?????????" ${(catInfoVO.breed == "?????????") ? 'selected' : ''}>?????????</option>
						<option value="?????????" ${(catInfoVO.breed == "?????????") ? 'selected' : ''}>?????????</option>
				</select></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><select name="sex" size="1">
						<option value="???" ${(catInfoVO.sex == '???') ? 'selected' : ''}>???</option>
						<option value="???" ${(catInfoVO.sex == '???') ? 'selected' : ''}>???</option>
				</select></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><select name="size" size="1">
						<option value="??????" ${(catInfoVO.size == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.size == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.size == "??????") ? 'selected' : ''}>??????</option>
				</select></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><select name="coatColor" size="1">
						<option value="??????" ${(catInfoVO.coatColor == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.coatColor == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.coatColor == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.coatColor == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.coatColor == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.coatColor == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.coatColor == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.coatColor == "??????") ? 'selected' : ''}>??????</option>
				</select></td>
			</tr>
			<tr>
				<td>??????????????????:</td>
				<td><select name="eyeColor" size="1">
						<option value="??????" ${(catInfoVO.eyeColor == "??????") ? 'selected' : ''}>??????</option>
						<option value="??????" ${(catInfoVO.eyeColor == "??????") ? 'selected' : ''}>??????</option>
				</select></td>
			</tr>
			<tr>
				<td>??????????????????:</td>
				<td><input type="TEXT" name="health" size="45"
					value="<%=(catInfoVO == null) ? "" : catInfoVO.getHealth()%>" /></td>
			</tr>
			<tr>
				<td>??????????????????:</td>
				<td><input type="TEXT" name="adoptCost" size="45"
					value="<%=(catInfoVO == null) ? 0 : catInfoVO.getAdoptCost()%>" /></td>
			</tr>
			<tr>
				<td>????????????????????????:</td>
				<td><select name="haveVaccine" size="1">
						<option value="false"
							${(catInfoVO.haveVaccine == "false") ? 'selected' : ''}>???</option>
						<option value="true"
							${(catInfoVO.haveVaccine == "true") ? 'selected' : ''}>???</option>
				</select></td>
			</tr>
			<tr>
				<td>?????????????????????:</td>
				<td><select name="adopt" size="1">
						<option value="false"
							${(catInfoVO.adopt == "false") ? 'selected' : ''}>???</option>
						<option value="true"
							${(catInfoVO.adopt == "true") ? 'selected' : ''}>???</option>
				</select></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><input type="TEXT" name="createDate" size="45" id="f_date1" /></td>
			</tr>
			<tr>
				<td>??????????????????:</td>
				<td><input type="file" id="the_file" name="upfile1" multiple></td>
			</tr>
<%-- 			<jsp:useBean id="shelterInfoService" scope="page"
				class="web.catInfo.service.ShelterInfoService" /> --%>
			<%-- 	<tr>
		<td>??????:<font color=red><b>*</b></font></td>
		<td><select size="1" name="deptno">
			<c:forEach var="deptVO" items="${deptSvc.all}">
				<option value="${deptVO.deptno}" ${(catInfoVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname}
			</c:forEach>
		</select></td>
	</tr> --%>

		</table>
		<ul class="picture_list"></ul> <!-- ????????? -->
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="????????????">
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
	       step: 1,                //step: 60 (??????timepicker???????????????60??????)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // ??????????????????
           //startDate:	            '2017/07/10',  // ?????????
           //minDate:               '-1970-01-01', // ????????????(??????)??????
           //maxDate:               '+1970-01-01'  // ????????????(??????)??????
        });
        
        
   
        // ----------------------------------------------------------???????????????????????????????????????-----------------------------------------------------------

        //      1.?????????????????????????????????????????????
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

        
        //      2.?????????????????????????????????????????????
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


        //      3.???????????????????????????????????????????????? (?????????????????????????????????)
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