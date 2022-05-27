<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.catInfo.service.*"%>
<%@ page import="web.catInfo.entity.*"%>

<%
	CatAndShelVO catAndShelVO = (CatAndShelVO) request.getAttribute("catAndShelVO");
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/CatPage_1_4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/CatPage_2_2.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/chatroom/files/css/styles_2.css" type="text/css" />
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

<!-- --------------------------------------------------------------------------------------- -->
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
<!----------------------- Content Header (Page header)-------------------------------------- -->
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
       <!-- 聊天室 -->
          <div class="grid-col grid-col_1/3@minLg" style="height:677px">
                            	<%-- <h1>${catAndShelVO.catName} 的 Chat Room</h1> --%>
								<h3 id="statusOutput" class="statusOutput"></h3>
								<textarea id="messagesArea" class="panel message-area" readonly></textarea>
								<div class="panel input-area">
									<!-- <input id="userName" class="text-field" type="text" placeholder="User name" /> --> 
									<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" /> 
									<input type="submit" id="sendMessage" class="button" value="送出" onclick="sendMessage();" /> 
							<!-- 		<input type="button" id="connect" class="button" value="Connect" onclick="connect();" /> 
									<input type="button" id="disconnect" class="button" value="Disconnect" onclick="disconnect();" /> -->
								</div>
                            </div>
           </tbody> 
        </table>
             
    </div>
   </div> 
 </div> 
	
  <!-- websocket -->
    <script type="text/javascript">
    
	    var MyPoint = "/TogetherWS/${catAndShelVO.catID}";
		var host = window.location.host;
		var path = window.location.pathname;
		var webCtx = path.substring(0, path.indexOf('/', 1));
		var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	
		var messagesArea = document.getElementById("messagesArea");
		var statusOutput = document.getElementById("statusOutput");
		var self = "AAAAA"; //sender改用EL ${userName}

		var webSocket;
    
    function connect() {
		// create a websocket
		/* console.log("hi" + endPointURL); */
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			updateStatus("已連線到 ${catAndShelVO.catName}的聊天室");
			document.getElementById('sendMessage').disabled = false;
			/* document.getElementById('connect').disabled = true;
			document.getElementById('disconnect').disabled = false; */
			getHistory();
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data); //把websocket 過來的json string 轉成 object
			/* console.log(jsonObj); //object */
			var message = jsonObj.userName + ": " + jsonObj.message + "\r\n"; //windows多一個\r
			
			if ("history" === jsonObj.type) {
				/* console.log("here is js history"); */
				messagesArea.innerHTML = '';
				let messages = JSON.parse(jsonObj.message);//jsonObj.message 又是一個json string 要再轉成object（array） 
				/* console.log(messages); */
				
				for (var i = 0; i < messages.length; i++) {
					var historyData = JSON.parse(messages[i]);
					var showMsg = historyData.createTime + ">>" + historyData.userName + ":" + historyData.message + "\r\n";
					messagesArea.value = messagesArea.value + showMsg;
				}
				
			}else if ("chat" === jsonObj.type) {
				messagesArea.value = messagesArea.value + message;
				messagesArea.scrollTop = messagesArea.scrollHeight;		
			}else {
				console.log("???");
			}
		};

			webSocket.onclose = function(event) {
				updateStatus("WebSocket Disconnected");
			};
		};
		function sendMessage() {

					var inputMessage = document.getElementById("message");
					var message = inputMessage.value.trim();
				    var date = new Date();
				    var createTime = date.getFullYear() +"."+ ("0" + (date.getMonth() + 1)).slice(-2) +"."+ ("0" + date.getDate()).slice(-2) +"_"+ ("0" + date.getHours() ).slice(-2) +":"+ ("0" + date.getMinutes()).slice(-2) +":"+ ("0" + date.getSeconds()).slice(-2);
					if (message === "") {
						alert("Input a message");
						inputMessage.focus();
					} else {
						var jsonObj = {
							"type" : "chat",
							"catID" : ${catAndShelVO.catID},
							"userName" : self,
							"message" : message,
							"createTime" : createTime
						};
						/* console.log(jsonObj); */
						webSocket.send(JSON.stringify(jsonObj));
						inputMessage.value = "";
						inputMessage.focus();
					}
				}
				function disconnect() {
					webSocket.close();
					document.getElementById('sendMessage').disabled = true;
					document.getElementById('connect').disabled = false;
					document.getElementById('disconnect').disabled = true;
				}
				function updateStatus(newStatus) {
					statusOutput.innerHTML = newStatus;
				}
				// 一進到聊天室就取得歷史訊息
				function getHistory() {
					var jsonObj = {
			 					"type" : "history",
								"catID" : ${catAndShelVO.catID},
								"message" : ""
							};  
						webSocket.send(JSON.stringify(jsonObj));
				}
    </script>
 
</body>
</html>