<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글자수<span></span></h1>
	<textarea rows="5" cols="70"></textarea>
<script src="../js/jquery-3.5.1.js"></script>
<script>

	//글자수 150자 제한 안내하기
	$('textarea').keyup(function(){
		var inputLength = $(this).val().length;
		$('span').html(inputLength);
		var remain = 150- inputLength;
		
		$('span').html(remain);
		
		//remain 글자수가 0보다 작으면  span내의 글자색 red로 수정
		//remain 글자수가 0이상이면 다시 black
		if(remain<0){
			$('span').css('color','red);
		}else{
			$('span').css('color','balck');
		}
	});
	

	
</script>
</body>
</html>








