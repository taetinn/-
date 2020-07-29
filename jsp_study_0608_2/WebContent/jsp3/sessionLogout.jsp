<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 초기화
	session.invalidate();
	// 화면 이동
	response.sendRedirect("sessionLogin.jsp");
%>
<%-- 이동 sessionLogin.jsp --%>
<script>
	//alert('로그아웃됨');
	//location.href = 'sessionLogin.jsp';
</script>