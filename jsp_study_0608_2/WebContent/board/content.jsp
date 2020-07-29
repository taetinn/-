<%@page import="exam.domain.AttachfileVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.AttachfileDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="exam.domain.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// int num    String pageNum  파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num").trim());
	String pageNum = request.getParameter("pageNum");
	// DB객체 가져오기
	BoardDao boardDao = BoardDao.getInstance();
	//AttachfileDao attachDao = AttachfileDao.getInstance();
	
	// 조회수 1증가하는 메소드호출 updateReadcount(num)
	boardDao.updateReadcount(num);
	
	/* Join 쿼리로 한방에 두 테이블 내용 가져오기 */
	// 글번호에 해당하는 게시판글과 첨부파일 리스트 가져오기
	BoardVo boardVo = boardDao.getBoardAndAttachfilesByNum(num);
	System.out.println(boardVo);
	
	List<AttachfileVo> attachList = boardVo.getAttachList();
	
	/* Join 쿼리 없이 따로따로 가져오기 */
	// 글번호에 해당하는 게시판글 가져오기
	//BoardVo boardVo = boardDao.getBoardByNum(num);
	// 글번호에 해당하는 첨부파일 리스트 가져오기
	//List<AttachfileVo> attachList = attachDao.getAttachfilesByBno(num);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 a hh시 mm분 ss초");
	
	LocalDateTime dateTime = boardVo.getRegDate();
	String regDate = dateTime.format(formatter);
	
	//String content = boardVo.getContent();
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
			<td><%=boardVo.getNum() %></td>
			<th>조회수</th>
			<td><%=boardVo.getReadcount() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=boardVo.getName() %></td>
			<th>작성일</th>
			<td><%=regDate %></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3"><%=boardVo.getSubject() %></td>
		</tr>
		<tr>
			<th>파일</th>
			<td colspan="3">
				<%
				for (AttachfileVo attachVo : attachList) {
					%>
					<a href="download.jsp?filename=<%=attachVo.getUuid() %>_<%=attachVo.getFilename() %>">
					<%=attachVo.getFilename() %>
					</a><br>
					<%
				}
				%>
			</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3">
				<%//=content %>
				<pre><%=boardVo.getContent() %></pre>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="글수정" onclick="location.href='updateUserCheck.jsp?num=<%=boardVo.getNum() %>&pageNum=<%=pageNum %>'">
				<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=boardVo.getNum() %>&pageNum=<%=pageNum %>'">
				<input type="button" value="답글쓰기" onclick="location.href='replyWriteForm.jsp?reRef=<%=boardVo.getReRef() %>&reLev=<%=boardVo.getReLev() %>&reSeq=<%=boardVo.getReSeq() %>&pageNum=<%=pageNum %>'">
				<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum %>'">
			</td>
		</tr>
	</table>


</body>
</html>






