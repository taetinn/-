<%@page import="java.util.List"%>
<%@page import="vo.BoardVo"%>
<%@page import="dao.BoardCfDao"%>
<%@page import="vo.FileVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cross Fit : Modify</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../../assets/css/main.css" />
</head>
<%
	String id = (String) session.getAttribute("id");
	if (id == null) {
		response.sendRedirect("../../member/signIn.jsp");
		return;
	}

	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardCfDao boardCfDao = BoardCfDao.getInstance();
	
	BoardVo boardVo = boardCfDao.getAllInfosByNum(num);
	List<FileVo> fileList = boardVo.getFileList();

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
			<li><a href="board/CrossFit/BoardMain.jsp">Cross Fit</a></li>
			<li><a href="../AerialYoga/BoardMain.jsp">Aerial Yoga</a></li>
			<li><a href="../Pilates/BoardMain.jsp">Pilates</a></li>
			
		</ul>
		<div class="links 3u 6u$(small) 12u$(xsmall)">
		<% if(id !=null){ %>
			<ul class="actions vertical small">
				<li><a href="MyPage.jsp" class = "button small">My Page</a>
				<li><a href="../../member/signOut.jsp" class="button special small">Sign Out</a></li>
			</ul>
			
			<%
		} else{
			%>
			<ul class="actions vertical small">
				<li><a href="../../member/signIn.jsp" class="button special small">Sign In</a></li>
				<li><a href="../../member/signUp.jsp" class="button small">Sign Up</a></li>
			</ul><%
		}
			%>
		</div>
	</nav>

	<section id="four" class="wrapper style2 special">
	<h1>Cross Fit : Modify </h1>
	<form action="ModifyPro.jsp" method="post" enctype="multipart/form-data" name ="frm">
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name= "name" value="<%=id %>">
	<table id="notice">
		
		<tr>
			<th scope="col">Title</th>
			<td style="text-align: left;">
			<input type="text" name="title" value="<%=boardVo.getTitle() %>">
</td>
		</tr>
		<tr>
			<th scope="col">Files</th>
			<td style="text-align: left;">
				<button type="button" id="btnAddFile">Add Files</button>
				<div id="fileBox">
					<div id="oldFileBox">
					<%	
							for (FileVo fileVo : fileList) {
								%>
								<input type="hidden" name="oldfile" value="<%=fileVo.getUuid() %>">
								<div>
								<%=fileVo.getFilename() %>
								<span class="delete-oldfile">x</span>
								</div>
								<%
							}
					%>
					</div>
					<div id="newFileBox"></div>
				</div>	
			</td>
		</tr>
		<tr>
			<th scope="col">Contents</th>
			<td style="text-align: left;">
				<textarea rows="13" cols="40" name="content"><%=boardVo.getContent() %></textarea>
			</td>
		</tr>
	</table>

	<div id="table_search">
		<button type="submit">Modify</button>
		<button type="reset">ReWrite</button>
		<button type="button" onclick="location.href='BoardMain.jsp?pageNum=<%=pageNum %>'">Return</button>
	</div>
	</form>	
	</section>


<!-- footer -->
	<jsp:include page="../../include/footer.jsp" />

	<!-- Scripts -->
	<script src="../../assets/jquery-3.5.1.js"></script>
	<script src="../../assets/js/jquery.min.js"></script>
	<script src="../../assets/js/skel.min.js"></script>
	<script src="../../assets/js/util.js"></script>
	<script src="../../assets/js/main.js"></script>
	<script>
		var fileCnt = <%=fileList.size() %>
		
		$('button#btnAddFile').click(function (event) {
			if (fileCnt >= 3) {
				alert('No more add file');
				return;
			}
			var str = '<div><input type="file" name="filename"><span class="delete-addfile">x</span></div>';
			$('div#newFileBox').append(str);
			fileCnt++;
		});
		
		$('div#newFileBox').on('click', 'span.delete-addfile', function (event) {
			$(this).parent().remove(); // empty()는 안쪽요소만 비움
			fileCnt--;
		});
		
		$('span.delete-oldfile').click(function () {
			$(this).parent().prev().prop('name', 'delfile');
			$(this).parent().remove();
			fileCnt--;
		});
	</script>
	
</body>
</html>