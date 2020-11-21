<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<meta charset="UTF-8">
<jsp:useBean id="user" class="user.User" scope="application" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userProfile" />

	<%
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if (userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result > 0) {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}
	
	%>