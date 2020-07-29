<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//get cookie val
	Cookie[] cookies = request.getCookies();

	//how to remove certain cookie
	//set valid time into '0'
	// send to clinet as a respons
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("name")){
				cookies[i].setMaxAge(0); //삭제 지시
				response.addCookie(cookies[i]); // send response to client
			}
		}
	}

%>

<script>
	alert('name cookie val deleted');
	location.href='cookieExam.jsp';
</script>