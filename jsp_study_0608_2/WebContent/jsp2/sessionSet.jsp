<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션값 생성  "name", "홍길동"
	session.setAttribute("name", "홍길동"); // 값 생성

	//session.setAttribute("name", "성춘향"); // 값 수정
%>
<script>
	alert('세션값 생성됨')
	location.href = 'sessionExam.jsp'
</script>




