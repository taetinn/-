<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키는 일반적으로 배열을 사용함.
// 	Cookie[] cookies = new Cookie[2];
// 	for (int i=0; i<cookies.length; i++) {
// 		cookies[i] = new Cookie("data_" + i, "");
// 	}

	// 쿠키 생성
	Cookie cookie1 = new Cookie("id", "aaa");
	// 쿠키 유효시간(유통기한) 설정 (필수설정!)
	cookie1.setMaxAge(60 * 10); // 10분 = 60초*10
	
	Cookie cookie2 = new Cookie("name", "홍길동");
	cookie2.setMaxAge(60 * 10); // 10분 = 60초*10
	
	// 클라이언트에 응답보내기 위해 응답객체에 추가
	response.addCookie(cookie1);
	response.addCookie(cookie2);
%>
<script>
	alert('쿠키값 생성됨');
	location.href = 'cookieExam.jsp';
</script>






