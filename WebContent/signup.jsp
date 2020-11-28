<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" class="css">
    <title>카카오톡</title>
    <link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>
	<fmt:setLocale value= '<%= request.getParameter("language") %>' />
	<fmt:setBundle basename="bundle.message" />
    <jsp:include page="header.jsp" />
    <%
    	request.setCharacterEncoding("utf-8");
    %>
    <div class = "signUpContainer">
        <div class = "logo">
            <a href = "login.jsp"><img src = "./resources/images/LOGO.jpg"></a>
        </div>
        <div class = "signUpDetail">
          <div class="lang">
        	<a class="find_lang" href="?language=ko"><span class="language">Korean／</span></a>
        	<a class="find_lang" href="?language=en"><span class="language"> English</span></a>
        </div>
            <form name="signupForm" method="GET" action="./signupAction.jsp">
            	<input type="text" placeholder="<fmt:message key="ID"/>" name="userID">	
                <input type="text" placeholder="<fmt:message key="Name"/>" name="userName" maxlength="10">
                <input type="password" placeholder="<fmt:message key="Password"/>" name="userPassword" required>
                <input type="password" placeholder="<fmt:message key="Repassword"/>" name="repassword" required>
                <input type="text" placeholder="<fmt:message key="Email"/>" name="userEmail">
                <button type="button" onclick="checkform();">회원가입</button>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
<script src="./resources/js/validation.js"></script>
</html>