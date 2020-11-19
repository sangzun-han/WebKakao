<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<main class="profile">
    <header class="profile__header">
        <div class="profile__header-container">
            <img src="./resources/images/avatar.jpg" alt="">
            <h3 class="profile__header-title">한상준</h3>
        </div>
    </header>
    <div class="profile__container">
        <input type="text" placeholder="이메일">
        <div class="profile__actions">
            <div class="profile__action">
                    <span class="profile__action-circle">
                        <i class="fa fa-comment fa-lg"></i>
                    </span>
                <span class="profile__action-title">채팅방</span>
            </div>
            <div class="profile__action">
                    <span class="profile__action-circle">
                        <i class="fa fa-pencil fa-lg"></i>
                    </span>
                <span class="profile__action-title">프로필 수정</span>
            </div>
        </div>
    </div>
</main>
<div class="bigScreenText">
    <span>브라우저의 가로폭을 줄여주세요!</span>
</div>
</body>

</html>