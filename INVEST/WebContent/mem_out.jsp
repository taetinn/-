<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� Ż��</title>
</head>
<body>
<%
String m=request.getParameter("mno");
int mno=Integer.parseInt(m);
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171",
		"201412171");
PreparedStatement ss = conn.prepareStatement("delete from member where mno=?");
ss.setInt(1,mno);
ResultSet r=ss.executeQuery();
r.close();
ss.close();
conn.close();
%>
Ż�� �Ϸ� �Ǿ����ϴ�.<br/>
<a href="iilogin.jsp">Ȩ���� ����</a>
</body>
</html>