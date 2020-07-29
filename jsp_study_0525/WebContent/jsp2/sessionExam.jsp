<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 세션: , 서버 mm에 바로 저장해서 보안성 good, 접속유지정보저장 클라이언트 1명당 세션 객체 1개씩 유지 -->
<!-- 세선값 생성 session.setAttribute("name",Object type-->
<%
	/* 세션 가져오기 session.getAttribute("name");
	세션 한개 삭제 session.removeAttribute("name");
	claer session  session.invalidate();
	
	cookie : 클라이언트 측에 텍스트 파일로 저장, 서버에 부하를 주지않고 값을 저장, 보안성에 단점 */
	
	//get session value
	//세션을 유지하는 기준은 브라우저마다 다르므로 브라우저를 바꾸면 세션 유지x(다른 클라이언트로 취급.)
	String name = (String)session.getAttribute("name"); //object로만 
	
%>
<h1>sessionExam.jsp</h1>
<h3>세션값은 <%=name %></h3>
<button onclick="location.href = 'sessionSet.jsp';">세션값 저장 </button> <!-- alert 에 대해서 두문장이상이면 ;필수, 하나면 없어도됨 -->
<!-- oinclick = "location.href = 'http://naver.com';" : 클릭시 naver로 이동  -->
<button onclick="location.href = 'sessionDel.jsp';">세션값 삭제 </button>
<button onclick="location.href = 'sessionInval.jsp';">세션값 초기화 </button>


</body>
</html>