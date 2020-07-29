<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>그룹투자</title>
</head>
<body>
<%
String m=request.getParameter("mno");
%>
<a href="g_invest.jsp?mno=<%=m%>">그룹투자하기</a>
	<br>
	<a href="g_in_f.jsp?mno=<%=m%>">그룹투자조회</a>
	<br>
</body>
</html>