<%@page import="exam.dao.MemberDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="exam.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// post 파라미터 한글처리
	request.setCharacterEncoding("utf-8");

	// VO 객체 생성
	//MemberVo vo = new MemberVo();
%>
<%-- VO 객체 생성 --%>
<jsp:useBean id="vo" class="exam.vo.MemberVo" />
	
<%
	// 파라미터 가져와서 vo객체에 설정
// 	vo.setId(request.getParameter("id"));
// 	vo.setPasswd(request.getParameter("passwd"));
// 	vo.setName(request.getParameter("name"));
// 	vo.setAge(Integer.parseInt(request.getParameter("age")));
// 	vo.setGender(request.getParameter("gender"));
// 	vo.setEmail(request.getParameter("email"));
%>
<jsp:setProperty property="*" name="vo" />

<%
	// 날짜시간 정보 객체 생성해서 vo객체에 설정
	LocalDateTime dateTime = LocalDateTime.now();
	vo.setRegDate(dateTime);
	
	// 싱글톤 dao 객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	
	// insert 메소드 호출
	dao.insert(vo);
	
	// 로그인 폼 화면으로 이동
	//response.sendRedirect("loginForm.jsp");
%>
<script>
	alert('회원가입 성공!');
	location.href = 'loginForm.jsp';
</script>





