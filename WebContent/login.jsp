<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<main class="more">
	<%
		request.setCharacterEncoding("utf-8");

		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		ArrayList<UserDTO> Specificuser = new UserDAO().getSpecificUserInfo(userID); //내 정보
	%>
    	<%
        	if (userID == null) {		
       	%>
       	<header class="more__header">
        <div class="more-header__column">
            <img src="./resources/images/avatar.jpg">
            <div class="more-header__info">
                <h3 class="more-header__title">로그인을 해주세요</h3>
                <span class="more-header__subtitle">로그인을 해주세요</span>
            </div>
        </div>
        <i class="fa fa-comment-o fa-2x"></i>
   		</header>
	  	<section class="more__plus-friends">
	  	<header class="plus-friends__header">
	  		<span></span>
	        <span class="plus-friends__learn-more">
	        	<a href="signup.jsp"><i class="fa fa-info-circle"></i>
	            <span>회원가입</span></a>
	        </span>
	    </header>
	    </section>
	    <section class = "signInDetail">
	        <form method="POST" action="./loginAction.jsp">
	            <input type="text" placeholder="아이디" name=userID maxlength="10" minlength="2" required>
	            <input type="password" placeholder="비밀번호" name="userPassword" required>
	            <button type="signIn">로그인</button>
	        </form>
	    </section>
        	<%
        		} else {
        	%>
        	<%
        		for (int i=0; i<Specificuser.size(); i++){
			%>
        <header class="more__header">
        <div class="more-header__column">
        	<img src="./resources/images/avatar.jpg">
           	<div class="more-header__info">
	           	<h3 class="more-header__title"><%= Specificuser.get(i).getUserName() %></h3>
	           	<span class="more-header__subtitle"><%= Specificuser.get(i).getUserEmail() %></span>
           	</div>
   		</div>
		   	<%
				}
		   	%>
        <a class="logout" href="./logout.jsp"><span class="logout_font">로그아웃</span></a>
        <%
        	}
        %>
        </header>
</main>
<jsp:include page="footer.jsp" />
</body>

</html>