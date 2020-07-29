<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키값 가져오기
	Cookie[] cookies = request.getCookies();
	// 특정 쿠키 삭제하는 방법:
	// 유효시간(유통기한)을 0으로 설정하고
	// 다시 클라이언트에게 응답으로 보냄
	if (cookies != null) {
		for (int i=0; i<cookies.length; i++) {
			if (cookies[i].getName().equals("name")) {
				cookies[i].setMaxAge(0); // 0초 (삭제 지시)
				response.addCookie(cookies[i]); // 클라이언트로 응답보냄
			}
		}
	}
%>
<script>
	alert('name 쿠키값 삭제됨');
	location.href = 'cookieExam.jsp';
</script>






