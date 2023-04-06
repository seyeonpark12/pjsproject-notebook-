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
	<c:if test="${totalcount==0 }">
			
	</c:if>
	
	<c:if test="${totalcount>0 }">
		<h3 class="alert alert-info">총 ${totalcount }개의 자동차가 있습니다.</h3>
		
	<hr size="5">
	
		<table class="table table-bordered" style="width: 700px;">
			<tr>
				<th>No.</th>
				<th>자동차이름</th>
				<th>자동차색상</th>
				<th>자동차가격</th>
				<th>구입일</th>
			</tr>
			
			<c:forEach var="list" items="${list }" varStatus="i">
				<tr>
					<td>${ i.count}</td>
					<td>${list.carname }</td>
					<td>
						<div style="width: 20px; height: 20px; background-color:${list.carcolor}; border:1px solid gray "></div>
					</td>
					<td>
						<fmt:formatNumber value="${list.carprice }" type="currency"></fmt:formatNumber>
					</td>
					<td>${list.carguip }</td>
					<td>
						<button type="button" class="btn btn-info" onclick="location.href='updateform?num=${list.num}'">수정</button>
						<button type="button" class="btn btn-danger" onclick="location.href='delete?num=${list.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
	</table>
	</c:if>
	
	<button type="button" style="width: 100px;" class="btn btn-info" onclick="location.href='writeform'">차정보입력</button>
</body>
</html>