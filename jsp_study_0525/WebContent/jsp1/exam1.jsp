<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file = "colors.jspf" %>
<body bgcolor="<%=bgColors%>">
<%-- @지시어 : jsp에 있는 내용이 그대로 복붙 됨--%>
	<%@include file="top.jsp" %>

<%
//스크립틀릿(scriptlet)영역
// 순수 자바 영역
	System.out.println("on the console");
	out.println("브라우저에 출력<br>");
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	String strDate = sdf.format(date);
%>
브라우저에 출력<br>
<%=strDate %><br>

<%String str= "문자열"; %>
<%=str %>
	<%@include file="bottom.jsp" %>

</body>
</html>