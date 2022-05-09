<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.catInfo.entity.*"%>

<%
CatInfoVO catInfoVO = (CatInfoVO) request.getAttribute("catInfoVO");
%>
--${catInfoVO.age }--


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>貓咪資料新增 - addCat.jsp</title>

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

</head>
<body bgcolor='white'>
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


	<table id="table-1">
		<tr>
			<td>
				<h3>貓咪資料新增 - addCat.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="${pageContext.request.contextPath}/views/catInfo/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>貓咪資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/CatInfoServlet" name="form1" enctype="multipart/form-data">
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


</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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