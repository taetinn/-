<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("sessionLogin.jsp");
%>
<%-- 이동 sessionLogin.jsp --%>
<script>
	//location.href='sessionLogin.jsp';
</script>