<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	if(id==null|| id.length()==0){ 
		return;
	}
	
	MemberDao dao = MemberDao.getInstance();
	
	boolean isIdDup = dao.IdDupCheck(id);
	
	out.println(isIdDup);
%>
