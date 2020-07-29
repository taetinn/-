<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<hr>
	<form action="sessionLoginPro.jsp" method = "post">
		ID : <input type= "text" name="id"><br>
		PW : <input type = "password" name = "passwd"><br>
		<button type = "submit">login</button>
	</form>
</body>
</html>