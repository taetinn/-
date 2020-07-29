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
	String str = " Server Page";	
	%>
	
	<%!
	String str1 = "Java"; // 전역변수
	
	public String show() { // 메소드 정의
		return str1;
	}
	%>
	
	<%=show() %><br>
	<%=str %><br>
	
</body>
</html>


