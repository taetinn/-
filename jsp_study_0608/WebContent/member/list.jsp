<%@page import="exam.vo.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");

	if (id == null || !id.equals("admin")) { // id.equals("admin") == false
		response.sendRedirect("main.jsp");
		return;
	}
	
	// DB객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	
	List<MemberVo> list = dao.getMembers();
%>
	<h1>전체 회원목록</h1>
	<hr>
	
	<table border="1">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>성별</th>
		<th>이메일</th>
		<th>가입일자</th>
	</tr>
	<%
	for (MemberVo vo : list) {
		%>
		<tr>
			<td><%=vo.getId() %></td>
			<td><%=vo.getPasswd() %></td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getAge() %></td>
			<td><%=vo.getGender() %></td>
			<td><%=vo.getEmail() %></td>
			<td><%=vo.getRegDate().toString() %></td>
		</tr>
		<%
	} // for
	%>
	</table>

<h3><a href="main.jsp">메인화면</a></h3>

</body>
</html>




