<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- post 파라미터값 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- pageNum 파라미터값 가져오기 --%>
<% String pageNum = request.getParameter("pageNum"); %>

<jsp:useBean id="vo" class="exam.domain.BoardVo"/>
<jsp:setProperty property="*" name="vo"/>

<%-- DB객체 가져오기 --%>
<% BoardDao dao = BoardDao.getInstance(); %>

<%-- 수정하기 메소드 호출 dao.update(vo) --%>
<% dao.update(vo); %>

<%-- 수정 완료 후 글목록으로 이동 --%>
<% response.sendRedirect("list.jsp?pageNum=" + pageNum); %>





