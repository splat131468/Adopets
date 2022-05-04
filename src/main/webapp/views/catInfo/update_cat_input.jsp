<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.catInfo.entity.*"%>

<%
  CatInfoVO catInfoVO = (CatInfoVO) request.getAttribute("catInfoVO");
%>

--<%= catInfoVO==null%>--${catInfoVO==null}--${catInfoVO.memID == 0}--<%=catInfoVO.getMemID()%>--

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>貓咪資料修改 - update_cat_input.jsp</title>

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
  div {
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
	<tr><td>
		 <h3>貓咪資料修改 - update_cat_input.jsp</h3>
		 <h4><a href="${pageContext.request.contextPath}/views/catInfo/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
	<jsp:useBean id="catPhotoGalleryService" scope="page" class="web.catInfo.service.CatPhotoGalleryService" />
		<p>目前貓咪照片:</p>
		<c:forEach var="catPhotoGalleryVO" items="${catPhotoGalleryService.getOneCat(catInfoVO.catID)}">
			<div>
				<!-- 暫時先用這隻讀檔 -->
				<img src="${pageContext.request.contextPath}/DBGifReader?id=${catPhotoGalleryVO.imgID}">
			</div>
		</c:forEach> 

<FORM METHOD="post" ACTION="CatInfoServlet" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>貓咪編號:<font color=red><b>*</b></font></td>
		<td><%=catInfoVO.getCatID()%></td>
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
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=catInfoVO.getCreateDate()%>', // value:   new Date(),
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