<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>투자조회</title>
</head>
<body>
<table border=1>
<tr bgcolor="yellow">
<th>투자종목</th>
<th>투자명</th>
<th>현재자산</th>
<th>매도하기</th>
</tr>
<%
String m=request.getParameter("mno");
int mno=Integer.parseInt(m);
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171", "201412171");
PreparedStatement s=conn.prepareStatement("select * from investment natural join investment_category where mno=?");
s.setInt(1,mno);
ResultSet r=s.executeQuery();

int prese=0;
int mprese=0;
while(r.next()){
	%>
	<tr> <td><%=r.getString("CNAME")%></td> 
	<td><%=r.getString("INAME") %> </td> 
	<%PreparedStatement ss=conn.prepareStatement("select * from buy where ino=?");
	  ss.setInt(1,r.getInt("ino"));
	  ResultSet rr=ss.executeQuery();
	  while(rr.next()){
		  prese+=rr.getInt("bfunds");
	  }
	  ss=conn.prepareStatement("select * from sell where ino=?");
	  ss.setInt(1,r.getInt("ino"));
	  rr=ss.executeQuery();
	  while(rr.next()){
		  prese-=rr.getInt("sfunds");
	  }
	  mprese+=prese;
	  rr.close();
	  ss.close();
	%>
	<td><%=prese%> </td> 
	<td><a href="sell.jsp?ino=<%=r.getInt("INO")%>&mprese=<%=mprese%>&mno=<%=mno%>">매도하기</a></td>
	</tr>
	<%
}
prese=0;
r.close();
s.close();
conn.close();
%>
</table>
<br/>
총 자산은 <%=mprese %>원 입니다.<br/>
<a href="front.jsp?mno=<%=mno%>">홈으로 가기</a>
</body>
</html>