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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" class="css">
  <title>카카오톡</title>
  <link rel="stylesheet" href="./resources/css/style.css">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>
	<jsp:include page="header.jsp" />
	<%
		request.setCharacterEncoding("utf-8");
		
		String userID = null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
				
		ArrayList<UserDTO> Specificuser = new UserDAO().getSpecificUserInfo(userID); //내 정보
		ArrayList<UserDTO> Userinfo = new UserDAO().getUserInfo(); // 모든 유저정보
	%>
	<div class="search-bar">
        <form action="#" method="POST">
            <input type="text" id="findID" placeholder="친구아이디를 입력해주세요">
            <input type="button" value="검색" onclick="findFunction();"/>
         </form>
    </div>
	<main class="friends">
	  <section class="friends__section">
	    <header class="friends__section-header">
	      <h6 class="friends__section-title"></h6>
	    </header>
	    <div class="friends__section-rows">	
	    <%	
	    	if (userID == null) {	
	    %>
	      <div class="friends__section-row">
	        <img src="./resources/images/avatar.jpg" alt="">
	        <a href="./login.jsp" class="fisends__section-name">로그인을 해주세요.</a>
	      </div>
	      <%
	    	} else {	
	      %>
	      <div class="friends__section-row">
	      	<%
	      		for (int i=0; i<Specificuser.size(); i++){
	      			if (Specificuser.get(i).getUserProfile()==null) {
	      	%>
	      	<img src="./resources/images/avatar.jpg" alt=""> 
	      	<a href="./profile.jsp" class="fiends__section-name">
			<%= Specificuser.get(i).getUserID() %>	
	      	<%
	      		} else {
	      	%>
	      	</a>
	        <img src="./resources/images/<%= Specificuser.get(i).getUserProfile() %>" alt="사진">
	        <a href="./profile.jsp" class="fiends__section-name">
			<%= Specificuser.get(i).getUserID() %>	
			<%
	    		}
			%>
	        </a>
	      </div>
	    </div>  
	    <%
	    	}
	    %>
	    <%
	    	}
	    %>
	  </section> 
	  <section class="friends__section">
	  	<header class="friends__section-header">
	  		<h6 class="friends__section-title">검색 친구</h6>
		</header>
	    <div class="friends__section-rows">
	    	<div class="friends__section-row">
	        	<div id="friendResult" class="friends__section-column">
	         		
	      	 	</div>
	     	 </div>
	   </div>
	 </section>
	  <section class="friends__section">
	  <br>	
	    <header class="friends__section-header">
	      <h6 class="friends__section-title">유저목록</h6>
	    </header>
	    <%
	    	for (int i=0; i<Userinfo.size(); i++){
	    		if (Userinfo.get(i).getUserProfile()==null) {
	    %>
	    <div class="friends__section-rows">
	      <div class="friends__section-row">
	        <div class="friends__section-column">
	      	  <img src="./resources/images/avatar.jpg" alt="">
	      	  <span class="friends__section-name"><%= Userinfo.get(i).getUserID() %></span>
	      	
	      	<%
	      		} else {
	      	%>
	      	<div class="friends__section-rows">
	      		<div class="friends__section-row">
	        		<div class="friends__section-column">
	          			<img src="./resources/images/<%= Userinfo.get(i).getUserProfile() %>">
	          			<span class="friends__section-name"><%= Userinfo.get(i).getUserID() %></span>
	        <%
	      		}
	        %>
	        </div>
	        <div class="friends__section-tagline">
	          <a href="./chat.jsp?toID=<%= Userinfo.get(i).getUserID() %>">대화하기</a>
	        </div>  
	      			</div>
	      		</div>
	     	</div>
	      </div>
	    </div> 
	       <%
			}
	      %>
	  </section>
	  <jsp:include page="footer.jsp" />
	</main>
</body>
<script type="text/javascript">
	function findFunction(){
		var userID = $('#findID').val();
		$.ajax({
			type : 'POST',
			url : './UserFindServlet',
			data : { userID : userID },
			success : function(result){
				if (result == -1){
					failFriend();
				}
				else{
					var data = JSON.parse(result);
					var profile = data.userProfile;
					getFriend(userID, profile);	
				} 
					
				}
			});
	}
	function getFriend(findID,userProfile) {
			$('#friendResult').html('<img src="' + userProfile + '">' +
				'<span class="friends__section-name">' +
				findID +
				'</span>' +
				'</div>' +
				'<div class="friends__section-tagline" style="margin-left:8px;">' +
				'<a href="./chat.jsp?toID=' + encodeURIComponent(findID) + '">' +
				'대화하기' +
				'</a>' +
				'</div>'
				);
		
	}
	function failFriend() {
		alert("검색한 친구가 존재하지 않습니다.")
		$('#friendResult').html('');
	}
	
</script>
</html>
