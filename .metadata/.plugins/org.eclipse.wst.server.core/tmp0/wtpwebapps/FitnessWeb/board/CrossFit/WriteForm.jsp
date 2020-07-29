<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Retrospect by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../../assets/css/main.css" />
</head>
<%
	String id= (String) session.getAttribute("id");
	String pageNum = request.getParameter("pageNum");
%>
<body>
	<jsp:include page="../../board/nav.jsp" />

	<section id="four" class="wrapper style2 special">
	<h1>Cross Fit</h1>
		<form action="WritePro.jsp" method="post"
			enctype="multipart/form-data" name="frm">
			<input type="hidden" name="name" value=<%=id %>>
			<table>
			<tr>
				<th>Title</th>
				<td style="text-align: left;">
					<input type="text" name="title">
				</td>
			</tr>
			<tr>
				<th>File</th>
				<td style="text-align: left;">
					<button type="button" id="btnAddFile" class ="small">Add File</button>
					<div id="fileBox">
						<div>
							<input type="file" name="filename"> <span
								class="fileDelete">x</span>
						</div>
				</td>
				
			</tr>
			<tr>
				<th scope="col">Contents</th>
				<td style="text-align: left;">
					<textarea rows="13" cols="40" name="content"></textarea>
					</td>
			</tr>
			</table>
			
			<div style="tetx-align: right;">
				<button type="submit">Write</button>
				<button type="reset">Rewrite</button>
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
	var fileCnt = 1;

	// 정적 이벤트 바인딩
	$('button#btnAddFile').click(function (event) {
		if (fileCnt >= 3) {
			alert('No more add');
			return;
		}
		
		var str = '<div><input type="file" name="filename"><span class="fileDelete">X</span></div>';
		
		$('div#fileBox').append(str);
		fileCnt++;
	});
	
	$('div#fileBox').on('click', 'span.fileDelete', function (event) {
		$(this).parent().remove(); // empty()는 안쪽요소만 비움
		fileCount--;
	});
	</script>
</body>
</html>