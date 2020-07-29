<%@page import="exam.dao.MemberDao"%>
<%@page import="exam.domain.MemberVo"%>
<%@page import="java.time.LocalDateTime"%>
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
	//파라미터 한글처리
	request.setCharacterEncoding("utf-8");
	

	//객체 생성
	MemberVo vo= new MemberVo();

	
	vo.setId(request.getParameter("id"));
	vo.setPasswd(request.getParameter("passwd"));
	vo.setName(request.getParameter("name"));
	vo.setAge(Integer.parseInt(request.getParameter("age")));
	vo.setGender(request.getParameter("gender"));
	vo.setEmail(request.getParameter("email"));
	
	LocalDateTime dateTime =LocalDateTime.now();
	vo.setRegDate(dateTime);
	
	
	//싱글톤dao객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	
	//insert메소드 호출
	dao.insert(vo);
	

	// 로그인 폼 화면으로 이동
	response.sendRedirect("loginForm.jsp");

%>

회원가입 성공
</body>
</html>