<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="upload2" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 400px;">
			<caption><b>스프링 파일 여러개 업로드</b></caption>
			<tr>
				<th bgcolor="orange" >제목</th>
				<td>
					<input type="text" name="title" class="form-control" style="width: 150px;">
				</td>
			</tr>
			
			<tr>
				<th bgcolor="orange">업로드</th>
				<td>
					<input type="file" name="photo" class="form-control" style="width: 300px;" multiple="multiple">
				</td>
			</tr>	
			
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-info" style="width: 150px;">여러개전송</button>
				</td>
			</tr>		
		</table>
	</form>
</body>
</html>