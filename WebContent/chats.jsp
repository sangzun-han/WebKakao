<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="chat.ChatDAO" %>
<%@ page import="chat.ChatDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" class="css">
    <title>카카오톡</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="./resources/css/style.css">
</head>

<body>
<jsp:include page="header.jsp" />
<%
	String userID = null;
	
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		session.setAttribute("messageType","오류 메시지");
		session.setAttribute("messageContent", "현재 로그인이 되어있지 않습니다.");
		response.sendRedirect("login.jsp");
		return;
	}
	
	String toID = null;
	
	if (request.getParameter("toID") != null) {
		toID = (String) request.getParameter("toID");
	}
	
	String Profile = new ChatDAO().chatgetProfile(userID); //유저 프로필
	ArrayList<ChatDTO> getLastChat = new ChatDAO().getLastChat(userID); // 모든 유저정보
%>
<main class="chats">
	<%
		for (int i=0; i<getLastChat.size(); i++){
	%>
    <ul class="chats__list">
        <li class="chats__chat">
            <a href="./chat.jsp?toID=<%= getLastChat.get(i).getFromID() %>">
                <div class="chat__content">
                    <img src="<%= Profile %>">
                    <div class="chat__preview">
                        <h3 class="chat__user"><%= getLastChat.get(i).getFromID() %></h3>
                        <span class="chat__last-message"><%= getLastChat.get(i).getChatContent() %></span>
                    </div>
                </div>
           		 <span class="chat__date-time"><%= getLastChat.get(i).getChatTime() %></span>
            </a>
        </li>
    </ul>
    <%
		}
    %>
    <div class="chat-btn">
        <i class="fa fa-comment"></i>
    </div>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>