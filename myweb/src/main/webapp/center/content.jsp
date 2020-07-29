<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import ="exam.domain.BoardVo" %>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<%-- head 영역  include head.jsp --%>
<jsp:include page="/include/head.jsp"/>
</head>
<%
	// int num    String pageNum  파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	// 조회수 1증가
	dao.updateReadcount(num);
	// 글 한개 가져오기
	BoardVo vo = dao.getBoardByNum(num);
	// 내용에서 엔터키 줄바꿈 \r\n -> <br> 바꾸기
	String content = "";
	if (vo.getContent() != null) {
		content = vo.getContent().replace("\r\n", "<br>");
	}
	
	request.setAttribute("boardVo", vo);
%>

<body>
<div id="wrap">
	<%-- header 영역  include top.jsp --%>
	<jsp:include page="/include/top.jsp" />

	<div class="clear"></div>
	<div id="sub_img_center"></div>
	
	<div class="clear"></div>
	<jsp:include page="/include/board_submenu.jsp"/>
	
	<article>
		
	<h1>공개 게시판 Content</h1>
		
	<table id="notice">
		<tr>
			<th scope="col" width="200">글번호</th>
			<td width="500" style="text-align: left;"><%=vo.getNum() %></td>
		</tr>
		<tr>
			<th scope="col">조회수</th>
			<td style="text-align: left;"><%=vo.getReadcount() %></td>
		</tr>
		<tr>
			<th scope="col">작성자</th>
			<td style="text-align: left;"><%=vo.getName() %></td>
		</tr>
		<tr>
			<th scope="col">작성일</th>
			<td style="text-align: left;"><%=vo.getRegDate() %></td>
		</tr>
		<tr>
			<th scope="col">글제목</th>
			<td style="text-align: left;"><%=vo.getSubject() %></td>
		</tr>
		<tr>
			<th scope="col">글내용</th>
			<td style="text-align: left;"><%=content %></td>
		</tr>
	</table>

	<div id="table_search">
		<button type="button">글수정</button>
		<button type="button">글삭제</button>
		<button type="button" onclick="location.href='replyWriteForm.jsp?reRef=<%=vo.getReRef() %>&reLev=<%=vo.getReLev() %>&reSeq=<%=vo.getReSeq() %>&pageNum=<%=pageNum %>'">답글쓰기</button>
		<button type="button" onclick="location.href='notice.jsp?pageNum=<%=pageNum %>'">목록보기</button>
	</div>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
		
	</article>
    
	<div class="clear"></div>
	<%-- footer 영역  include bottom.jsp --%>
	<jsp:include page="/include/bottom.jsp"/>
</div>

</body>
</html>   

