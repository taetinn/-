<%@page import="exam.dao.MemberDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="exam.domain.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// post 파라미터 한글처리
	request.setCharacterEncoding("utf-8");

	// VO 객체 생성
	//MemberVo vo = new MemberVo();
%>
<!-- Vo 객체 생성  -->
<jsp:useBean id="vo" class="exam.domain.MemberVo"/> <!-- 디자이너에게 편한 객체 생성법 -->



<%	
/* 	// 파라미터 가져와서 vo객체에 설정
	vo.setId(request.getParameter("id"));
	vo.setPasswd(request.getParameter("passwd"));
	vo.setName(request.getParameter("name"));
	vo.setAge(Integer.parseInt(request.getParameter("age")));
	vo.setGender(request.getParameter("gender"));
	vo.setEmail(request.getParameter("email")); */
%>

<jsp:setProperty property="*" name = "vo"/> <!-- name이 가진 setter기준으로 동작 -->
<!-- 객체의 필드이름과 input type name속성을 같게 해주는 것이 중요 (날짜는 제외) -->

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





