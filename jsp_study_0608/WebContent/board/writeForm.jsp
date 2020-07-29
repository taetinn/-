<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>게시판 주글쓰기</h1>
	<hr>
	
	<form name="frm" action="writePro.jsp" method="post" onsubmit="return check()">
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
					<input type="submit" value="글쓰기">
					<input type="reset" value="새로쓰기">
					<input type="button" value="글목록" onclick="location.href = 'list.jsp'">
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




