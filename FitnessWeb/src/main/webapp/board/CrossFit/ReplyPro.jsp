<%@page import="dao.BoardCfDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String pageNum = request.getParameter("pageNum");
%>

<jsp:useBean id="vo" class="vo.BoardVo"/>
<jsp:setProperty property="*" name ="vo"/>

<%
	// ip주소  regDate 설정
	vo.setRegDate(LocalDateTime.now());

	// DB객체 가져오기
	BoardCfDao dao = BoardCfDao.getInstance();
	// 답글 insert
	dao.replyInsert(vo);
	
	// 이동 notice.jsp
	response.sendRedirect("BoardMain.jsp?pageNum=" + pageNum);
%>