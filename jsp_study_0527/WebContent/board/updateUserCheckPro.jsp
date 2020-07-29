<%@page import="exam.domain.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// num  passwd  파라미터값 가져오기
	//int num = Integer.parseInt(request.getParameter("num"));
	//String passwd = request.getParameter("passwd");
	String pageNum  =request.getParameter("pageNum");
%>
<%-- 액션태그 BoardVo 객체 생성 --%>
<jsp:useBean id="vo" class="exam.domain.BoardVo" />
<%-- 액션태그로 파라미터 가져와서 vo에 채우기 --%>
<jsp:setProperty property="*" name="vo"/>

<%
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	
	BoardVo dbVo = dao.getBoardByNum(vo.getNum());
	//비밀먼호 일치하면 수정jsp로 이동
	if (vo.getPasswd().equals(dbVo.getPasswd())) {
		response.sendRedirect("update.jsp?num=" + vo.getNum()+"&pageNum="+pageNum); //수정할 글 번호(num)
	} else {
		%>
		<script>
			alert('비밀번호 틀림');
			history.back();
		</script>
		<%
	}

%>






