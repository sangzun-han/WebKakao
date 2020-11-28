<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" class="css">
    <title>카카오톡</title>
    <link rel="stylesheet" href="./resources/css/style.css">
</head>

<body>
<jsp:include page="header.jsp" />
	<%
		String userID = null;

		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		ArrayList<UserDTO> Specificuser = new UserDAO().getSpecificUserInfo(userID); //내 정보
	%>
<main class="profile">
    <header class="profile__header">
        <div class="profile__header-container">
        <%
        	if (userID == null) {
        		out.println("<script>alert('권한이 없습니다.');</script>");
        		out.println("<script>history.back();</script>");
        %>   
        <%
        	} else {
       	%>
       	<%
       		for (int i=0; i<Specificuser.size(); i++){
       			if (Specificuser.get(i).getUserProfile() == null) {
       	%>
	     	<img src="./resources/images/avatar.jpg" alt="">
	        <h3 class="profile__header-title"><%= Specificuser.get(i).getUserName() %></h3>
        </div>
        <%
       		} else {
       	%>		<img src="./resources/images/<%= Specificuser.get(i).getUserProfile() %>" alt="">
    	        <h3 class="profile__header-title"><%= Specificuser.get(i).getUserName() %></h3>
        <%
       		}
        %>
    </header>
    <div class="profile__container">
        <input type="text" placeholder="<%= Specificuser.get(i).getUserEmail() %>">
	        <%
	       		}
	        %>
        <%
        	}
        %>
        <div class="profile__actions">
        <form action="./profileupdateAction.jsp" method="POST" enctype="multipart/form-data">
           <input type="file" name="userProfile" id="userProfile"/>
           <input type="submit" value="수정">
        </form>
        </div>
    </div>
</main>
<div class="bigScreenText">
    <span>브라우저의 가로폭을 줄여주세요!</span>
</div>
</body>

</html>