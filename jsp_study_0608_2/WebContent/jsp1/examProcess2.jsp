<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>examProcess2.jsp 페이지</h1>
	<hr>
	
	<%
	// post request 한글처리
	request.setCharacterEncoding("utf-8");
	
	// 파라미터값 가져오기
	String name = request.getParameter("name");
	//String strAge = request.getParameter("age");
	//int age = Integer.parseInt(strAge);
	int age = Integer.parseInt(request.getParameter("age"));
	%>
	이름: <%=name %><br>
	나이: <%=age %><br>
	
	<%
	// 나이가 20세 이상이면
	//   "name님의 나이는 20세 이상입니다."
	// 나이가 20세 미만이면
	//   "name님은 미성년자 입니다."
	
	// 출력객체 out을 이용해서 출력
	
	if (age >= 20) {
		out.println(name + "님의 나이는 20세 이상입니다.<br>");
	} else {
		out.println(name + "님은 미성년자 입니다.<br>");
	}
	%>
	<hr>
	<%-- 표현식을 이용한 출력 --%>
	<%
	if (age >= 20) {
		%>
		<%=name %>님의 나이는 20세 이상입니다.<br>
		<%
	} else {
		%>
		<%=name %>님은 미성년자 입니다.<br>
		<%
	}
	%>
	

</body>
</html>




