<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<main class="find">
    <section class="find__options">
        <div class="find__option">
            <i class="fa fa-address-book fa-lg"></i>
            <span class="find__option-title">친구추가</span>
        </div>
        <div class="find__option">
            <i class="fa fa-qrcode fa-lg"></i>
            <span class="find__option-title">QR 코드</span>
        </div>
        <div class="find__option">
            <i class="fa fa-mobile fa-lg"></i>
            <span class="find__option-title">전화</span>
        </div>
        <div class="find__option">
            <i class="fa fa-envelope-o fa-lg"></i>
            <span class="find__option-title">문자</span>
        </div>
    </section>
    <section class="find__recommended">
        <header>
            <h6 class="recommended__title">추천 친구</h6>
        </header>
        <div class="recommended__none">
            <span class="recommended__text">추천친구가 없습니다.</span>
        </div>
    </section>
</main>
<jsp:include page="footer.jsp" />
</body>

</html>