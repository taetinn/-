<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %> 
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�׷�������ȸ</title>
</head>
<body>
<h1>���� ������ �׷�������Ȳ</h1><br/>
<table border=1>
<tr bgcolor="yellow">
<th>�׷��</th>
<th>��������</th>
<th>���ڸ�</th>
<th>���ڻ�</th>
<th>���ڻ�</th>
<th>����</th>
</tr>
<%
DecimalFormat df=new DecimalFormat("#.####");


String m=request.getParameter("mno");
int mno=Integer.parseInt(m);
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171", "201412171");
PreparedStatement ss=conn.prepareStatement("select * from member natural join g_follower where mno=?");

ss.setInt(1,mno);
ResultSet rs = ss.executeQuery();
while(rs.next()){
	PreparedStatement s=conn.prepareStatement("select * from group1 where gno=?");
	s.setInt(1,rs.getInt("gno"));
	ResultSet r=s.executeQuery();
	String gname="";
	while(r.next()){
		gname=r.getString("gname");
	
	}
	s=conn.prepareStatement("select * from (g_investment natural join investment_category) natural join g_dividend where gno=? and mno=?");
	s.setInt(1,rs.getInt("gno"));
	s.setInt(2,rs.getInt("mno"));
	r=s.executeQuery();
	double prese=0;
	while(r.next()){
		%>
		<tr>
		<td><%=gname %></td>
		<td><%=r.getString("cname") %></td>
		<td><%=r.getString("giname") %></td>
		
		<% 
		PreparedStatement st=conn.prepareStatement("select * from g_buy where gino=?");
		  st.setInt(1,r.getInt("gino"));
		  ResultSet rr=st.executeQuery();
		  while(rr.next()){
			  prese+=rr.getInt("gbfunds");
		  }
		  st=conn.prepareStatement("select * from g_sell where gino=?");
		  st.setInt(1,r.getInt("gino"));
		  rr=st.executeQuery();
		  while(rr.next()){
			  prese-=rr.getInt("gsfunds");
		  }
		  %>
		  <td><%=(int)prese%></td>
		  <% 
		  st=conn.prepareStatement("select * from g_dividend where mno=? and gino=?");
		  st.setInt(1,mno);
		  st.setInt(2,r.getInt("gino"));
		  rr=st.executeQuery();
		  while(rr.next()){
			  double sts=rr.getDouble("gmfunds")/prese;
			  String stss=df.format(sts);
			  %>
			  <td><%=rr.getInt("gmfunds") %></td>
			  <td><%=stss%></td>
			  </tr>
			  <%
			  prese=0;
		  }
		
		//�׷��ڱ� ���ڱ� �ŵ��ϱ�
		//�׷��ڱ�:g_buy���̺��� funds�� ���ѱݾ׿��� sell���̺��� funds �� �� �ݾ�
		//���ڱ�:gmfunds
	}
	%>
	<%
}
%>
</table>
<h1>���Ե� �׷��� ���� ��Ȳ</h1><br/>
<%
//ss,rs
ss=conn.prepareStatement("select * from g_follower where mno=?");
ss.setInt(1,mno);
rs=ss.executeQuery();
while(rs.next()){
	PreparedStatement s=conn.prepareStatement("select * from group1 where gno=?");
	s.setInt(1,rs.getInt("gno"));
	ResultSet r=s.executeQuery();
	r.next();
	%>
	<h3><font color="blue"><%=r.getString("gname") %> �׷��� ���� ��Ȳ</font></h3>
	<table border=1>
	<tr>
	<th>����</th>
	<th>���ڸ�</th>
	<th>���ڻ�</th>
	</tr>
	<%
	s=conn.prepareStatement("select * from g_investment natural join investment_category where gno=?");
	s.setInt(1,rs.getInt("gno"));
	r=s.executeQuery();
	while(r.next()){
		int prese=0;
		PreparedStatement stt=conn.prepareStatement("select * from g_investment natural join g_dividend where gno=? and gino=?");
		stt.setInt(1,rs.getInt("gno"));
		stt.setInt(2,r.getInt("gino"));
		ResultSet rtt=stt.executeQuery();
		while(rtt.next()){
			prese+=rtt.getInt("gmfunds");
		}
	%>
	<tr>
	<td><%=r.getString("cname") %></td>
	<td><%=r.getString("giname") %></td>
	<td><%=prese %></td>
	</tr>
	<%
	prese=0;
	}
	%></table><%
}
%>
<br/><br/><br/><br/>
<a href="front.jsp?mno=<%=mno%>">Ȩ���� ����</a>
</body>
</html>