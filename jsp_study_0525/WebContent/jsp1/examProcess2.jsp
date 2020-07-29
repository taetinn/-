<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>examProcess2.jsp Page</h1>
	<hr>
	<%
	//post request 한글처리
	 request.setCharacterEncoding("utf-8");
	//넘겨준 값을 받아오는 작업 : parameter 가져오기
	String name = request.getParameter("name");
	String strAge = request.getParameter("age");
	//int age = Integer.parseInt(strAge);
	int age = Integer.parseInt(request.getParameter("age"));
	%>
 	이름: <%=name %><br>
	나이 : <%=age %><br>
	<%
		if(age<20){
			out.println(name+"님은 미성년자 입니다.");
		} 
		else {
				out.println(name+"님의 나이는 20세 이상입니다.<br>");
		}
	//웹디자이너와의 분업을위해 자바코드보단 jsp 문법을 사용하는 것이 더 맞음.
	%>
	<%--표현식을 이용한 출력 --%>
	<h3>표현식</h3>
	<%
		if(age<20){
			%><%=name %>님은 미성년자입니다.<br><%
		}else{
			%><%=name%>님의 나이는 20세 이상입니다.<br><%
		}
	%>
	
	<!-- 서버코드에서 일어나는거 jsp only. -->
</body>
</html>