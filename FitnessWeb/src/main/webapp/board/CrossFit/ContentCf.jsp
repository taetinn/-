<%@page import="vo.FileVo"%>
<%@page import="java.util.List"%>
<%@page import="vo.BoardVo"%>
<%@page import="dao.BoardCfDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String id = (String)session.getAttribute("id");	
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	BoardCfDao dao = BoardCfDao.getInstance();
	dao.updateReadCnt(num);
	
	BoardVo vo = dao.getAllInfosByNum(num);
	List<FileVo> fileList = vo.getFileList();
	
	String cntnt = "";
	if(vo.getContent() !=null){
		cntnt = vo.getContent().replace("\r\n", "<br>");
		
	}
%>
<body>
<jsp:include page="../../board/nav.jsp"/>

	<article>
		
	<h1>Cross Fit</h1>
		
	<table id="notice">
		
		<tr>
			<th scope="col" width="200">No.</th>
			<td width="500" style="text-align: left;"><%=vo.getNum() %></td>
		</tr>
		<tr>
			<th scope="col">Read</th>
			<td style="text-align: left;"><%=vo.getReadcount() %></td>
		</tr>
		<tr>
			<th scope="col">Writer</th>
			<td style="text-align: left;"><%=vo.getName() %></td>
		</tr>
		<tr>
			<th scope="col">Date</th>
			<td style="text-align: left;"><%=vo.getRegDate() %></td>
		</tr>
		<tr>
			<th scope="col">Title</th>
			<td style="text-align: left;"><%=vo.getTitle() %></td>
		</tr>
		<tr>
			<th scope="col">Files</th>
			<td style="text-align: left;">
				<%
				if (fileList != null) {
					for (FileVo fileVo : fileList) {
						%>
						<a href="download.jsp?uuid=<%=fileVo.getUuid() %>">
						<%=fileVo.getFilename() %><br>
						</a>
						<%
					}
				}
				%>
			</td>
		</tr>
		<tr>
			<th scope="col">글내용</th>
			<td style="text-align: left;"><%=cntnt %></td>
		</tr>
	</table>

	<div id="table_search">
		<%
		// 로그인 아이디와 글작성자 아이디(이름)가 같으면 
		if (id.equals(vo.getName())) {
			%>
			<button type="button" onclick="location.href='ModifyForm.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'">Modify</button>
			<button type="button" onclick="remove()">Remove</button>
			<%
		}
		%>
		<button type="button" onclick="location.href='ReplyForm.jsp?reRef=<%=vo.getReRef() %>&reLev=<%=vo.getReLev() %>&reSeq=<%=vo.getReSeq() %>&pageNum=<%=pageNum %>'">Reply</button>
		<button type="button" onclick="location.href='BoardMain.jsp?pageNum=<%=pageNum %>'">Return to List</button>
	</div>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
		
	</article>

	<!-- footer -->
<jsp:include page="../../include/footer.jsp"/>

  <!-- Scripts -->
   <script src="../../assets/jquery-3.5.1.js"></script>
   <script src="../../assets/js/jquery.min.js"></script>
   <script src="../../assets/js/skel.min.js"></script>
   <script src="../../assets/js/util.js"></script>
   <script src="../../assets/js/main.js"></script>
   <script>
   function remove() {
		var result = confirm('<%=vo.getNum() %>번 글을 정말 삭제하시겠습니까?');
		if (result) {
			location.href = 'Delete.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>';
		}
	}
   </script>
</body>
</html>