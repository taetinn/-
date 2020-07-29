<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>그룹정보</title>
</head>
<body>
<table border=1>
<tr bgcolor="yellow">
<th>그룹번호</th>
<th>그룹명</th>
<th>회원수</th>
<th>가입</th>
</tr>

<%
//회원수!!!!!!
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
	<td><%=m_num %>명</td>
	<%
	
	r.close();
	s.close();
	if(check==0){
		%>
		<td><a href="insert_group.jsp?mno=<%=mno%>&gno=<%=rs.getInt("gno") %>">가입하기</a></td>
		<%
	}
	%>
	
	<%
}

%>
</table>
<h1>가입된 그룹</h1><br/>
<table border=1>
<tr bgcolor="yellow">
<th>그룹번호</th>
<th>그룹명</th>
<th>탈퇴</th>
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
	<td><a href="group_out.jsp?mno=<%=mno%>&gno=<%=rs.getInt("gno")%>">탈퇴하기</a>
	</tr><%
    }
}
%>
</table>
<a href="front.jsp?mno=<%=mno%>">홈으로 가기</a>
</body>
</html>