<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>자산관리시스템</title>
</head>
<body>
<%
String m=request.getParameter("mno");
%>
<a href="member_up.jsp?mno=<%=m%>">회원정보</a><br/>
<a href="group_join.jsp?mno=<%=m%>">그룹정보</a><br/>
<a href="invest.jsp?mno=<%=m%>">개인투자</a><br/>
<a href="g_in_ff.jsp?mno=<%=m%>">그룹투자</a><br/>
<a href="iilogin.jsp">로그아웃</a>
</body>
</html>