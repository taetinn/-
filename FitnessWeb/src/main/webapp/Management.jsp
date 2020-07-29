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
			
			<%}
			else if(id.equals("admin")){%>
			<ul class="actions vertical small">
				<li><a href="Management.jsp" class = "button small">Manage</a>
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