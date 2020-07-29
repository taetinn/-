<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="fileupload01_process.jsp" method = "post" enctype="multipart/form-data"> <!-- enctype 무조건 저 값으로 넣어ㄴ줘야함 -->
		<p>name : <input type= "text" name = "name"></p>
		<p>title : <input type= "text" name = "subject"></p>
		<p>file : <input type= "file" name = "filename"></p>
		<p><input type = "submit" value = "upload"></p>
	</form>
</body>
</html>