<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 세션 초기화
	session.invalidate();

	// 로그인 상태유지용 쿠키가 존재하면 삭제
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
	}
	
	
%>
<%-- "로그아웃됨"  loginForm.jsp로 이동 --%>
<script>
	alert('로그아웃됨');
	location.href = 'loginForm.jsp';
</script>





