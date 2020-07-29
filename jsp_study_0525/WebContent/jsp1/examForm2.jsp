<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>examForm2.jsp Page</h1>
	<hr>
	<!-- post에서 한글이 깨진다 왜? -> 취급하는 종류가 다양해서 문자처리에 대해 어떠한 문자에대하여 인코딩하는지가 빠져있음 -->
	<form action = "examProcess2.jsp" method = "post">
		이름 : <input type = "text" name = "name"><br>
		나이 : <input type = "number" name="age"><br>
		<input type = "submit" value = "전송">
	</form>
</body>
</html>