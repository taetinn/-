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
	<button type="button" id="btnStart">시작</button>
	<button type="button" id="btnStop">중지</button>
	
	<div id="container">
		<img src="fruit1.jpg">
		<img src="fruit2.jpg">
		<img src="fruit3.jpg">
		<img src="fruit4.jpg">
		<img src="fruit5.jpg">
	</div>

<script src="../js/jquery-3.5.1.js"></script>
<script>
	var intervalId;

	$('button#btnStart').on('click', function () {
		//$('img').prop('width', 250);
		
		intervalId = setInterval(function () {
			$('img').first().appendTo('div#container');
			//$('div#container').append($('img').first());
		}, 1000);
	});
	
	$('button#btnStop').on('click', function () {
		clearInterval(intervalId);
	});
</script>
</body>
</html>








