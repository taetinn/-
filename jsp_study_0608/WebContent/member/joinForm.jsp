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
		비밀번호: <input id="passwd" type="password" name="passwd"><br>
		비밀번호 확인: <input onkeyup="alert('aaa');" id="passwd2" type="password" name="passwd2">
		<span id="passwdMessage"></span>
		<br>
		
		이름: <input type="text" name="name"><br>
		나이: <input type="number" name="age" min="0" max="150"><br>
		성별: <input type="radio" name="gender" value="남">남자
		      <input type="radio" name="gender" value="여">여자<br>
		이메일: <input type="email" name="email"><br>
		<input type="submit" value="회원가입">
	</form>
	
	
	<script>
		// 문서객체(document)
		var passwd = document.getElementById('passwd');
		var passwd2 = document.getElementById('passwd2');
		var spanMessage = document.getElementById('passwdMessage');
		
		passwd2.onkeyup = function () {
			
			alert('aaa');
			
			console.log('키 눌렀다 떼어짐..');
			
			if (passwd.value != passwd2.value) {
				spanMessage.innerHTML = '패스워드 불일치..';
			} else {
				spanMessage.innerHTML = '패스워드 일치함!';
			}
		};
	</script>
</body>
</html>






