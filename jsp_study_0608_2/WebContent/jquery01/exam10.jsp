<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div, p{
		display:none;
	}
</style>
</head>
<body>
	<h1>열기&닫기</h1>
	<div>
		<h1>Title1</h1>
		<p>Content1</p>
	</div>
	
	<h1>열기&닫기</h1>
	<div>
		<h1>Title2</h1>
		<p>Content2</p>
	</div>
<script src="../js/jquery-3.5.1.js"></script>
<script>
	//효과 관련 : show(), hide(), toggle()
	//			slideDown() slideUp() slideToggle()
	//			fadeIn()	fadeOut()	fadeToggle()
	
	//'h1' click event
	$('h1').click(function(){
	/* 	$(this).next().toggle('slow',function(){
			alert('효과 끝');
		}); //바로 다음 형제 요소에 대해 */
		
		$(this).next().fadeToggle();
	});

	
</script>
</body>
</html>








