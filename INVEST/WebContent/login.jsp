<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
</head>
<body>
<FORM ACTION="j_security_check" METHOD="POST">
아이디:<INPUT TYPE="TEXT" NAME="j_username">
<br>
비밀번호:<INPUT TYPE="PASSWORD" NAME="j_password">
<br>
<INPUT TYPE="SUBMIT" NAME="submit" value="LOG IN">

</FORM>
<a href="member.jsp">회원가입</a><br>
</body>
</html>