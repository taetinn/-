<%@page import="java.util.List"%>
<%@page import="exam.domain.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

// DB객체 가져오기
BoardDao dao = BoardDao.getInstance();
// 전체 글갯수
int totalCount = dao.getTotalCount();

// 사용자가 요청한 페이지번호 파라미터 가져오기
String strPageNum = request.getParameter("pageNum");
if (strPageNum == null || strPageNum.equals("")) {
	strPageNum = "1";
}
//strPageNum = (strPageNum == null) ? "1" : strPageNum;

// 문자열 페이지번호를 숫자로 변환
int pageNum = Integer.parseInt(strPageNum);
// 한 페이지에 15개씩 가져오기
int pageSize = 15;
// 시작행 인덱스번호 구하기(수식)
int startRow = (pageNum-1) * pageSize;

List<BoardVo> list = dao.getBoards(startRow, pageSize);
%>

<boards> <!-- table name -->

	
		<%
			for(BoardVo vo: list){
				%>
				<board>
				<num><%=vo.getNum() %></num>
				<name><%=vo.getName() %></name>
				<subject><%=vo.getSubject() %></subject>
				</board> 
			<%	
			}
		%>
	<board> 
		<num>1</num> 
		<name>hong</name>
		<subject>Title 1</subject> 
	 </board>
	  
	 <board> 
		<num>2</num>
	 	<name>KIM</name>
		<subject>Title 2</subject>
	 </board>
	  
	 <board>
	  	<num>3</num>
	  	<name>LEE</name>
		<subject>Title 3</subject>
	 </board> 
	</boards>