<%@page import="exam.domain.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// num passwd pageNum 파라미터 가져오기
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	// 글 비밀번호 비교를 위해 DB에서 글Vo 가져오기
	BoardVo dbVo = dao.getBoardByNum(num);
	if (dbVo != null) {
		if (dbVo.getPasswd().equals(passwd)) { // 글 비밀번호 일치하면
			dao.deleteByNum(num); // 글 삭제
			
			response.sendRedirect("list.jsp?pageNum=" + pageNum);
		} else {
			%>
			<script>
				alert('비밀번호 틀림');
				history.back();
			</script>
			<%
		}
	}
%>



