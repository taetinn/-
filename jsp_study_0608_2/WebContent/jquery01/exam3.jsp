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
	<img src="fruit1.jpg">
	<img src="fruit2.jpg">
	<img src="fruit3.jpg">

	<script src="../js/jquery-3.5.1.js"></script>
	<script>
	/* on(event,function) : click사용하고플때, */
		$('button').on('click', function(){
			//속성관련함수 : attr() :  디자이너관점에  더 가까운, prop() : 개발자관점에 더 가까움 ,boolean데이터 취급 가능
			var str = $('img').attr('src');
			console.log(str);
			
			//$('img').attr('width',200);
		/* 	
			$('img').attr('width',function(){
				return (index+1)*100;
			}); */
			
			$('img').attr('width',200).attr('height',150);
			
		/* 	var a= function() { alert('a has called.');} // js는 함수형정의도 가능해서 함수정의를 값취급 가능
			a();
			
			var b={'aa':10,'bb':true,'cc':3.14. 'dd':function(){alert('dd has called.')}}
			console.log(b.aa);
			b.dd;
			 */
			
		});
	</script>
</body>
</html>