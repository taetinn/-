<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
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
�̸� : <%=rs.getString("mname")%> <br/>
���̵� : <%=rs.getString("mid")%> <br/>
���Գ�¥ : <%=rs.getString("mdate") %><br/>
<form action="member_update.jsp?mno=<%=mno%>" method="post">

����<INPUT TYPE="TEXT" NAME="job" value="<%=rs.getString("mjob")%>"><P>
��й�ȣ<INPUT TYPE="TEXT" NAME="password" value="<%=rs.getString("mpass")%>" ><P>
<INPUT TYPE="SUBMIT" VALUE="����">

</form><br/>
<a href="mem_out.jsp?mno=<%=mno%>">Ż���ϱ�</a><br/>
<a href="front.jsp?mno=<%=mno%>">Ȩ���� ����</a>
</body>
</html>