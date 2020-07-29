<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

/* 	//basically cookie uses array
	Cookie[] cookies = new Cookie[2];
	// 배열에 직접 담느 ㄴ것이 아니므로 for:each문 쓰면 안됨
	for(int i=0;i<cookies.length;i++){
		cookies[i] = new Cookie("data_"+i,"");
	} */
	// 쿠키 생성
	Cookie cookie1 = new Cookie("id", "aaa");
	// 쿠키 유효시간(유통기한) 설정 , 필수설정
	cookie1.setMaxAge(60 * 10); // 10분 = 60초*10
	

	Cookie cookie2 = new Cookie("name","hong");
	cookie2.setMaxAge(60 * 10);
	
	//add at response object to send response to Client
	response.addCookie(cookie1);
	response.addCookie(cookie2);
	

%>

<script>
	alert('cookie value generated');
	location.href='cookieExam.jsp';
</script> 