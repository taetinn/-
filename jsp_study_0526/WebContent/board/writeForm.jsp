<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <form name ="frm" action="writePro.jsp" method="post" onsubmit="return check()"> <!-- return false : �⺻������ ���ϴ� �� -->
	<table border="1">
		<tr>
			<th>�۾���</th>
			<td><input type = "text" name = "name"></td>
		</tr>
		<tr>
			<th>��и�ȣ</th>
			<td><input type = "password" name = "passwd"></td>
		</tr>
		<tr>
			<th>����</th>
			<td><input type = "text" name = "subject" value=""></td>
		</tr>
		<tr>
			<th>����</th>
			<td><textarea name="content" cols ="40" rows="13"></textarea></td> <!-- rows : ���� n�� , cols : ���� ���� -->
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value = "�۾���">	<!-- �ڽŰ� ���� ����� form �����ȿ�  input ������ submit, reset -->		
				<input type="reset" value = "���ξ���">	<!-- ������ �� input����� value������ reset -->
				<input type="button" value ="�۸��">
			</td>
		</tr>
	</table>
</form>


<script>
	function check(){
		if(frm.name.value ==''){ //or frm.name.value.length==0 // ���̴� ���� ������ ����ӵ��� ���ں񱳰� ���� �� ����
			alert('�۾��̸� �Է��ϼ���.');
			frm.name.focus();
			return false; // action�� �߻�����.
		}
		if(frm.passwd.value ==''){ 
			alert('��й�ȣ�� �Է��ϼ���.');
			frm.passwd.focus();
			return false; // action�� �߻�����.
		}
		if(frm.subject.value ==''){ //or frm.name.value.length==0 // ���̴� ���� ������ ����ӵ��� ���ں񱳰� ���� �� ����
			alert('������ �Է��ϼ���.');
			frm.subject.focus();
			return false; // action�� �߻�����.
		}
		if(frm.content.value ==''){ //or frm.name.value.length==0 // ���̴� ���� ������ ����ӵ��� ���ں񱳰� ���� �� ����
			alert('������ �Է��ϼ���.');
			frm.content.focus();
			return false; // action�� �߻�����.
		}
	}

</script>
</body>
</html>