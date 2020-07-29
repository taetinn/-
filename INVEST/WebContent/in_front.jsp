<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>자산관리시스템</title>
</head>
<body>
<%String id=request.getParameter("id");
String pass=request.getParameter("pass");


Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
	"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171", "201412171");
PreparedStatement ss=conn.prepareStatement("select * from member where MID=?");
ss.setString(1,id);
ResultSet rs = ss.executeQuery();
while(rs.next()){
	if(pass.equals(rs.getString("mpass"))){
	%>
	로그인 성공 하였습니다.<br>
	<a href="front.jsp?mno=<%=rs.getInt("mno")%>">홈으로가기</a><br>
	<% }
	else{
		%>
		로그인 실패하였습니다.<br>
		<a href="iilogin.jsp">로그인하기</a><br>
	<% }
	
}
rs.close();
ss.close();
conn.close();
%>
</body>
</html>