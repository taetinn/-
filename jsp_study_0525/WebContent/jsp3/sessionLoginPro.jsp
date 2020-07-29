<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터값 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	//DB의 아이디, 비밀번호
	String dbId = "admin";
	String dbPasswd = "adminpass";

	//String 비교  equals()
	if(id.equals(dbId)){ 
		if(passwd.equals(dbPasswd)){
			//login
			session.setAttribute("id",id);
			//page move
			response.sendRedirect("sessionMain.jsp"); //location.href는 jsp, 얘는 자바방식
			return;
			%>
			<script>
				//alert('success to login');
				//location.href = 'sessionMain.jsp';
			</script>
			<% 
		//	location.href = 'sessionMain.jsp'; >>script 방식으로, 스크립트 태그를 다시 써서 전달
		} else{
			%>비밀번호가 틀렸습니다.<br><%
		}
	} else {
		%>존재하는 아이디가 없습니다.<br><%
	}


%>