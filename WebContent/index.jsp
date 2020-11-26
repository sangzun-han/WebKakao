<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" class="css">
  <title>카카오톡</title>
  <link rel="stylesheet" href="./resources/css/style.css">
</head>

<body>
	<jsp:include page="header.jsp" />
	<%
		request.setCharacterEncoding("utf-8");

		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	
	<main class="friends">
	  <section class="friends__section">
	    <header class="friends__section-header">
	      <h6 class="friends__section-title"></h6>
	    </header>
	    <div class="friends__section-rows">
	    <%
	    	if (userID == null) {	
	    %>
	      <div class="friends__section-row">
	        <img src="./resources/images/avatar.jpg" alt="">
	        <a href="./login.jsp" class="fisends__section-name">로그인을 해주세요.</a>
	      </div>
	      <%
	    	} else {	
	      %>
	      <%
	        String dbURL = "jdbc:mysql://localhost:3306/Webkakao?";
			String dbID = "root";	
			String dbPassword = "0000";
			
			String SQL = ("select * from user where userID =?");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()){
				String Name = rs.getString("userName");
				String Profile = rs.getString("userProfile");
		  %>
	      <div class="friends__section-row">
	      	<%
	      		if (Profile==null) {
	      	%>
	      	<img src="./resources/images/avatar.jpg" alt=""> 
	      	<a href="./profile.jsp" class="fiends__section-name">
			<%= Name %>	
	      	<%
	      		} else {
	      	%>
	      	</a>
	      
	        <img src="./resources/images/<%= Profile %>" alt="사진">
	        <a href="./profile.jsp" class="fiends__section-name">
			<%= Name %>	
			<%
	    		}
			%>
	        </a>
	      </div>
	    </div>  
	    <%
	    	}
	    %>
	    <%
	    	}
	    %>
	  </section> 
	  <section class="friends__section">
	    <header class="friends__section-header">
	      <h6 class="friends__section-title">유저목록</h6>
	    </header>
	    <%
	        String dbURL = "jdbc:mysql://localhost:3306/Webkakao?";
			String dbID = "root";	
			String dbPassword = "0000";
			
			String SQL = ("select * from user");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()){
				String Name = rs.getString("userName");
				String Profile = rs.getString("userProfile");
				String userId = rs.getString("userID");
		  %>
	    <div class="friends__section-rows">
	      <div class="friends__section-row">
	        <div class="friends__section-column">
	        <%
	      		if (Profile==null) {
	      	%>
	      	  <img src="./resources/images/avatar.jpg" alt="">
	      	  <span class="friends__section-name"><%= Name %></span>
	      	<%
	      		} else {
	      	%>
	          <img src="./resources/images/<%= Profile %>">
	          <span class="friends__section-name"><%= Name %></span>
	        <%
	      	}
	        %>
	        </div>
	        <div class="friends__section-tagline">
	          <a href="./chat.jsp?toID=<%= userId %>">대화하기</a>
	        </div>  
	      </div>
	      <%
			}
	      %>
	    </div>
	  </section>

	  <jsp:include page="footer.jsp" />
	</main>

</body>

</html>
