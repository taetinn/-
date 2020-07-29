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
	String id = "id 없음";
	String name = "name 없음";

	// 쿠키값 가져오기
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i=0; i<cookies.length; i++) {
			if (cookies[i].getName().equals("id")) {
				id = cookies[i].getValue();
			}
			if (cookies[i].getName().equals("name")) {
				name = cookies[i].getValue();
			}
		}
	}
%>

	<h1>cookieExam.jsp 페이지</h1>
	<hr>
	
	<h3>쿠키값 - 아이디: <%=id %></h3>
	<h3>쿠키값 - 이름: <%=name %></h3>
	
	<button style="background-color: yellow;" onclick="location.href='cookieSet.jsp'">쿠키값 저장</button>
	<button onclick="location.href='cookieDel.jsp'">쿠키값 삭제</button>

</body>
</html>







