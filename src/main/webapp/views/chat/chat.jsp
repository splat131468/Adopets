<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>

 <html>
 <head>
 <title>Chat Room</title>

 <link rel="stylesheet" href="styles.css" type="text/css" /> 
 </head> 

 <body onload="connect();" onunload="disconnect();"> 
 	<h1>Chat Room</h1> 
 	<h3 id="statusOutput" class="statusOutput"></h3> 
 	<div id="row"></div>
 	<textarea id="messagesArea" class="panel message-area" readonly></textarea> 
 	<div class="panel input-area"> 
 		<input id="userName" class="text-field" type="hidden" value="jack"  /> 
 		<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" />  
 		<input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" />  
 		<input type="button" id="connect" class="button" value="Connect" onclick="connect();" />  
 		<input type="button" id="disconnect" class="button" value="Disconnect" onclick="disconnect();" /> 
 	</div> 
 </body>

 <script>
 	var MyPoint = "/TogetherWS/john";
 	var host = window.location.host;
 	var path = window.location.pathname;
 	var webCtx = path.substring(0, path.indexOf('/', 1));
 	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
							
 	var statusOutput = document.getElementById("statusOutput");
 	var username = Membervo.memName;
 	var webSocket;

 	function connect() {
 		// create a websocket
 		webSocket = new WebSocket(endPointURL);

 		webSocket.onopen = function(event) {
 			updateStatus("WebSocket Connected");
 			document.getElementById('sendMessage').disabled = false;
 			document.getElementById('connect').disabled = true;
 			document.getElementById('disconnect').disabled = false;
 			
 			
 			var container = document.getElementById("row");
 					var jsonObj = {
 							"type" : "history",
 							"username" : username,
 							"message" : ""
 						};
 					webSocket.send(JSON.stringify(jsonObj));
 				};
 			
 		};

 		webSocket.onmessage = function(event) {
 			var jsonObj = JSON.parse(event.data);
 		 if ("history" === jsonObj.type) {
			messagesArea.innerHTML = '';
			var ul = document.createElement('ul');
			ul.id = "area";
			messagesArea.appendChild(ul);
			// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
			var messages = JSON.parse(jsonObj.message);
			for (var i = 0; i < messages.length; i++) {
				var historyData = JSON.parse(messages[i]);
				var showMsg = historyData.message;
				var li = document.createElement('li');
		
				
				li.innerHTML = showMsg;
				ul.appendChild(li);
			}
			messagesArea.scrollTop = messagesArea.scrollHeight;
		} else if ("chat" === jsonObj.type) {
			var li = document.createElement('li');
		
			li.innerHTML = jsonObj.message;
		
			document.getElementById("area").appendChild(li);
			messagesArea.scrollTop = messagesArea.scrollHeight;
		} 
		}
 			
 			
 			
 			
//  			var messagesArea = document.getElementById("messagesArea");
//  			var jsonObj = JSON.parse(event.data);
//  			var message = jsonObj.userName + ": " + jsonObj.message + "\r\n";
//  			messagesArea.value = messagesArea.value + message;
//  			messagesArea.scrollTop = messagesArea.scrollHeight;  
 		};

 		webSocket.onclose = function(event) {
 			updateStatus("WebSocket Disconnected");
 		};
 	}
 	
 	var inputUserName = document.getElementById("userName").value;
 	
 	function sendMessage() {
 			
 		
 		var inputMessage = document.getElementById("message");
 		var message = inputMessage.value.trim();

 		if (message === "") {
 			alert("Input a message");
 			inputMessage.focus();
 		} else {
 			var jsonObj = {
 				"type" : chat,
 				"userName" : inputUserName,
 				"message" : message
 			};
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
 	
 
 	
 </script> 
 </html> 
    