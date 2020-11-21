<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	String path = "C://Users//zzun//eclipse-workspace//Webkakao//WebContent//resources//images/";
	MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	
	String userID = null;
	String userProfile = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		userProfile = multi.getOriginalFileName("userProfile");
	}

		String dbURL = "jdbc:mysql://localhost:3306/Webkakao?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "0000";
		String SQL = "UPDATE USER SET userProfile = ? WHERE userID = ?";

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,userProfile);
		pstmt.setString(2,userID);
		int result = pstmt.executeUpdate();
		if (result > 0)
			out.println("<script>alert('프로필 사진 변경완료')</script>");
		response.sendRedirect("index.jsp");
	
%>

</body>
</html>