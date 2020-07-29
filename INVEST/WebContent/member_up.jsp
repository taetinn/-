<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보</title>
</head>
<body>
<%
String m=request.getParameter("mno");
int mno=Integer.parseInt(m);
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171",
		"201412171");
PreparedStatement ss = conn.prepareStatement("select * from member where mno=?");
ss.setInt(1,mno);
ResultSet rs = ss.executeQuery();
rs.next();

%>
이름 : <%=rs.getString("mname")%> <br/>
아이디 : <%=rs.getString("mid")%> <br/>
가입날짜 : <%=rs.getString("mdate") %><br/>
<form action="member_update.jsp?mno=<%=mno%>" method="post">

직업<INPUT TYPE="TEXT" NAME="job" value="<%=rs.getString("mjob")%>"><P>
비밀번호<INPUT TYPE="TEXT" NAME="password" value="<%=rs.getString("mpass")%>" ><P>
<INPUT TYPE="SUBMIT" VALUE="수정">

</form><br/>
<a href="mem_out.jsp?mno=<%=mno%>">탈퇴하기</a><br/>
<a href="front.jsp?mno=<%=mno%>">홈으로 가기</a>
</body>
</html>