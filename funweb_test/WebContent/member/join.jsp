<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Transitive by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Generic - Transitive by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/assets/css/main.css" />
	</head>
	<body class="subpage">

		<!-- Header -->
		<jsp:include page="/include/top_header.jsp"/>

		<!-- Nav -->
		<jsp:include page="/include/top_nav.jsp"/>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="image fit">
							<img src="/images/pic01.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<h2>Lorem ipsum dolor</h2>
								<p>maecenas feugiat ex purus, quis volutpat lacus placerat</p>
							</header>
							<hr />
							<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada. Praesent in sem ex. Morbi mattis sapien pretium tellus venenatis, at egestas urna ornare.</p>
							<p>Vivamus fermentum nibh vel pharetra blandit. Cras a purus urna. Sed et libero ex. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse id hendrerit felis. Nulla viverra tempor dui at congue. Pellentesque quis nulla ornare, congue nisi id, finibus nulla. Aliquam sit amet hendrerit purus. Donec libero massa, posuere fermentum eros sit amet, maximus fringilla augue. Maecenas at rhoncus lorem. Vivamus ultricies consequat est, efficitur convallis libero. Vivamus rutrum semper mauris, vitae consequat eros tempor ac. Pellentesque et ornare sapien</p>
						
						
						
						
							<!-- Table -->
							<h3>Table</h3>

							<h4>Default</h4>
							<div class="table-wrapper">
								<form id="join" action="joinPro.jsp" method="post" name="frm"> 
								<table>
									<tbody>
										<tr>
											<th width="300">User ID</th>
											<td>
												<input name="id" type="text" class="id">
												<input type="button" value="ID중복확인" class="dup" onclick="winopen()">
											</td>
										</tr>
										<tr>
											<th>Password</th>
											<td><input name="passwd" type="password" class="pass"></td>
										</tr>
										<tr>
											<th>Retype Password</th>
											<td><input name="passwd2" type="password" class="pass"></td>
										</tr>
										<tr>
											<th>Name</th>
											<td><input name="name" type="text" class="nick"></td>
										</tr>
										<tr>
											<th>E-Mail</th>
											<td><input name="email" type="email" class="email" ></td>
										</tr>
										<tr>
											<th>Retype E-mail</th>
											<td><input name="email2" type="email" class="email"></td>
										</tr>
										<tr>
											<th>Address</th>
											<td><input name="address" type="text" class="address"></td>
										</tr>
										<tr>
											<th>Phone Number</th>
											<td><input name="tel" type="tel" class="phone"></td>
										</tr>
										<tr>
											<th>Mobile Phone Number</th>
											<td><input name="mtel" type="tel" class="mobile"></td>
										</tr>
										<tr>
											<td colspan="2">
												<input type="submit" value="회원가입" class="submit">
												<input type="reset" value="새로작성" class="cancel">
											</td>
										</tr>
									</tbody>
								</table>
								</form>
							</div>
						
						</div>
					</div>
				</div>
			</section>

		<!-- Four -->
			<section id="four" class="wrapper style3">
				<div class="inner">

					<header class="align-center">
						<h2>Morbi interdum mollis sapien</h2>
						<p>Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada. Praesent in sem ex. Morbi mattis sapien pretium tellus venenatis, at egestas urna ornare.</p>
					</header>

				</div>
			</section>

		<!-- Footer -->
		<jsp:include page="/include/bottom_footer.jsp"/>

		<!-- Scripts -->
		<jsp:include page="/include/bottom_scripts.jsp"/>

	</body>
</html>