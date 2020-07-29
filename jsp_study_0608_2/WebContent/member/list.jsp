<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="exam.domain.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table tr td.td-center {
		text-align: center;
	}

</style>
</head>
<body>
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
		
	// 원하는 페이지의 글을 가져오는 메소드
	List<BoardVo> list = null;
	if (totalCount > 0) {
		list = dao.getBoards(startRow, pageSize); 
		
	}
%>
	<h1>글목록 (전체 글갯수: <%=totalCount %>)</h1>
	<hr>

	<h3><a href="writeForm.jsp">글쓰기</a></h3>
	
	<h3><a href="fileWriteForm.jsp">파일글쓰기</a></h3>

	<table border="1" style="width: 700px;">
		<tr>
			<th>번호</th>
			<th style="width: 300px;">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
	<%
		if (totalCount > 0) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd.");
			
			for (int i=0; i<list.size(); i++) {
				BoardVo vo = list.get(i);
				
				LocalDateTime dateTime = vo.getRegDate();
				String strRegDate = dateTime.format(formatter);
				%>
				<tr>
					<td class="td-center"><%=vo.getNum() %></td>
					<td>
						<%
						if (vo.getReLev() > 0) { // 답글
							%>
							<img src="/images/level.gif" width="<%=vo.getReLev() * 10 %>" height="13">
							<img src="/images/re.gif">
							<%
						}
						%>
						<a href="content.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>"><%=vo.getSubject() %></a>
					</td>
					<td class="td-center"><%=vo.getName() %></td>
					<td class="td-center"><%=strRegDate %></td>
					<td class="td-center"><%=vo.getReadcount() %></td>
					<td class="td-center"><%=vo.getIp() %></td>
				</tr>
				<%
			} // for
		} else { // totalCount == 0 
			%>
			<tr>
				<td colspan="6">게시판 글 없음</td>			
			</tr>
			<%
		}
	%>
	</table>

<%
	if (totalCount > 0) {
		// 총 페이지 수 구하기
		// 글50개. 한화면에보여줄글 10개 -> 50/10 = 5페이지
		// 글55개. 한화면에보여줄글 10개 -> 55/10 = 5 + 1페이지(나머지 있으면) -> 6페이지
		//int pageCount = totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1);
		int pageCount = totalCount / pageSize;
		if (totalCount % pageSize > 0) {
			pageCount += 1;
		}
		
		// 화면에 보여줄 페이지번호의 갯수 설정
		int pageBlock = 10;
		
		// 페이지블록의 시작페이지 구하기!
		// 1~10   11~20   21~30
		
		//  1~10 ->  1
		// 11~20 -> 11
		// 21~30 -> 21
		// 31~40
		
		// 페이지 블록의 시작페이지
		int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		// 페이지 블록의 끝페이지
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		// [이전]
		if (startPage > pageBlock) {
			%>
			<a href="notice.jsp?pageNum=<%=startPage - pageBlock %>">[이전]</a>
			<%
		}
				
		
		// 페이지블록 내에서의 시작페이지부터 끝페이지까지 번호출력
		for (int i=startPage; i<=endPage; i++) {
			%>
			<a href="notice.jsp?pageNum=<%=i %>">[<%=i %>]</a>
			<%
		}
		
		// [다음]
		if (endPage < pageCount) {
			%>
			<a href="notice.jsp?pageNum=<%=startPage + pageBlock %>">[다음]</a>
			<%
		}
		
		
		
		
	} // if


%>


</body>
</html>






