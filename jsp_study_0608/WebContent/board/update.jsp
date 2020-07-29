<%@page import="exam.vo.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 앞 단계의 게시판 사용자 인증 과정을 거치지 않고
	// 강제로 접속했을때 글목록으로 이동시키기(보안처리)
	String strRandomNumber = request.getParameter("randomNumber");
	if (strRandomNumber == null) {
		response.sendRedirect("list.jsp");
		return;
	}
	
	Integer serverNum = (Integer) session.getAttribute("randomNumber");
	int clientNum = Integer.parseInt(strRandomNumber);
	if (serverNum == null || serverNum != clientNum) {
		response.sendRedirect("list.jsp");
		return;
	}

	// 앞 단계의 게시판 사용자 인증이 성공하면
	// 세션에서 randomNumber 값 삭제
	session.removeAttribute("randomNumber");
	///////////////////////////////////////////////////////

	
	// int num  String pageNum 파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	// 글번호에 해당하는 글 vo로 가져오기
	BoardVo vo = dao.getBoardByNum(num);
%>
	<h1>게시판 글수정</h1>
	<hr>
	
	<form name="frm" action="updatePro.jsp" method="post" onsubmit="return check()">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name="num" value="<%=vo.getNum() %>">
		<table border="1">
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="<%=vo.getSubject() %>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" cols="40" rows="13"><%=vo.getContent() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글수정">
					<input type="reset" value="새로쓰기">
					<input type="button" value="글목록" onclick="location.href = 'list.jsp?pageNum=<%=pageNum %>'">
				</td>
			</tr>
		</table>
	</form>


</body>
</html>