<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../include/head.jsp"/>
</head>
<body>
<jsp:include page="../include/nav.jsp"></jsp:include>

<%-- 	<jsp:include page="../include/Nav.jsp"/> --%>
	
 	<!-- Form -->
	<section>
		<form method="post" action="signinPro.jsp">
			<fieldset>
				<div class="row uniform 50%">
					<div class="6u 12u$(xsmall)">
						<label>ID</label> 
						<input type="text" name="id" placeholder="id" />
						<label>PW</label>
						 <input type="password" name="passwd" placeholder="password" />
						 <input type="checkbox" name="keepLogin" value="true" id="keepLogin">
						<label for="keepLogin">로그인 상태 유지</label>
					</div>
			</fieldset>
			<div class="3u 6u$(small) 12u$(xsmall)">
				<ul class="actions vertical small">
					<li><input type="submit" class="button special small" value="Sign In"></li>
					<li><a href="signUp.jsp" class="button alt small">Sign Up</a></li>
				</ul>
			</div>
			</div>
		</form>
	</section>
	
		<!-- Footer -->
 	<jsp:include page="../include/footer.jsp"/> 

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../assets/js/main.js"></script>
</body>
</html>