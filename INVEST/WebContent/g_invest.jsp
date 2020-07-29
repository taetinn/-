<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>그룹 투자</title>
</head>
<body>
<br>
<%String m=request.getParameter("mno"); %>
<form action="insert_g_invest.jsp?mno=<%=m %>" method="post">
그룹선택:
<%
int mno=Integer.parseInt(m);
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
	"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171", "201412171");
PreparedStatement ss=conn.prepareStatement("select * from member natural join g_follower where mno=?");

ss.setInt(1,mno);
ResultSet rs = ss.executeQuery();
%>
<%
while(rs.next()){
	PreparedStatement st=conn.prepareStatement("select * from group1 where gno=?");
    st.setInt(1,rs.getInt("gno"));
    ResultSet rt=st.executeQuery();
    while(rt.next()){
    	%>
    	<%=rt.getString("gname") %><input type="radio" name="gno" value="<%=rt.getString("gno") %>">
    	
    	<%
    }
   	rt.close();
   	st.close();
}
%>
<br/>
투자종목:
<%
ss=conn.prepareStatement("select * from investment_category");
rs = ss.executeQuery();
	while(rs.next()){
	%>
	<%=rs.getString("cname") %><input type="radio" name="ica" value="<%=rs.getString("cno")%>">
	<% }
	rs.close();
	ss.close();
	conn.close();
	%><br>
투자명:<INPUT TYPE="TEXT" NAME="iname">
매수자금:<INPUT TYPE="TEXT" NAME="ibuy">
<input type="submit" value="투자">
</form>
</body>
</html>