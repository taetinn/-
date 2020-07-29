<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>examProcess1.jsp Page</h1>
	<hr>
	
	<!-- 데이터 전송방식 2가지 
	get, post
	get : 값이 url에 노출 된 채 넘어감 , 데이터 바이트 수 제한
	post: 값이 노출되지않고 넘어감 (로그인 등 보안적인면 good) ㅡ 데이터 제한 x -->
	
	<!-- 현재 사용자가 어디 있는지는 브라우저(클라이언트)입장에서 아는 것. 서버가아님!-->
	<%
	//request 정보의 사용자입력 데이터는 모두 String type(사용자 입력을 안전하게 받기위해)
	String strNum = request.getParameter("num");
	//String->integer : Parse~
	int num = Integer.parseInt(strNum);
	%>
	Parameter Value - 정수형 +10 : <%=num+10 %> <br>	
	Parameter Value - 문자열 +10 : <%=strNum +10 %> <br>

	Parameter Value - 문자열 : <%=strNum %> <br>
</body>
</html>