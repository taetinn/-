<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="exam.domain.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// int num    String pageNum  파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	// 조회수 1증가하는 메소드호출 updateReadcount(num)
	dao.updateReadcount(num);
	// 글번호에 해당하는 글 가져오기
	BoardVo vo = dao.getBoardByNum(num);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 a hh시 mm분 ss초");
	
	LocalDateTime dateTime = vo.getReg_date();
	String regDate = dateTime.format(formatter);
	
	//String content = vo.getContent();
	//content = content.replace("\n", "<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글내용 보기</h1>
	<hr>
	
	<table border="1" style="width: 700px;">
		<tr>
			<th>글번호</th>
			<td><%=vo.getNum() %></td>
			<th>조회수</th>
			<td><%=vo.getReadCount() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=vo.getName() %></td>
			<th>작성일</th>
			<td><%=regDate %></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3"><%=vo.getSubject() %></td>
		</tr>
		<tr>
			<th>파일</th>
			<td colspan="3"><%=vo.getFilename() %></td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3">
				<%//=content %>
				<pre><%=vo.getContent() %></pre>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="글수정" onclick="location.href='updateUserCheck.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'">
				<input type="button" value="글삭제">
				<input type="button" value="답글쓰기">
				<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum %>'">
			</td>
		</tr>
	</table>


</body>
</html>






