<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보수정완료</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
String m=request.getParameter("mno");
int mno=Integer.parseInt(m);
String j=request.getParameter("job");
String p=request.getParameter("password");

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171",
		"201412171");
PreparedStatement ss = conn.prepareStatement("update member set mjob=?,mpass=? where mno=?");

ss.setString(1,j);
ss.setString(2,p);
ss.setInt(3,mno);
ResultSet rs = ss.executeQuery();

rs.close();
ss.close();
conn.close();

%>
회원정보 수정 완료되었습니다.</br>
<a href="front.jsp?mno=<%=mno%>">홈으로 가기</a>
</body>
</html>