<%@page import="exam.domain.MemberVo"%>
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
	// 세션값 없으면 loginForm.jsp로 이동
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
		return;
	}

	// DB객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	
	// id에 해당하는 행 가져오기 메소드 호출
	MemberVo vo = dao.getMemberById(id);
%>

	<h1>회원정보 조회</h1>
	<hr>
	
	아이디: <%=vo.getId() %><br>
	비밀번호: <%=vo.getPasswd() %><br>
	이름: <%=vo.getName() %><br>
	나이: <%=vo.getAge() %><br>
	성별: <%=vo.getGender() %><br>
	이메일: <%=vo.getEmail() %><br>
	가입날짜: <%=vo.getRegDate() %><br>
	
	<h3><a href="main.jsp">메인화면</a></h3>

</body>
</html>




