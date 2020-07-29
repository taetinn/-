<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
strArr[0]의 값은: Java<br>
strArr[1]의 값은: JSP<br>
strArr[2]의 값은: XML<br>
strArr[3]의 값은: Ajax<br>
<hr>

<%
	// 배열변수 선언
	// String[] strArr = new String[4];
	// strArr[0] = "Java";
	String[] strArr = { "Java", "JSP", "XML", "Ajax" };
	
	// for 출력
	// out 객체를 이용한 출력
	for (int i=0; i<strArr.length; i++) {
		out.println(strArr[i] + "<br>");
	}
%>
<hr>

<%-- 표현식을 이용한 출력 --%>
<%
	for (String str : strArr) {
		%>
		<%=str %><br>
		<%
	}
%>

<hr>

<table border="1" style="width: 400px;">
	<tr><th>글번호</th><th>글제목</th><th>글내용</th></tr>
	<tr><td>1</td><td>글제목1</td><td>글내용1</td></tr>
	<tr><td>2</td><td>글제목2</td><td>글내용2</td></tr>
	<tr><td>3</td><td>글제목3</td><td>글내용3</td></tr>
	<tr><td>4</td><td>글제목4</td><td>글내용4</td></tr>
	<tr><td>5</td><td>글제목5</td><td>글내용5</td></tr>
</table>

<hr>

<%--  for문을 이용해서 동일하게 테이블 출력 --%>
<table border="1" style="width: 400px;">
	<tr><th>글번호</th><th>글제목</th><th>글내용</th></tr>
	<%
	for (int i=1; i<=5; i++) {
		%>
		<tr>
			<td><%=i %></td>
			<td>글제목<%=i %></td>
			<td>글내용<%=i %></td>
		</tr>
		<%
	}
	%>
</table>

</body>
</html>






