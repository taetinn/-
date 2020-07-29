<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>매도하기</title>
</head>
<body>
<%
String mm=request.getParameter("mno");
String i=request.getParameter("ino");
String m=request.getParameter("mprese");
int ino=Integer.parseInt(i);
int mprese=Integer.parseInt(m);
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171", "201412171");
PreparedStatement s=conn.prepareStatement("select * from investment natural join investment_category where ino=?");
s.setInt(1,ino);
ResultSet r=s.executeQuery();
while(r.next()){
	%><%=r.getString("cname") %>
	<%=r.getString("iname") %>
	매도가능금액:<%=m %>
	<%
}
r.close();
s.close();
conn.close();

%>
<form action="selling.jsp?ino=<%=ino %>&mno=<%=mm %>" method="post">
매도금액:<input type="text" name="sell">
<input type="submit" value="매도하기">
</form>
</body>
</html>