<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
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
	
	String toProfile = new UserDAO().getProfile(toID);
%>
<main class="chats">
	 	<%
	 		String dbURL = "jdbc:mysql://localhost:3306/Webkakao?";
			String dbID = "root";	
			String dbPassword = "0000";
						
			String SQL = ("select * from (select *from chat where toID = ? order by chatTime desc limit 10) a group by fromID;");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			ResultSet rs = pstmt.executeQuery();
				while (rs.next()){
					String fromID = rs.getString("fromID");
					String chatContent = rs.getString("chatContent");
					String chatTime = rs.getString("chatTime");				
		%>
    <ul class="chats__list">
        <li class="chats__chat" id="friendResult">
            <a href="./chat.jsp?toID=<%= fromID %>">
                <div class="chat__content">
                    <img src="<%= toProfile %>">
                    <div class="chat__preview">
                        <h3 class="chat__user"><%= fromID %></h3>
                        <span class="chat__last-message"><%= chatContent %></span>
                    </div>
                </div>
           		 <span class="chat__date-time"><%= chatTime %></span>
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