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
<main class="friends">
  <div class="search-bar">
    <i class="fa fa-search"></i>
    <form action="" method="GET">
      <input type="search" placeholder="검색">
    </form>
  </div>
  <section class="friends__section">
    <header class="friends__section-header">
      <h6 class="friends__section-title"></h6>
    </header>
    <div class="friends__section-rows">
      <div class="friends__section-row">
        <img src="./resources/images/avatar.jpg" alt="">
        <a href="profile.jsp" class="fiends__section-name">
          한상준
        </a>
      </div>
      <!-- <div class="friends__section-row">
          <img src="images/avatar.jpg">
          <span class="friends__section-name">Friends' Names Display</span>
      </div> -->
    </div>
  </section>
  <section class="friends__section">
    <header class="friends__section-header">
      <h6 class="friends__section-title">친구</h6>
    </header>
    <div class="friends__section-rows">
      <div class="friends__section-row">
        <div class="friends__section-column">
          <img src="./resources/images/avatar.jpg">
          <span class="friends__section-name">한상준</span>
        </div>
        <div class="friends__section-tagline">
          이거지
        </div>
      </div>
    </div>
  </section>
  <jsp:include page="footer.jsp" />
</main>

</body>

</html>
