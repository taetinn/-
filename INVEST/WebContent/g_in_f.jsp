<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %> 
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>그룹투자조회</title>
</head>
<body>
<h1>내가 참여한 그룹투자현황</h1><br/>
<table border=1>
<tr bgcolor="yellow">
<th>그룹명</th>
<th>투자종목</th>
<th>투자명</th>
<th>총자산</th>
<th>내자산</th>
<th>배당률</th>
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
		
		//그룹자금 내자금 매도하기
		//그룹자금:g_buy테이블에서 funds다 더한금액에서 sell테이블의 funds 다 뺀 금액
		//내자금:gmfunds
	}
	%>
	<%
}
%>
</table>
<h1>가입된 그룹의 투자 현황</h1><br/>
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
	<h3><font color="blue"><%=r.getString("gname") %> 그룹의 투자 현황</font></h3>
	<table border=1>
	<tr>
	<th>종목</th>
	<th>투자명</th>
	<th>총자산</th>
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
<a href="front.jsp?mno=<%=mno%>">홈으로 가기</a>
</body>
</html>