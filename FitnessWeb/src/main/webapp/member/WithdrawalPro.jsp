<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String) session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	
	dao.deleteMemberById(id);
%>

<% session.invalidate(); %>

<% 
Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
				cookie.setMaxAge(0); // 유효기간 0 설정
				cookie.setPath("/"); // 경로 설정
				response.addCookie(cookie);
			}
		}
	}
%>

<script>
	alert('Withdrawal Complete');
	location.href='../index.jsp';

</script>

