<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 세션 초기화
	session.invalidate();
%>

<script>
	alert('세션 초기화됨');
	location.href = 'sessionExam.jsp';
</script>

