<%@page import="exam.vo.MemberVo"%>
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
	
	// 성별값 가져오기
	String gender = vo.getGender();
	if (gender == null || gender.equals("")) {
		gender = "남"; // 기본값을 "남"으로 설정
	}
%>
	<h1>회원정보 수정</h1>
	<hr>
	
	<form action="updatePro.jsp" method="post">
		아이디: <input type="text" name="id" value="<%=vo.getId() %>" readonly><br>
		비밀번호: <input type="password" name="passwd"><br>
		비밀번호 확인: <input type="password" name="passwd2"><br>
		이름: <input type="text" name="name" value="<%=vo.getName() %>"><br>
		나이: <input type="number" name="age" min="0" max="150" value="<%=vo.getAge() %>"><br>
		성별: <input type="radio" name="gender" value="남" <% if (gender.equals("남")) { %>checked<% } %>>남자
		      <input type="radio" name="gender" value="여" <% if (gender.equals("여")) { %>checked<% } %>>여자<br>
		이메일: <input type="email" name="email" value="<%=vo.getEmail() %>"><br>
		<input type="submit" value="회원수정">
	</form>

</body>
</html>






