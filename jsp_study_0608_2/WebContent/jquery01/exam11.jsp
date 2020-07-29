<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
div { /* block은 width, height 강제 지정가능, inline에 직접 style 박아버리는게 가자 우선순위 */
	width: 50px;
	height: 50px;
	background-color:orange;
}
</style>
<body>
	<div></div>


	<script src="../js/jquery-3.5.1.js"></script>
	<script>
		$('div').click(function(){
			var width = $(this).css('width');//단위포함 string
			var height = $(this).css('height');
			console.log('width ='+width + ', height = '+height);
			console.log('width ='+parseInt(width) + ', height = '+parseInt(height));
			
			//{}객체의 각 필드명은 css속성으로 적용
			$(this).animate({
				width : parseInt(width)+50 ,
				height : paseInt(height) 
			},'slow');

		});
	</script>
</body>
</html>