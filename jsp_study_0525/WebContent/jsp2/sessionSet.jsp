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
	//set Session value
	session.setAttribute("name", "홍길동"); // value generate
/* same key, different obj == value modify */	
//	session.setAttribute("name", "성춘향"); //value edit
%>

<script>
	alert('session value has been set.');
	location.href='sessionExam.jsp';
</script>

</body>
</html>