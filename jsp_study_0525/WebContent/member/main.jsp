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
	String id = (String) session.getAttribute("id");

	// 세션값 없으면 loginForm.jsp 으로 이동
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
	
%>


	<h1>메인 페이지</h1>
	<hr>
	
	<%=id %>님이 로그인 하셨습니다. 
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	<br>
	
	<a>회원정보 조회</a><br>
	<a>회원정보 수정</a><br>
	<a>회원정보 삭제</a><br>
	
	<a>전체 회원목록</a><br>
<%= id %>
</body>
</html>