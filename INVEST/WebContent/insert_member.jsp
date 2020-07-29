<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 완료</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171", "201412171");
	request.setCharacterEncoding("euc-kr");
	String nn=request.getParameter("name");
	String jj=request.getParameter("job");
	String ii=request.getParameter("id");
	String pp=request.getParameter("password");
	
	java.text.DateFormat dateFormat =
			new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String date = dateFormat.format(new java.util.Date());

	
	PreparedStatement ss=conn.prepareStatement("select * from member");
	ResultSet rs = ss.executeQuery();
	int max=0;
	while(rs.next())
		max++;
	max++;
	ss= conn.prepareStatement(
			" insert into MEMBER values (?,?,?,?,?,?)");
	ss.setInt(1,max);
	ss.setString(2,nn);
	ss.setString(3,date);
	ss.setString(4,jj);
	ss.setString(5,ii);
	ss.setString(6,pp);
	ss.executeUpdate();
	
	//ResultSet rs = st.executeQuery();
	//while(rs.next()) {}
	rs.close();
	ss.close();
	conn.close();%>
	<%=nn %>님 회원가입 완료 되었습니다!<br>
<a href="iilogin.jsp">로그인 하러 가기</a>

</body>
</html>