<%@page import="dao.MemberDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.List"%>
<%@page import="vo.BoardVo"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dao.BoardCfDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	
 	String id = (String)session.getAttribute("id");
 	System.out.println(id);
	int gxCheck = 0;
	MemberDao mdao = MemberDao.getInstance();
	
	if (id == null) {
		%>
		<script>
			alert('해당 게시물은 로그인 후 이용할 수 있습니다.');
			location.href = '../../member/signIn.jsp';
		</script>
		<%
		return;
	}
	
 	gxCheck = mdao.checkGxAuth(id,"cf");
 	if(id.equals("admin")){
 		gxCheck=1;
 	}
 	
	if(gxCheck==0){
 		%>
 		<script>
 			alert('해당 게시판은 CrossFit 등록 회원만 이용할 수 있습니다.');
 			location.href='../../index.jsp';
 		</script>
 		<% 
 	}
 	
 
 %>
<!DOCTYPE html>
<html>
<head>
<title>Retrospect by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../../assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
</head>
<%

	
	String category = request.getParameter("category");
	String search = request.getParameter("search");

	category = (category == null) ? "" : category;
	search = (search == null) ? "" : search;

	BoardCfDao dao = BoardCfDao.getInstance();
	int totalCount = dao.getTotalCountfmCf(category,search);
	
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum == null || strPageNum.equals("")) {
		strPageNum = "1";
	}
	
	int pageNum = Integer.parseInt(strPageNum);
	
	// 한 페이지에 15개씩 가져오기
	int pageSize = 10;
	int startRow = (pageNum-1) * pageSize;
		
	List<BoardVo> list = null;
	if (totalCount > 0) {
		list = dao.getBoards(startRow, pageSize, category, search);
	}
%>
<body>
	<!-- Header -->
	<header id="header" class="skel-layers-fixed">
		<h1>
			<a href="index.html">WORKOUT</a>
		</h1>
		<a href="#nav">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="nav">
		<ul class="links">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="generic.html">Generic</a></li>
			<li><a href="elements.html">Elements</a></li>
			<li><a href="BoardMain.jsp">Cross Fit</a></li>
			<li><a href="board/AerialYoga/BoardMain.jsp">Aerial Yoga</a></li>
			<li><a href="board/Pilates/BoardMain.jsp">Pilates</a></li>
			
		</ul>
		<div class="links 3u 6u$(small) 12u$(xsmall)">
		<% if(id !=null){ %>
			<ul class="actions vertical small">
				<li><a href="../../MyPage.jsp" class = "button small">My Page</a>
				<li><a href="../../member/signOut.jsp" class="button special small">Sign Out</a></li>
			</ul>
			
			<%
		} else{
			%>
			<ul class="actions vertical small">
				<li><a href="member/signIn.jsp" class="button special small">Sign In</a></li>
				<li><a href="member/signUp.jsp" class="button small">Sign Up</a></li>
			</ul><%
		}
			%>
		</div>
	</nav>


<!-- Table -->
	<section>
		<p><h1>Cross Fit</h1>
		<div >
			<table class="table-wrapper">
				<thead>
					<tr>
						<%if(id.equals("admin")){
							%>
							<th>Check</th>
							<%
						} %>
						<th>No.</th>
						<th>Title</th>
						<th>Writer</th>
						<th>Date</th>
						<th>Read</th>
					</tr>
				</thead>
				<tbody>
				<%
					if(totalCount >0){
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
						
						for (BoardVo vo : list) {
							LocalDateTime dateTime = vo.getRegDate();
							String strRegDate = dateTime.format(formatter);
							
							
							%>
							
							<tr>
							<%if(id.equals("admin")){
								%><td><input type="checkbox" id="choice" value="<%=vo.getNum() %>">
									<label for="choice"></label>
								</td>
								<%
							}%>
								<td><%=vo.getNum() %></td>
								<td class="left"  onclick="location.href='ContentCf.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'">
									<%
									if (vo.getReLev() > 0) {
										%>
										<img src="../../images/level.gif" width="<%=vo.getReLev() * 10 %>" height="13">
										<span>ㄴ</span>
										<%
									}
									%>
									<%=vo.getTitle()%>
								</td>
								<td><%=vo.getName() %></td>
								<td><%=strRegDate %></td>
								<td><%=vo.getReadcount() %></td>
							</tr>
							<%
						}
					} else {
						%>
						<tr>
							<td colspan="5">게시판 글없음</td>
						</tr>
						<%
					}
					%>
					<tr>
					</tr>
				</tbody>
			</table>

			<div id="table_search">
				<form action="BoardMain.jsp" method="get">
					<select name="category">
						<option value="content" <%if (category.equals("content")) {%>
							selected <%}%>>글내용</option>
						<option value="subject" <%if (category.equals("subject")) {%>
							selected <%}%>>글제목</option>
						<option value="name" <%if (category.equals("name")) {%> selected
							<%}%>>작성자</option>
					</select>
					<div class="12u$">
						<input type="text" name="search" value="<%=search%>" class="input_box"> 
						<input type="submit" value="Search" class="btn small">
					</div>
				</form>
				<input type="button" value="Write" class="btn small" onclick="location.href='WriteForm.jsp?pageNum=<%=pageNum %>'">
				
			</div>
			
			<div id="page_control">
	<%
		if (totalCount > 0) {
			// 총 페이지 수 구하기
			//int pageCount = totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1);
			int pageCount = totalCount / pageSize;
			if (totalCount % pageSize > 0) {
				pageCount += 1;
			}
			
			// 화면에 보여줄 페이지번호의 갯수 설정
			int pageBlock = 5;
		
			
			// 페이지 블록의 시작페이지
			int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			// 페이지 블록의 끝페이지
			
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			
			%>
			<a href="BoardMain.jsp?pageNum=<%=startPage%>&category=<%=category %>&search=<%=search %>">[처음]</a>
			
			<%
			
			// [이전]
			if (startPage > pageBlock) {
				%>
				<a href="BoardMain.jsp?pageNum=<%=startPage - pageBlock %>&category=<%=category %>&search=<%=search %>">[이전]</a>
				<%
			}
					
			
			// 페이지블록 내에서의 시작페이지부터 끝페이지까지 번호출력
			for (int i=startPage; i<=endPage; i++) {
				%>
				<a href="BoardMain.jsp?pageNum=<%=i %>&category=<%=category %>&search=<%=search %>">
				<%
				if (i == pageNum) {
					%>
					<span style="font-weight: bold; color: red;"><%=i %></span>
					<%
				} else {
					%>
					<%=i %>
					<%
				}
				%>
				</a>
				<%
			}
			
			// [다음]
			if (endPage < pageCount) {
				%>
				<a href="BoardMain.jsp?pageNum=<%=startPage + pageBlock %>&category=<%=category %>&search=<%=search %>">[다음]</a>
				<%
			}
			%>
			<a href="BoardMain.jsp?pageNum=<%=pageCount%>&category=<%=category %>&search=<%=search %>">[끝]</a>
			<%
		} 
	%>
	</div>
			
			</section>

	<!-- footer -->
<jsp:include page="../../include/footer.jsp"/>

  <!-- Scripts -->
   <script src="../../assets/jquery-3.5.1.js"></script>
   <script src="../../assets/js/jquery.min.js"></script>
   <script src="../../assets/js/skel.min.js"></script>
   <script src="../../assets/js/util.js"></script>
   <script src="../../assets/js/main.js"></script>
   
</body>
</html>