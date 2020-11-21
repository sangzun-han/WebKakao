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
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
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
			String Name = rs.getString("userName");
			String Profile = rs.getString("userProfile");
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
	        <a href="./login.jsp" class="fiends__section-name">
	          로그인을 해주세요.
	        </a>
	      </div>
	      <%
	    	} else {
	      %>
	      <div class="friends__section-row">
	        <img src="./resources/images/<%= Profile %>" alt="사진">
	        <a href="./profile.jsp" class="fiends__section-name">
			<%= Name %>
			   <%
				}
	          %>
	        </a>
	      </div>
	    </div>
	  </section>
	  <section class="friends__section">
	    <header class="friends__section-header">
	      <h6 class="friends__section-title">유저목록</h6>
	    </header>
	    <div class="friends__section-rows">
	      <div class="friends__section-row">
	        <div class="friends__section-column">
	          <img src="./resources/images/avatar.jpg">
	          <span class="friends__section-name">한상준</span>
	        </div>
	        <div class="friends__section-tagline">
	          <a href="./chat.jsp">대화하기</a>
	        </div>  
	      </div>
	      
	    </div>
	  </section>
	  <%
	  	}
	  %>
	  <jsp:include page="footer.jsp" />
	</main>

</body>

</html>
