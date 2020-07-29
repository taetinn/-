<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="fileupload_process.jsp" method="post" enctype="multipart/form-data">
		<p>제목: <input type="text" name="title"></p>
		<p>파일: <input type="file" name="filename"></p>
		<p><input type="submit" value="전송"></p>
	</form>

</body>
</html>






