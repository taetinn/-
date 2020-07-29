<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>examProcess1.jsp 페이지</h1>
	<hr>
	<!--
	전송방식 2가지: get, post
	 
	get 방식: 주소표시줄에 데이터 노출. 데이터 바이트수 제한.
	    http://localhost:8081/jsp_study/jsp1/examProcess1.jsp?num=5
	
	post 방식: 주소표시줄에 데이터 노출 안됨. 데이터 제한 없음.
	    http://localhost:8081/jsp_study/jsp1/examProcess1.jsp
	 -->
	 
	 <%
	 // request 정보 사용자입력 데이터는 모두 String형이다.
	 String strNum = request.getParameter("num");
	 
	 // String -> 정수형
	 int num = Integer.parseInt(strNum);
	 
	 %>
	 파라미터값 - 문자열: <%=strNum %><br>
	 파라미터값 - 문자열: <%=strNum + 10 %><br>
	 
	 파라미터값 - 숫자 + 10: <%=num + 10 %><br>
	

</body>
</html>




