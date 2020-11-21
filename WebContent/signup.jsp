<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <jsp:include page="header.jsp" />
    <%
    	request.setCharacterEncoding("utf-8");
    %>
    <div class = "signUpContainer">
        <div class = "logo">
            <a href = "signin.jsp"><img src = "./resources/images/LOGO.jpg"></a>
        </div>
        <div class = "signUpDetail">
            <form name="signupForm" method="POST" action="./signupAction.jsp">
            	<input type="text" placeholder="아이디" name="userID">	
                <input type="text" placeholder="이름" name="userName" maxlength="10">
                <input type="password" placeholder="비밀번호" name="userPassword" required>
                <input type="password" placeholder="비밀번호 재입력" name="repassword" required>
                <input type="text" placeholder="이메일" name="userEmail">
                <button type="button" onclick="checkform()">회원가입</button>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
<script src="./resources/js/validation.js"></script>
</html>