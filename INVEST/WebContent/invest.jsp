<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String m=request.getParameter("mno");
%>
<a href="investment.jsp?mno=<%=m%>">�����ϱ�</a><br>
<a href="invest_f.jsp?mno=<%=m %>">������ȸ</a><br>
</body>
</html>