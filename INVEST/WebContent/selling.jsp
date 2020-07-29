<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>매도확인</title>
</head>
<body>
<%
String in=request.getParameter("ino");
String se=request.getParameter("sell");
String mno=request.getParameter("mno");
int ino=Integer.parseInt(in);
int sell=Integer.parseInt(se);
java.text.DateFormat dateFormat =
new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
String date = dateFormat.format(new java.util.Date());

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171", "201412171");
PreparedStatement s = conn.prepareStatement("select * from sell where ino=?");
s.setInt(1, ino);
ResultSet r = s.executeQuery();
int max = 0;
while (r.next()) {
	max++;
}
max++;
s=conn.prepareStatement("insert into sell values(?,?,?,?)");
s.setInt(1,max);//sno
s.setInt(2,ino);
s.setString(3,date);
s.setInt(4,sell);
r=s.executeQuery();

%>
완료 되었습니다.
<a href="front.jsp?mno=<%=mno%>">홈으로 가기</a>

</body>
</html>