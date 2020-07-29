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
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	
	// 세션값이 없으면 sessionLogin.jsp 이동
	if (id == null) {
		%>
		<script>
			alert('로그인을 하지 않았습니다.\n로그인 페이지로 이동합니다.');
			location.href = 'sessionLogin.jsp';
		</script>
		<%
		return;
	}

%>

	<h1>메인 페이지</h1>
	
	<%=id %>님이 로그인하셨습니다.<br>
	
	<button onclick="location.href='sessionLogout.jsp'">로그아웃</button>


</body>
</html>



