<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 로그인 상태유지 쿠키정보 가져오기
	Cookie[] cookies = request.getCookies();
	// name이 "id"인 쿠키객체 찾기
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
				String id = cookie.getValue();
				
				if (id != null) {
					// 로그인 인증(세션에 id값 추가)
					session.setAttribute("id", id);
					
					// id쿠키와 함께 main.jsp를 요청함
					response.sendRedirect("main.jsp");
				}
			}
		}
	}

%>


	<h1>로그인</h1>
	<hr>
	
	<form action="loginPro.jsp" method="post">
		아이디: <input type="text" name="id"><br>
		비밀번호: <input type="password" name="passwd"><br>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='joinForm.jsp'">
		<br>
		<input type="checkbox" name="keepLogin" value="true">로그인 상태 유지
	</form>

</body>
</html>





