<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="vo" class="vo.MemberVo" />
<jsp:setProperty property="*" name="vo" />
<%
	vo.setRegDate(LocalDateTime.now());
	MemberDao dao = MemberDao.getInstance();
	
	dao.insertMem(vo);
	dao.insertGx(vo);
	//System.out.println(vo.toString());
	
response.sendRedirect("../index.jsp");
%>