<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<h1>회원가입</h1>
	<hr>
	
	<form action="joinPro.jsp" method="post">
		아이디: <input type="text" name="id"><br>
		비밀번호: <input type="password" name="passwd"><br>
		비밀번호 확인: <input type="password" name="passwd2"><br>
		이름: <input type="text" name="name"><br>
		나이: <input type="number" name="age" min="0" max="150"><br>
		성별: <input type="radio" name="gender" value="남">남자
		      <input type="radio" name="gender" value="여">여자<br>
		이메일: <input type="email" name="email"><br>
		<input type="submit" value="회원가입">
	</form>

</body>
</html>






