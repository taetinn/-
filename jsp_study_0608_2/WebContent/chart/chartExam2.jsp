<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.DeptEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	DeptEmpDao dao = DeptEmpDao.getInstance();

	List<List<Object>> list = dao.getDeptNameAndCount();
	//자바리스트를 json 배열리스트로 변환 --> gson
	Gson gson = new Gson();
	String str = gson.toJson(list);
	System.out.println(str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="pie_chart_div1" style="width: 900px; height: 500px;"></div>
	
	<script src="https://www.gstatic.com/charts/loader.js"></script>

	<script>
		// 구글 시각화 API를 로딩하는 메소드
		google.charts.load('current', {packages : [ 'corechart' ]});

		// 구글 시각화 API가 로딩이 완료되면,
		// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드
		google.charts.setOnLoadCallback(function (){
			
			//ajax로 차트를 그리기위한 데이터 가졍괴
			$.ajax({
				url : 'deptNameAndCount.jsp',
				success : function(data){
				pieChart1(data);
		
			}
	});
});
		
		//원형차트
		function pieChart1() {
			console.log(typeof arr);
			console.log(arr);
			
			var dataTable = google.visualization.arrayToDataTable(arr);
			
			var options = {
					title: '부서이름별 사원수'
			};
			
			var objDiv = document.getElementById('pie_chart_div1');
			var chart = new google.visualization.PieChart(objDiv);
			chart.draw(dataTable, options);
		}
	</script>
</body>
</html>