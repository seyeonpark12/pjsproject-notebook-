<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2>JSTL연산자 연습</h2>

	<!-- 변수선언 -->
	<c:set var="su1" value="7"/>
	<c:set var="su2" value="4"/>
	
	<b>두 변수값 출력(su1:${su1},su2:${su2})</b>
	
	<table class="table table-bordered" style="width: 400px;">
		<tr>
			<th width="250">\${su1+su2}</th>
			<td>
				${su1+su2}
			</td>
		</tr>
		
		<tr>
			<th width="250">\${su1-su2}</th>
			<td>
				${su1-su2}
			</td>
		</tr>
		
		<tr>
			<th width="250">\${su1*su2}</th>
			<td>
				${su1*su2}
			</td>
		</tr>
		
		<tr>
			<th width="250">\${su1/su2}</th>
			<td>
				${su1/su2}
			</td>
		</tr>
		
		<tr>
			<th width="250">\${su1 div su2}</th>
			<td>
				${su1 div su2}
			</td>
		</tr>
		
		<tr>
			<th width="250">\${su1%su2}</th>
			<td>
				${su1%su2}
			</td>
		</tr>
		
		<tr>
			<th width="250">\${su1 mod su2}</th>
			<td>
				${su1 mod su2}
			</td>
		</tr>
		
		<tr>
			<th>su1증감</th>
			<td>
				증감전 su1: <c:out value="${su1} "></c:out> <br>
				<c:set var="su1" value="${su1+1}"></c:set>
				증감후 su1: ${su1}
			</td>
		</tr>
	</table>
</body>
</html>