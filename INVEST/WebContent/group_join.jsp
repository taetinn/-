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
<table border=1>
<tr bgcolor="yellow">
<th>�׷��ȣ</th>
<th>�׷��</th>
<th>ȸ����</th>
<th>����</th>
</tr>

<%
//ȸ����!!!!!!
String m=request.getParameter("mno");
int mno=Integer.parseInt(m);
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171",
		"201412171");
PreparedStatement ss = conn.prepareStatement("select * from group1");
ResultSet rs = ss.executeQuery();
while(rs.next()){
	%>
	<tr>
	<td><%=rs.getInt("gno") %></td>
	<td><%=rs.getString("gname") %></td>
	<%
	PreparedStatement s=conn.prepareStatement("select * from g_follower where gno=?");
	s.setInt(1,rs.getInt("gno"));
	ResultSet r=s.executeQuery();
	int check=0;
	int m_num=0;
	while(r.next()){
		m_num++;
		if(mno==r.getInt("mno")){
			check++;
		}
	}
	%>
	<td><%=m_num %>��</td>
	<%
	
	r.close();
	s.close();
	if(check==0){
		%>
		<td><a href="insert_group.jsp?mno=<%=mno%>&gno=<%=rs.getInt("gno") %>">�����ϱ�</a></td>
		<%
	}
	%>
	
	<%
}

%>
</table>
<h1>���Ե� �׷�</h1><br/>
<table border=1>
<tr bgcolor="yellow">
<th>�׷��ȣ</th>
<th>�׷��</th>
<th>Ż��</th>
</tr>
<%
ss=conn.prepareStatement("select * from member natural join g_follower where mno=?");
ss.setInt(1,mno);
rs=ss.executeQuery();

while(rs.next()){
	PreparedStatement st=conn.prepareStatement("select * from group1 where gno=?");
    st.setInt(1,rs.getInt("gno"));
    ResultSet rt=st.executeQuery();
    while(rt.next()){
    	
    
	%>
	<tr>
	<td><%=rs.getInt("gno") %></td>
	
	<td><%=rt.getString("gname") %></td>
	<td><a href="group_out.jsp?mno=<%=mno%>&gno=<%=rs.getInt("gno")%>">Ż���ϱ�</a>
	</tr><%
    }
}
%>
</table>
<a href="front.jsp?mno=<%=mno%>">Ȩ���� ����</a>
</body>
</html>