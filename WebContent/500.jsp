<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" class="css">
  <title>카카오톡</title>
  <link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>
	<%
		response.setStatus(HttpServletResponse.SC_OK);
	%>
	
	<jsp:include page="header.jsp" />
	<section class="find__recommended">
        <header>
            <h6 class="recommended__title">500</h6>
        </header>
        <div class="recommended__none">
            <span class="recommended__text">오류가 발생했습니다. 요청사항을 수행할 수 없습니다.</span>
        </div>
    </section>
	<jsp:include page="footer.jsp" />
</body>
</html>