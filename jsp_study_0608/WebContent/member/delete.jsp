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
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp로 이동
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
%>
	<h1>회원정보 삭제에 앞서 사용자 본인 확인</h1>
	<hr>
	
	<form name="frm" action="deletePro.jsp" method="post" <%-- onsubmit="return check()" --%>>
		<!-- hidden 타입 input태그로 사용자 눈에 안보이게 전송 -->
		아이디: <input type="text" name="id" value="<%=id %>" readonly><br>
		비밀번호: <input type="password" name="passwd"><br>
		<input type="submit" value="회원삭제"><br>
		
		<input type="button" value="회원삭제(일반버튼)" onclick="check2()">
		
	</form>
	
	<script>
		function check() {
			// 선택창. true/false 리턴함
			var result = confirm('정말 삭제하시겠습니까?');
			
			if (result == false) {
				return false;
			}
		}
		
		function check2() {
			// 확인true / 취소false 리턴함
			var result = confirm('정말 삭제하시겠습니까?');
			
			if (result == false) {
				return;
			}
			
			// 폼 전송
			frm.submit();
		}
		
	</script>
</body>
</html>




