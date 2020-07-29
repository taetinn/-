<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>examProcess3.jsp 페이지</h1>
	<hr>
	
	<%
	// post request 한글처리
	request.setCharacterEncoding("utf-8");
	
	// 파라미터값 가져오기
	// getParameter() 메소드는 name속성에 해당하는 값이 없을때
	// null을 리턴함
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	
	String[] hobbies = request.getParameterValues("hobby");
	%>
	이름: <%=name %><br>
	성별: <%=gender %><br>
	직업: <%=job %><br>
	취미:
	<%
	if (hobbies != null) {
		for (String hobby : hobbies) {
			//out.print(hobby + " ");
			%>
			<%=hobby %> &nbsp;                    
			<%
		}
		//out.print("<br>");
		%>
		<br>
		<%
	}
	%>

</body>
</html>




