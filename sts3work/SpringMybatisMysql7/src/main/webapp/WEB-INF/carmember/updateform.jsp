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
<form action="mupdate" method="post">
		<input type="hidden" name="num" value="${dto.num}">
		<table class="table table-bordered" style="width: 350px;">
			<caption><b>고객정보수정</b></caption>
			<tr>
				<th bgcolor="pink" width="100">고객명</th>
				<td>
					<input type="text" name="name" size="10" required="required" value="${dto.name} ">
				</td>
			</tr>
			
			<tr>
				<th bgcolor="pink" width="100">핸드폰번호</th>
				<td>
					<input type="text" name="hp" size="10" required="required" value="${dto.hp} ">
				</td>
			</tr>
			
			<tr>
				<th bgcolor="pink" width="100">주소</th>
				<td>
					<input type="text" name="addr" size="10" required="required" value="${dto.addr} ">
				</td>
			</tr>
			

			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-default">DB저장</button>
					<button type="button" class="btn btn-default" onclick="location.href='memberlist'">목록</button>
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>