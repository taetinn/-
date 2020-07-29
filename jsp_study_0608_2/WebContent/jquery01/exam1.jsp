<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button type="button" id="btn">button</button>
	<h1>TITLE</h1>
	<h1 id="aa">TITLE</h1>
	<h1 class="bb">TITLE</h1>
	<p>Main Content</p>


	<script src="../js/jquery-3.5.1.js"></script>
	<script>
		//메소드는 계속 체이닝해서 이어나갈 수 있음(메소드().메소드().메소드(). 이런식으로)
		//CSS선택자 문법과 유사 => 전체* 태그명 아이디 클래스 선택자
		//원래 정석은 jQuery()/.. 귀찮으니까 $ 사용
		$('#btn').click(function(){
			$('*').css('color','orange');
			$('h1').css('color','red');
			$('#aa').css('color','blue');
			$('.bb').css('color','green');
			
			
		});
		
	</script>
</body>
</html>