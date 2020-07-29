<%@page import="java.util.Random"%>
<%@page import="exam.vo.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// num  passwd  파라미터값 가져오기
	//int num = Integer.parseInt(request.getParameter("num"));
	//String passwd = request.getParameter("passwd");
	
	// pageNum 파라미터 가져오기
	String pageNum = request.getParameter("pageNum");
%>

<% String passwd = request.getParameter("passwd"); %>
<% System.out.println("passwd = " + passwd); // 빈문자열 %>

<%-- 액션태그 BoardVo 객체 생성 --%>
<jsp:useBean id="vo" class="exam.vo.BoardVo" />


<%-- 
	액션태그 setProperty는
	파라미터를 찾아서 해당 setter메소드에 전달해서 값 설정.
	파라미터를 찾는데 null 또는 빈문자열("")일 경우는
	setter메소드를 호출하지 않음!
 --%>

<%-- 액션태그로 파라미터 가져와서 vo에 채우기 --%>
<jsp:setProperty property="*" name="vo"/>

<%
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	
	BoardVo dbVo = dao.getBoardByNum(vo.getNum());
	
	
	if (dbVo.getPasswd().equals(vo.getPasswd())) {
		// 글 비밀번호 일치하면
		Random random = new Random();
		int randomNumber = random.nextInt(100) + 1; // 1~100 사이 임의 정수
		
		session.setAttribute("randomNumber", randomNumber);
		
		// 수정 폼 화면으로 이동 
		response.sendRedirect("update.jsp?num=" + vo.getNum() + "&pageNum=" + pageNum + "&randomNumber=" + randomNumber);
	} else {
		%>
		<script>
			alert('비밀번호 틀림');
			history.back();
		</script>
		<%
	}

%>






