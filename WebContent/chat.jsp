<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" class="css">
    <title>카카오톡</title>
    <link rel="stylesheet" href="./resources/css/style.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>
<jsp:include page="header.jsp" />

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		String toID = null;
		if (request.getParameter("toID") != null) {
			toID = (String) request.getParameter("toID");
		}
	%>
<main class="chat">
    <div class="date-divider">
        <span class="date-divider__text">Wednesday, August 2, 2017</span>
    </div>
    <div class="chat__message chat__message-from-me">
        <span class="chat__message-time">17:55</span>
        <span class="chat__message-body">
                Hello~! This is my message.
            </span>
    </div>
    <div class="chat__message chat__message--to-me">
        <img src="./resources/images/avatar.jpg" class="chat__message-avatar">
        <div class="chat__message-center">
            <h3 class="chat__message-username">Emma</h3>
            <span class="chat__message-body">
                    Reply.
                </span>
        </div>
        <span class="chat__message-time">18:55</span>
    </div>
</main>
<div class="type-message">
    <div class="type-message__input">
        <input type="text" id="chatContent">
        <button type="button" onclick="submitFunction();">전송</button>
    </div>
</div>
<div class="bigScreenText">
    <span>브라우저의 가로폭을 줄여주세요!</span>
</div>

</body>
	<script type="text/javascript">
	function submitFunction(){
		var fromID = '<%=userID%>';
		var toID = '<%=toID%>';
		var chatContent = $('#chatContent').val();
		$.ajax({
			type : 'POST',
			url : './chatSubmitServlet',
			data : {
				fromID : encodeURIComponent(fromID),
				toID : encodeURIComponent(toID),
				chatContent : encodeURIComponent(chatContent)
			},
			success: function(result){
				if(result == 1) {
					alert('성공');
			} else if(result == 0){
					alert('오류');
				}else{
					alert('실패');
				}
			}
		});
		$('#chatContent').val("");
	}
	</script>
</html>