<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	boolean keepLogin = false;
	String strKeepLogin = request.getParameter("keepLogin");
	if (strKeepLogin != null) { // "true"
		keepLogin = Boolean.parseBoolean(strKeepLogin);
	}
	
	MemberDao dao = MemberDao.getInstance();
	
//	System.out.println("id: "+id+"passwd : "+passwd);
	int check = dao.userCheck(id, passwd);
	
	if(check==1){
		session.setAttribute("id", id);
		
		if (keepLogin) { // keepLogin == true
			Cookie idCookie = new Cookie("id", id);
			idCookie.setMaxAge(60*10); // (초단위 설정) 10분
			idCookie.setPath("/");
			response.addCookie(idCookie);
		}
		
		response.sendRedirect("../index.jsp");
	}else if(check==0){
		%>
		<script>
			alert('Wrong Password');
			history.back();
		</script>
		<%
	} else { // check == -1
		%>
		<script>
			alert('Cannot find an account');
			history.back();
		</script>
		<%
	}

%>