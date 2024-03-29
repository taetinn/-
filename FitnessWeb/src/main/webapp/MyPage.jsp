<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVo"%>
<%@page import="dao.BoardCfDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<title>Retrospect by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />

</head>
<%
	BoardCfDao dao = BoardCfDao.getInstance();
	MemberDao mDao = MemberDao.getInstance();
	MemberVo vo = mDao.getMemById(id);
	String dOrigin = vo.getRegDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	String dCase1 =vo.getRegDate().plusMonths(1).minusDays(1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	String dCase2 = vo.getRegDate().plusMonths(3).minusDays(1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	String dCase3 =  vo.getRegDate().plusYears(1).minusDays(1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	String[] gx = vo.getGxType();
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
			
		</ul>
		<div class="links 3u 6u$(small) 12u$(xsmall)">
		<% if(id !=null){ %>
			<ul class="actions vertical small">
				<li><a href="MyPage.jsp" class = "button small">My Page</a>
				<li><a href="member/signOut.jsp" class="button special small">Sign Out</a></li>
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
	
	<section class="table-wrapper">
		<div class="table-wrapper">
			<h3>My Information</h3>
			<table>
				<thead>
					<th>회원 번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>등급</th>
					<th>등록기간</th>
					<th>등록 GX</th> 
					<th>연락처</th>
					<th>주소</th>
				</thead>
				<tr>
					<td><%=vo.getNo()%></td>
					<td><%=vo.getId()%></td>
					<td><%=vo.getName()%></td>
					<td><%=vo.getGender()%></td>
					<td>
						<%
							if (vo.getAuth() == 2) {
						%>강사<%
							} else if (vo.getAuth() == 3) {
						%>회원<%
							}
						%>
					<td><%=dOrigin%> ~ <%
						if (vo.getPeriod().equals("1month")){ %>
						<%=dCase1%><%
						} else if (vo.getPeriod().equals("3month")) {%>
						<%=dCase2%><%
						} else if (vo.getPeriod().equals("1year")) {%>
						<%=dCase3%><%
						}%>
					</td>
					<td><%System.out.println(vo.toString());
						for(String s : gx){
							System.out.println(s);
							%><%=s %>/<%
						}
					%>
					</td>
					<td><%=vo.getPhone() %></td>
					<td><%=vo.getAddress() %></td>
				</tr>
			</table>
		</div>
	</section>
	
	<section>
		<div class="table-wrapper">
		<h3>Total Posts :</h3>
		<table>
		</table>
		
		</div>	
	</section>
	
	
	<input type="button" value="Withdrawal" class="btn small" onclick="location.href='member/WithdrawalPro.jsp'">
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>