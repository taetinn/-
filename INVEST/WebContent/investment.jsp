<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
</head>
<body>
<br>
<%String m=request.getParameter("mno"); %>
<form action="insert_invest.jsp?mno=<%=m %>" method="post">
��������:
<%
Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171", "201412171");
PreparedStatement ss=conn.prepareStatement("select * from investment_category");
	ResultSet rs = ss.executeQuery();
	while(rs.next()){
	%>
	<%=rs.getString("cname") %><input type="radio" name="ica" value="<%=rs.getString("cno")%>">
	<% }%><br>
���ڸ�:<INPUT TYPE="TEXT" NAME="iname">
�ż��ڱ�:<INPUT TYPE="TEXT" NAME="ibuy">
<input type="submit" value="����">
</form>
</body>
</html>