<%@page import="exam.dao.BoardDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- post 파라미터 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- pageNum 파라미터 가져오기 --%>
<% String pageNum = request.getParameter("pageNum"); %>

<%-- 액션태그로 폼 파라미터값 가져와서 vo에 설정 --%>
<jsp:useBean id="vo" class="exam.domain.BoardVo"/>
<jsp:setProperty property="*" name="vo"/>

<%-- ip regDate 설정하기 --%>
<% vo.setIp(request.getRemoteAddr()); %>
<% vo.setRegDate(LocalDateTime.now()); %>

<%-- DB객체 가져오기 --%>
<% BoardDao dao = BoardDao.getInstance(); %>

<%-- 
	vo객체에 담겨있는 답글을 다는 대상글의
	reRef, reLev, reSeq를 기준으로 답글쓰기 
	트랜잭션(한개의 단위작업) 처리
--%>
<% dao.replyInsert(vo); %>

<%-- 글목록 list.jsp로 이동 --%>
<% response.sendRedirect("list.jsp?pageNum=" + pageNum); %>






