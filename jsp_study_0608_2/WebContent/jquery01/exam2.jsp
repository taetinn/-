<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	div#container{
		border: 1px solid red;
	}

</style>

<body>

	<button type="button" id="btn">button</button>
	<div id="container">

	</div>

	<script src="../js/jquery-3.5.1.js"></script>
	<script>
	//정적 이벤트 바인딩
		$('button').on('click',function(){
			//동적 이벤트 바인딩: 기존에 없던 화면요소에 이벤트를 연결하는 것
			
			var newBtn = '<button type="button" class="mybtn">new button</button>';
			$('div#container').append(newBtn);
		});
		//동적 이벤트 바인딩: 기존에 없던 화면요소에 이벤트를 연결하는 것 
		//정적, 동적 이벤트는 따로 처리됨, 그래서 동적할 때는 따로 선언해두기
		//document : 현재 문서정보를 다 갖고있는 애
	$(document).on('click','button',function(){
		console.log("newbutton has been clicked.");
	});
	</script>
</body>
</html>