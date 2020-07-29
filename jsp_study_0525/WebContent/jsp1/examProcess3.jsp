<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>examProcess3.jsp Page</h1>
	<hr>
	<%
	 request.setCharacterEncoding("utf-8"); //post로 넘어올 가능성이 있다면 일단 넣어야함
	 
	//getParameter() 메소드는 name속성에 해당하는 값이 없다는 null return >>null값을 받을 수 있도록 참조변수를 사용하는 경우o
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String job= request.getParameter("job");
	
	//checkbox : 선택지가 0개에서 복수개까지 가능 ->배열
	String[] hobbies = request.getParameterValues("hobby");
	%>
	이름: <%=name%><br> 	
	성별: <%=gender%><br> 
	직업: <%=job%><br>
	취미: <%
		if(hobbies !=null){
			for(String hobby : hobbies){
				//out.print(hobby + " ");
				%><%=hobby%> &nbsp; <% 
			}
			%><br><%
		}
	%>
</body>
</html>