<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<button type="button">button</button>
	<div ></div>


<script src="../js/jquery-3.5.1.js"></script>

<script> 
	$('button').click(function(){
		//Asynchronous Javascript and XML(JSON)
		$.ajax({
			url:'string2.jsp',
			data:{name : 'hong',age:20}, /* 객체 안 객체 */
			method : 'GET',
			success : function(data){
				console.log(typeof data)
				console.log(data);
				$('div').append(data);
			}
			
		});
		
	});


</script>
</body>
</html>