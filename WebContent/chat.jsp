<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" class="css">
    <title>카카오톡</title>
    <link rel="stylesheet" href="./resources/css/style.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>
<jsp:include page="header.jsp" />
	<%
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd");
		
		String userID = null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} else {
			out.println("<script> alert('권한이 없습니다')</script>");
			out.println("<script> history.back() </script>");
		}
		
		String toID = null;
		
		if (request.getParameter("toID") != null) {
			toID = (String) request.getParameter("toID");
		}
		
		if (userID==toID){
			out.println("<script> alert('자기자신과는 채팅할 수 없습니다.')</script>");
			out.println("<script> history.back() </script>");
			return;
		}
	
		
		String fromProfile = new UserDAO().getProfile(userID);
		String toProfile = new UserDAO().getProfile(toID);
	%>
<main class="chat">
    <div class="date-divider">
        <span class="date-divider__text"><%= sf.format(nowTime) %></span>
    </div>
    <div id="fromchatList">
	    <!--
	    <div class="chat__message chat__message-from-me">
	       <span class="chat__message-time">17:55</span>
	       <span class="chat__message-body">Hello~! This is my message.</span> 
	    </div>
	    -->
 	</div>
 	<div id="tochatList">
 	<!-- 
	   <div class="chat__message chat__message--to-me">
	        <img src="./resources/images/avatar.jpg" class="chat__message-avatar">
	        <div class="chat__message-center">
	            <h3 class="chat__message-username">Emma</h3>
	            <span class="chat__message-body">Reply.</span>
	        </div>
	        <span class="chat__message-time">18:55</span>
	    </div>
	 -->
    </div>
</main>
    <div class="type-message">
    <div class="type-message__input">
        <input type="text" id="chatContent">
        <button type="button" onclick="submitFunction();">전송</button>
    </div>
</div>



<div class="bigScreenText">
    <span>브라우저의 가로폭을 줄여주세요!</span>
</div>

</body>
	<script type="text/javascript">
	function submitFunction() {
		var fromID = '<%= userID %>';
		var toID = '<%= toID %>';
		var chatContent = $('#chatContent').val();
		$.ajax({
			type : 'POST',
			url : './chatSubmitServlet',
			data : {
				fromID : encodeURIComponent(fromID),
				toID : encodeURIComponent(toID),
				chatContent : encodeURIComponent(chatContent)
			},
			success: function(result){
				
			}
		});
		$('#chatContent').val("");
	}
	var lastID = 0;
	function chatListFunction(type) {
		var fromID = '<%= userID %>';
		var toID = '<%= toID %>';
		$.ajax({
			type:"POST",
			url : "./chatListServlet",
			data : {
				fromID : encodeURIComponent(fromID),
				toID : encodeURIComponent(toID),
				chatContent : encodeURIComponent(chatContent),
				listType: type
			},
			success : function(data){
				if(data == "") 
					return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				
				for(var i = 0; i<result.length; i++){
					if(result[i][0].value == fromID) {
						result[i][0].value = '나';
					}
					addChat(result[i][0].value, result[i][2].value, result[i][3].value); 
				}
				lastID = Number(parsed.last);
			}
		});
	}	
	function addChat(chatName, chatContent, chatTime){
		 if (chatName == '나') {
			$('#tochatList').append('<div class="chat__message chat__message--to-me">' +
					'<img src="<%= fromProfile %>" class="chat__message-avatar">' +
					'<div class="chat__message-center">' +
					'<h3 class="chat__message-username">' +
					chatName +
					'</h3>' +
					'<span class="chat__message-body">' +
					chatContent +
					'</span>' +
					'</div>' +
	        		'<span class="chat__message-time">' +
	        		chatTime +
	        		'</span>' +
	    			'</div>'
	    			);
			} else {
				$('#tochatList').append('<div class="chat__message chat__message--to-me">' +
						'<img src="<%= toProfile %>" class="chat__message-avatar">' +
						'<div class="chat__message-center">' +
						'<h3 class="chat__message-username">' +
						chatName +
						'</h3>' +
						'<span class="chat__message-body">' +
						chatContent +
						'</span>' +
						'</div>' +
		        		'<span class="chat__message-time">' +
		        		chatTime +
		        		'</span>' +
		    			'</div>'
		    			);
			}
	}
			$('#tochatList').scrollTop($('#tochatList')[0].scrollHeight);
			
		function getInfiniteChat() {
			setInterval(function() {
				chatListFunction(lastID);
			}, 1000);
		}
	</script>
	<script>
		$(document).ready(function(){
			chatListFunction('ten');
			getInfiniteChat();
		});
	</script>
</html>