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
	<form action = "examProcess3.jsp" method = "post">
		이름 : <input type = "text" name = "name"><br>
		<!-- radio는 선택만으로 값을 입력한 것으로 취급하므로, value값이 필수적이다. -->
		성별 : <input type = "radio" name = "gender" value = "남" checked ="checked">남자 
		 	 <input type = "radio" name = "gender" value = "여">여자
		<br>
		직업:
		<select name = "job"> <!-- 복수선택 가능 : multiple --> 
			<option value = "학생">학생</option>
			<option value = "회사원">회사원</option>
			<option value = "기타">기타</option>
		</select>
		<br>
		취미:
		<input type = "checkbox" name = "hobby" value = "여행">여행 
		<input type="checkbox" name="hobby" value="게임">게임
		<input type = "checkbox" name = "hobby" value = "야구">야구
		<br>
		<input type = "submit" value = "전송" >
	</form>
</body>
</html>