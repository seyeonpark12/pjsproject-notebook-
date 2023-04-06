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
	<form action="update" method="post">
	<!-- hidden -->
	<input type="hidden" name="num" value="${dto.num }">
		<table class="table table-bordered" style="width: 350px;">
			<caption><b>차정보수정</b></caption>
			<tr>
				<th bgcolor="pink" width="100">자동차명</th>
				<td>
					<input type="text" name="carname" size="10" required="required" value="${dto.carname }">
				</td>
			</tr>
			
			<tr>
				<th bgcolor="pink" width="100">가격</th>
				<td>
					<input type="text" name="carprice" size="10" required="required" value="${dto.carprice }">
				</td>
			</tr>
			
			<tr>
				<th bgcolor="pink" width="100">색상</th>
				<td>
					<input type="color" name="carcolor" size="10" required="required" value="${dto.carcolor }">
				</td>
			</tr>
			
			<tr>
				<th bgcolor="pink" width="100">구입일</th>
				<td>
					<input type="text" name="carguip" size="10" required="required" value="${dto.carguip }">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-default">DB수정</button>
					<button type="button" class="btn btn-default" onclick="location.href='list'">목록</button>
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>