
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="colors.jspf" %>
<body bgcolor="<%=bgColor2 %>">
	<%-- 
	@지시어 
	jsp에 있는 내용이 그대로 복사 붙여넣기 되는 방식
	--%>
	<%@include file="top.jsp" %>


	<!-- html 주석 -->
	<%-- jsp 주석 --%>
	
	<% 
	// 스크립틀릿(Scriptlet) 영역 - 자바코드 영역
	
	// 자바 한줄 주석
	/*
	   자바 여러줄 주석
	*/
	
	System.out.println("서버 콘솔에 출력");
	out.println("브라우저에 출력<br>");
	
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 a HH시 mm분 ss초");
	String strDate = sdf.format(date);
	//out.println(strDate + "<br>");	
	%>
	브라우저에 출력2<br>
	<%=strDate %><br>
	
	<%
	String str = "문자열";
	%>
	<%=str %><br>
	
	<%@include file="bottom.jsp" %>
</body>
</html>