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
	String id;
	String passwd;
	int	age;
	
	id = "cherry";
	passwd = "mypasswd";
	age= 20;
	
	out.println(id+"님의 비밀번호는"+passwd+"이고, ");
	out.println("나이는 "+age+"세 입니다.<br>");
	age = 25;
%>
<hr>
<%=id %>님의 비밀번호는 <%=passwd %>이고, 나이는 <%=age %>세 입니다.

</body>
</html>

