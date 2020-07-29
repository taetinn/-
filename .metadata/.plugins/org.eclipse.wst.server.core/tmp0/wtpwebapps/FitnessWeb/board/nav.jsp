<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
%>
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
			<li><a href="../../index.jsp">Home</a></li>
			<li><a href="generic.html">Generic</a></li>
			<li><a href="elements.html">Elements</a></li>
			<li><a href="board/CrossFit/BoardMain.jsp">Cross Fit</a></li>
			
		</ul>
		<div class="links 3u 6u$(small) 12u$(xsmall)">
		<% if(id !=null){ %>
			<ul class="actions vertical small">
				<li><a href="/MyPage.jsp" class = "button small">My Page</a>
				<li><a href="/member/signOut.jsp" class="button special small">Sign Out</a></li>
			</ul>
			
			<%}
			else if(id.equals("admin")){%>
			<ul class="actions vertical small">
				<li><a href="../../Management.jsp" class = "button small">Manage</a>
				<li><a href="../../member/signOut.jsp" class="button special small">Sign Out</a></li>
			</ul>
			<% 				
			} else{
			%>
			<ul class="actions vertical small">
				<li><a href="/member/signIn.jsp" class="button special small">Sign In</a></li>
				<li><a href="/member/signUp.jsp" class="button small">Sign Up</a></li>
			</ul><%
		}
			%>
		</div>
	</nav>