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
	// 변수선언
	// 문자열 id    문자열 passwd   정수형 age
	// 값넣기 "myid"       "mypasswd"      20
	String id = "myid";
	String passwd = "mypasswd";
	int age = 20;
	
	// 브라우저 출력
	// id님의 비밀번호는 passwd이고,
	// 나이는 age세 입니다.
	out.println(id + "님의 비밀번호는 " + passwd + "이고,<br>");
	out.println("나이는 " + age + "세 입니다.<br>");
	%>
	
	<hr>
	
	<%=id %>님의 비밀번호는 <%=passwd %>이고,<br>
	나이는 <%=age %>세 입니다.<br>


</body>
</html>







