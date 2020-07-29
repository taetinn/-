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
	// 세션: 클라이언트와 서버의 접속유지정보 저장
	//       서버측에 저장. 중요한정보(로그인 인증) 저장용
	
	
	// 세션값 생성  session.setAttribute("이름", Object타입);
	//        가져오기  session.getAttribute("이름");
	//        한개 삭제 session.removeAttribute("이름");
	// 세션 비우기  session.invalidate();
	
	// 쿠키: 클라이언트 측에 텍스트파일로 저장.
	//       서버에 부하를 주지않고 값을 저장
	//       보안성에서 단점(광고, 장바구니 데이터)
	
	// 세션값 가져오기
	String name = (String) session.getAttribute("name");
%>

	<h1>sessionExam.jsp</h1>
	
	<h3>세션값: <%=name %></h3>
	
	<button onclick="location.href='sessionSet.jsp'">세션값 저장</button>
	<button onclick="location.href='sessionDel.jsp'">세션값 삭제</button>
	<button onclick="location.href='sessionInval.jsp'">세션 초기화</button>


</body>
</html>



