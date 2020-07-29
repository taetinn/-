<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//get form  id,password
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	//get DB object
	MemberDao dao = MemberDao.getInstance();
	
	// -1: id없음 0: 비밀번호 틀림 1: id, passwd 일치
	int check = dao.userCheck(id, passwd);
	
	if(check ==1){
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp"); // 로그인 성공 시 메인페이지로 이동
	} 
	else if(check==0){
		%>
		<script>
			alert('비밀번호 틀림');
			history.back(); //이전 방문했던 화면정보를 받아놓는 객체 'history' // history.forward(); 앞으로 가기
		</script>
		<%
	} 
	else{ //check == -1
		%>
		<script>
			alert('아이디가 존재하지 않습니다.');
			history.back(); 
		</script>
		<%
	}

%>