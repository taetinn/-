<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ڻ�����ý���</title>
</head>
<body>
<%
String m=request.getParameter("mno");
%>
<a href="member_up.jsp?mno=<%=m%>">ȸ������</a><br/>
<a href="group_join.jsp?mno=<%=m%>">�׷�����</a><br/>
<a href="invest.jsp?mno=<%=m%>">��������</a><br/>
<a href="g_in_ff.jsp?mno=<%=m%>">�׷�����</a><br/>
<a href="iilogin.jsp">�α׾ƿ�</a>
</body>
</html>