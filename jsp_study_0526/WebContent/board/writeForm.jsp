<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <form name ="frm" action="writePro.jsp" method="post" onsubmit="return check()"> <!-- return false : 기본동작은 안하는 것 -->
	<table border="1">
		<tr>
			<th>글쓴이</th>
			<td><input type = "text" name = "name"></td>
		</tr>
		<tr>
			<th>비밀먼호</th>
			<td><input type = "password" name = "passwd"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type = "text" name = "subject" value=""></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" cols ="40" rows="13"></textarea></td> <!-- rows : 행이 n개 , cols : 글자 개수 -->
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value = "글쓰기">	<!-- 자신과 가장 가까운 form 범위안에  input 값들을 submit, reset -->		
				<input type="reset" value = "새로쓰기">	<!-- 누르면 각 input요소의 value값으로 reset -->
				<input type="button" value ="글목록">
			</td>
		</tr>
	</table>
</form>


<script>
	function check(){
		if(frm.name.value ==''){ //or frm.name.value.length==0 // 차이는 거의 없으나 연산속도는 숫자비교가 조금 더 빠름
			alert('글쓴이를 입력하세요.');
			frm.name.focus();
			return false; // action이 발생안함.
		}
		if(frm.passwd.value ==''){ 
			alert('비밀번호를 입력하세요.');
			frm.passwd.focus();
			return false; // action이 발생안함.
		}
		if(frm.subject.value ==''){ //or frm.name.value.length==0 // 차이는 거의 없으나 연산속도는 숫자비교가 조금 더 빠름
			alert('제목을 입력하세요.');
			frm.subject.focus();
			return false; // action이 발생안함.
		}
		if(frm.content.value ==''){ //or frm.name.value.length==0 // 차이는 거의 없으나 연산속도는 숫자비교가 조금 더 빠름
			alert('내용을 입력하세요.');
			frm.content.focus();
			return false; // action이 발생안함.
		}
	}

</script>
</body>
</html>