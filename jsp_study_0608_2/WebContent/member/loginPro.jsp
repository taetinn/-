<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼  id  passwd  keepLogin  가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	boolean keepLogin = false;
	// 체크박스는 체크를 안하면 null을 리턴함
	String strKeepLogin = request.getParameter("keepLogin");// "true"
	if (strKeepLogin != null) { // "true"
		keepLogin = Boolean.parseBoolean(strKeepLogin);
	}
	
	// dao 객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	
	// check
	// -1: 아이디 없음, 0: 비밀번호 틀림, 1: 아이디 비밀번호 일치
	int check = dao.userCheck(id, passwd);
	
	if (check == 1) { // 아이디 비밀번호 일치
		// 로그인 인증
		session.setAttribute("id", id);
		
		// 로그인 상태유지 원하면 쿠키 생성 후 응답주기
		if (keepLogin) { // keepLogin == true
			Cookie idCookie = new Cookie("id", id);
			idCookie.setMaxAge(60*10); // (초단위 설정) 10분
			idCookie.setPath("/");
			response.addCookie(idCookie);
		}
		
		response.sendRedirect("main.jsp"); // 메인 페이지로 이동
	} else if (check == 0) {
		%>
		<script>
			alert('비밀번호 틀림');		
			//location.href = 'loginForm.jsp';
			history.back(); // 뒤로가기.   // history.forward(); 앞으로가기
		</script>		
		<%
	} else { // check == -1
		%>
		<script>
			alert('아이디 없음');
			history.back();
		</script>
		<%
	}
	
	
	



%>