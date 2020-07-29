<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<!DOCTYPE html>
<html>
<head>
<%-- head 영역  include head.jsp --%>
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
</head>
<body>
<div id="wrap">
	<%-- header 영역  include top.jsp --%>
	<jsp:include page="/WEB-INF/views/include/top.jsp" />

	<div class="clear"></div>
	<div id="sub_img_center"></div>
	
	<div class="clear"></div>
	<jsp:include page="/WEB-INF/views/include/board_submenu.jsp"/>
	
	<article>
		
	<h1>파일 게시판 Content</h1>
		
	<table id="notice">
		<tr>
			<th scope="col" width="200">글번호</th>
			<td width="500" style="text-align: left;">${ boardVo.num }</td>
		</tr>
		<tr>
			<th scope="col">조회수</th>
			<td style="text-align: left;">${ boardVo.readcount }</td>
		</tr>
		<tr>
			<th scope="col">작성자</th>
			<td style="text-align: left;">${ boardVo.name }</td>
		</tr>
		<tr>
			<th scope="col">작성일</th>
			<td style="text-align: left;"><javatime:format value="${ board.regDate }" pattern="yyyy.MM.dd"/></td>
		</tr>
		<tr>
			<th scope="col">글제목</th>
			<td style="text-align: left;">${ boardVo.subject }</td>
		</tr>
		<tr>
			<th scope="col">파일</th>
			<td style="text-align: left;">
				
				<c:if test="${ not empty attachList }"><%-- ${ not empty boardVo.attachList } --%>
					<c:forEach var="attach" items="${ attachList }">
						<a href="download.do?uuid=${ attach.uuid }">
							${ attach.filename }
						</a><br>
					</c:forEach>
				</c:if>
				
			</td>
		</tr>
		<tr>
			<th scope="col">글내용</th>
			<td style="text-align: left;">${ boardVo.content }</td>
		</tr>
	</table>

	<div id="table_search">
		<%-- 로그인 아이디와 글작성자 아이디(이름)가 같으면  --%>
		<c:if test="${ not empty id  and  id eq boardVo.name }">
			<button type="button" onclick="location.href='fileModifyForm.do?num=${ boardVo.num }&pageNum=${ pageNum }'">글수정</button>
			<button type="button" onclick="remove()">글삭제</button>
		</c:if>
		
		<button type="button" onclick="location.href='replyWriteForm.do?reRef=${ boardVo.reRef }&reLev=${ boardVo.reLev }&reSeq=${ boardVo.reSeq }&pageNum=${ pageNum }'">답글쓰기</button>
		<button type="button" onclick="location.href='fileNotice.do?pageNum=${ pageNum }'">목록보기</button>
	</div>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
		
	</article>
    
	<div class="clear"></div>
	<%-- footer 영역  include bottom.jsp --%>
	<jsp:include page="/WEB-INF/views/include/bottom.jsp"/>
</div>

<script>
	function remove() {
		var result = confirm('${ boardVo.num }번 글을 정말 삭제하시겠습니까?');
		if (result) {
			location.href = 'fileDelete.do?num=${ boardVo.num }&pageNum=${ pageNum }';
		}
	}
</script>
</body>
</html>   





