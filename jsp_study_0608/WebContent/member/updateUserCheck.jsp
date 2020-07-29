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
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp로 이동
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
%>
	<h1>회원정보 수정 사용자 확인</h1>
	<hr>
	
	<form action="updateUserCheckPro.jsp" method="post">
		<!-- hidden 타입 input태그로 사용자 눈에 안보이게 전송 -->
		<input type="hidden" name="id" value="<%=id %>">
		비밀번호: <input type="password" name="passwd"><br>
		<input type="submit" value="비밀번호 확인">
	</form>
	
</body>
</html>




