<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
		String userEmail = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
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
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
	        String dbURL = "jdbc:mysql://localhost:3306/Webkakao?useUnicode=yes&amp;characterEncoding=UTF-8";
			String dbID = "root";
			String dbPassword = "0000";
			
			String SQL = ("select * from user where userID =?");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()){	
	     %>
	     	<img src="./resources/images/avatar.jpg" alt="">
	        <h3 class="profile__header-title"><%= rs.getString("userName") %></h3>
        </div>
    </header>
    <div class="profile__container">
        <input type="text" placeholder=<%= rs.getString("userEmail") %> >
	         <%
	        	}
	         %>
         <%
        	}
         %>
        <div class="profile__actions">
            <div class="profile__action">
               	<span class="profile__action-circle">
               		<a href="./chats.jsp"><i class="fa fa-comment fa-lg"></i></a>
              	</span>
               	<span class="profile__action-title">채팅방</span>
            </div>
            <div class="profile__action">
                    <span class="profile__action-circle">
                        <a href="./profileupdate.jsp"><i class="fa fa-pencil fa-lg"></i></a>
                    </span>
                <span class="profile__action-title">프로필 수정</span>
            </div>
        </div>
    </div>
</main>
<div class="bigScreenText">
    <span>브라우저의 가로폭을 줄여주세요!</span>
</div>
</body>

</html>