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
	//세션값 한개삭제
	session.removeAttribute("name");
%>
<script>
	alert('session value has been deleted.');
	location.href = 'sessionExam.jsp';
</script>
</body>
</html>