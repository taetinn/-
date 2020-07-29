<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:5px;
		padding:5px;
		border : 3px solid black;                                 
	}
	
</style>
</head>
<body>

	<h1>
		<a href ="http://www.naver.com">Naver</a>
	</h1>
<script src="../js/jquery-3.5.1.js"></script>
<script>
	//a턔끄를 클릭하면 css() background-color blue

	$('a').click(function(event){
		$(this).css('background-color','blue');
		
		//기본 기능 막기(a태그는 하이퍼링크 기능막기)
		event.preventDefault();
		
		//태그가 겹쳐있을 경우  부모요소로 전달을 막기
		event.stopPropagation();
		
		//return false;
		});
	//h1태그 클릭시 css(0) background-color red
	$('h1').click(function(){
		$(this).css('background-color','red');
		
	});
	

	
</script>
</body>
</html>








