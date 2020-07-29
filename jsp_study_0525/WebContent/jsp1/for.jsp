<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
strArr[0]의 값은 : Java<br>
strArr[1]의 값은 : JSP<br>
strArr[2]의 값은 : XML<br>
strArr[3]의 값은 : Ajax<br>
<%
	//배열변수 선언
	String strArr[] = new String[]  {"Java","JSP","XML","Ajax"} ;
/* 	strArr[0] = "Java";
	strArr[1] = "JSP";
	strArr[2] = "XML";
	strArr[3] = "Ajax";
	 */
	
	
	//for출력
	//out 객체 이용 출력

	for(int i=0;i<strArr.length;i++){
		out.println(strArr[i]);
	}
	%><hr><% 
	
	//표현식을 이용한 출력
	for(int i=0;i<strArr.length;i++){
		%><%=strArr[i] %><br><%
	}
%>

<hr>
<table border="1">
	<tr><td>글번호</td><td>글제목</td><td>글내용</td></tr>
	<tr><td>1</td><td>글제목1</td><td>글내용1</td></tr>
	<tr><td>2</td><td>글제목2</td><td>글내용2</td></tr>
	<tr><td>3</td><td>글제목3</td><td>글내용3</td></tr>
	<tr><td>4</td><td>글제목4</td><td>글내용4</td></tr>
	<tr><td>5</td><td>글제목5</td><td>글내용5</td></tr>
</table>

<table border="2">
	<tr><td>글번호</td><td>글제목</td><td>글내용</td></tr>
	<%
		for(int i=0;i<5;i++){
			%><tr><td><%=i+1 %></td><td>글제목<%=i+1 %></td><td>글내용<%=i+1 %></td></tr><%
		}
	%>
</table>

</body>
</html>