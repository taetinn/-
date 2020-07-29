<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#container {
		border: 1px solid red;
	}
</style>
</head>
<body>
	<div>div0</div>
	<div>div1</div>
	<div>div2</div>
	
	<h1>heading0</h1>
	<h1>heading1</h1>
	<h1>heading2</h1>

<script src="../js/jquery-3.5.1.js"></script>
<script>
	// 이벤트 on()  click()  mouseover() ...
	// div를 클릭하면 안에있는 텍스트 뒤에 '*'이 추가됨
	$('div').click(function () {
		// 이벤트 핸들러 함수정의 안에서 this는
		// 이벤트 소스(이벤트가 발생한 대상 객체)가 됨
		$(this).append('*');
	});
	
	// h1에 마우스를 올리면 안에있는 테스트 뒤에 '+'가 추가됨
	$('h1').mouseover(function () {
		$(this).append('+');
	});
	
</script>
</body>
</html>








