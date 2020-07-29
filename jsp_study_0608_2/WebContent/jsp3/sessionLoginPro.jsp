<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 파라미터값 가져오기  "id"  "passwd"
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// DB의 아이디, 비밀번호
	String dbId = "admin";
	String dbPasswd = "adminpass";
	
	// String 같다비교 equals()
	
	// 폼의 아이디와 DB 아이디 비교 같으면
	//    폼 비밀번호와 DB 비밀번호 같으면
	//         로그인처리
	//            세션값생성 ("id", id)
	//            이동  sessionMain.jsp
	
	//    폼 비밀번호와 DB 비밀번호 다르면
	//         "비밀번호 틀림"
	
	// 폼의 아이디와 DB 아이디 비교 다르면
	//    "아이디 없음"
    if (id.equals(dbId)) { // 아이디 있음
    	if (passwd.equals(dbPasswd)) {
    		// 로그인 처리
    		session.setAttribute("id", id);
    		// 페이지 이동
    		//response.sendRedirect("sessionMain.jsp");
    		%>
    		<script>
    			alert('로그인 성공!')
    			location.href = 'sessionMain.jsp';
    		</script>
    		<%
    	} else {
    		%>비밀번호 틀림<br><%
    	}
    } else {
    	%>아이디 없음<br><%
    }

%>
    
    
    
    
    
    
    
    