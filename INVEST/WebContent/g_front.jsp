<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�׷�����</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		int mno = 0;

		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171",
				"201412171");
		PreparedStatement ss = conn.prepareStatement("select * from member where MID=?");
		ss.setString(1, id);
		ResultSet rs = ss.executeQuery();
		while (rs.next()) {
			if (pass.equals(rs.getString("mpass"))) {
				mno=rs.getInt("mno");
	%>
	�α��� ���� �Ͽ����ϴ�.
	<br>
	<a href="group_join.jsp?mno=<%=mno%>">�׷�����</a>
	<br/>
	<a href="g_invest.jsp?mno=<%=mno%>">�׷������ϱ�</a>
	<br>
	<a href="g_in_f.jsp?mno=<%=mno%>">�׷�������ȸ</a>
	<br>
	<%
		} else {
	%>
	�α��� �����Ͽ����ϴ�.
	<br>
	<a href="gglogin.jsp">�α����ϱ�</a>
	<br>
	<%
		}

		}
	%>
</body>
</html>