<%@page import="exam.domain.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
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
	// num   pageNum  파라미터 가져오기
	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
%>

	<h1>게시판 글 수정 사용자 확인</h1>
	<hr>
	
	<form action="updateUserCheckPro.jsp" method="post">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name="num" value="<%=num %>">
		비밀번호: <input type="password" name="passwd"><br>
		<input type="submit" value="비밀번호 확인">
	</form>
	
</body>
</html>




