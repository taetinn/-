<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>탈퇴하기</title>
</head>
<body>
<%
String m=request.getParameter("mno");
String g=request.getParameter("gno");
int mno=Integer.parseInt(m);
int gno=Integer.parseInt(g);

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
	"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171", "201412171");
PreparedStatement ss=conn.prepareStatement("delete from g_follower where mno=? and gno=?");
ss.setInt(1,mno);
ss.setInt(2,gno);
ResultSet rs = ss.executeQuery();
ss=conn.prepareStatement("select * from group1 where gno=?");
ss.setInt(1,gno);
rs=ss.executeQuery();
rs.next();
%>[<%= rs.getString("gname")%>]그룹 탈퇴 완료하였습니다.<%
rs.close();
ss.close();
conn.close();
%>
<a href="front.jsp?mno=<%=mno%>">홈으로 가기</a>
</body>
</html>