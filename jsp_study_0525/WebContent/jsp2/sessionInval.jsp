<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//세션 초기화 sessionInvalidate(), session내 모든 데이터를 비움
	session.invalidate();
	
%>

<script>
	alert('session has been invalidated.');
	location.href = 'sessionExam.jsp';
</script>

<!-- script의 위치혹은 순서는 자바코드 실행과는 관계가없다., 무조건 자바를 실행후 브라우저 내에서 스크립트를 실행하기 때문, 물론 코드에 따라 순서가 중요한 경우도 ㅇ ㅣㅆ음(자바가 반드시 처리된 후 나타나야하는 script의 경우, 
 혹은 자바 코드가 브라우저 출력과 관련이 전혀 없는경우) -->
</body>
</html>