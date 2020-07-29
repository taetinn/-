<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 액션태그로 vo객체 생성하고 reRef reLev reSeq 파라미터 가져와서 설정 --%>
<jsp:useBean id="vo" class="exam.domain.BoardVo"/>
<jsp:setProperty property="*" name="vo"/>

<%-- pageNum 파라미터 가져오기 --%>
<% String pageNum = request.getParameter("pageNum"); %>

	<h1>게시판 답글쓰기</h1>
	<hr>
	
	<form name="frm" action="replyWritePro.jsp" method="post" onsubmit="return check()">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name="reRef" value="<%=vo.getReRef() %>">
		<input type="hidden" name="reLev" value="<%=vo.getReLev() %>">
		<input type="hidden" name="reSeq" value="<%=vo.getReSeq() %>">
		<table border="1">
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" cols="40" rows="13"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="답글쓰기">
					<input type="reset" value="새로쓰기">
					<input type="button" value="글목록" onclick="location.href = 'list.jsp?pageNum=<%=pageNum %>'">
				</td>
			</tr>
		</table>
	</form>



<script>
	function check() {
		if (frm.name.value == '') { // frm.name.value.length == 0
			alert('글쓴이를 입력하세요');
			frm.name.focus();
			return false;
		}
		if (frm.passwd.value == '') {
			alert('비밀번호를 입력하세요');
			frm.passwd.focus();
			return false;
		}
		if (frm.subject.value == '') {
			alert('제목을 입력하세요');
			frm.subject.focus();
			return false;
		}
		if (frm.content.value == '') {
			alert('내용을 입력하세요');
			frm.content.focus();
			return false;
		}
	}

</script>
</body>
</html>




