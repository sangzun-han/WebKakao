<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
%>
<main class="chats">
    <div class="search-bar">
        <i class="fa fa-search"></i>
        <form action="#" method="GET">
            <input type="text" id="findID" placeholder="친구이름을 입력해주세요">
         </form>
    </div>
    <ul class="chats__list">
        <li class="chats__chat" id="friendResult">
            <a href="chat.jsp">
                <div class="chat__content">
                    <img src="./resources/images/avatar.jpg">
                    <div class="chat__preview">
                        <h3 class="chat__user">한상준</h3>
                        <span class="chat__last-message">:)</span>
                    </div>
                </div>
                <span class="chat__date-time">14:40</span>
            </a>
        </li>
    </ul>
    <div class="chat-btn">
        <i class="fa fa-comment"></i>
    </div>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>