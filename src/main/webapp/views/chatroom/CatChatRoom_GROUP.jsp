<%@page import="web.catInfo.entity.CatAndShelVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<title>${param.catname} 的 Chat Room</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/chatroom/files/css/styles.css" type="text/css" />
</head>
<body onload="connect();" onunload="disconnect();">
	<h1>${param.catname} 的 Chat Room</h1>
	<h3 id="statusOutput" class="statusOutput"></h3>
	<textarea id="messagesArea" class="panel message-area" readonly></textarea>
	<div class="panel input-area">
		<!-- <input id="userName" class="text-field" type="text" placeholder="User name" /> --> 
		<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" /> 
		<input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" /> 
		<input type="button" id="connect" class="button" value="Connect" onclick="connect();" /> 
		<input type="button" id="disconnect" class="button" value="Disconnect" onclick="disconnect();" />
	</div>
</body>

<script>
	/* console.log(${param.catid}); */
	var MyPoint = "/TogetherWS/${param.catid}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var messagesArea = document.getElementById("messagesArea");
	var statusOutput = document.getElementById("statusOutput");
	var self = 'USER1'; //sender改用EL ${userName}
	var webSocket;
	
	
	
	

	function connect() {
		// create a websocket
		/* console.log("hi" + endPointURL); */
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			updateStatus("WebSocket Connected");
			document.getElementById('sendMessage').disabled = false;
			document.getElementById('connect').disabled = true;
			document.getElementById('disconnect').disabled = false;
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
				console.log(messages);
				
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
	}

/* 	var inputUserName = document.getElementById("userName");
	inputUserName.focus(); */

	function sendMessage() {
/* 		var userName = inputUserName.value.trim();
		if (userName === "") {
			alert("Input a user name");
			inputUserName.focus();
			return;
		} */

		var inputMessage = document.getElementById("message");
		var message = inputMessage.value.trim();
	    var date = new Date();
	    var createTime = date.getFullYear() +"."+ ("0" + (date.getMonth() + 1)).slice(-2) +"."+ ("0" + date.getDate()).slice(-2) +"_"+ ("0" + date.getHours() ).slice(-2) +":"+ ("0" + date.getMinutes()).slice(-2) +":"+ ("0" + date.getSeconds()).slice(-2);
	    /* var createTime = date.getFullYear() +"."+ ("0" + (date.getMonth() + 1)).slice(-2) +"."+ ("0" + date.getDate()).slice(-2) +"_"+ ("0" + date.getHours() ).slice(-2); */
		/* console.log(createTime); */

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else {
			var jsonObj = {
				"type" : "chat",
				"catID" : ${param.catid},
				"userName" : self,
				"message" : message,
				"createTime" : createTime
			
			};
			console.log(jsonObj);
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
		/* console.log("this is getHistory"); */
		/* var container = document.getElementById("row"); */
		/* container.addEventListener("click", function(e) { */
			/* var friend = e.srcElement.textContent; */
			/* updateFriendName(friend); */
		var jsonObj = {
 					"type" : "history",
					"catID" : ${param.catid},
				/* 	"sender" : self,
					"receiver" : friend, */
					"message" : ""
				};  
			
			

			webSocket.send(JSON.stringify(jsonObj));
		/* }); */
	}
</script>
</html>