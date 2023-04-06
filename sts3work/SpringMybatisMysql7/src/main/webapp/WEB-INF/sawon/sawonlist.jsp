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
 	
	<h2 style="margin: 50px 20px;"><b>사원리스트</b></h2>
	
	<c:if test="${totalCount==0}">
		<h3 class="alert alert-info">사원이 없습니다</h3>
	</c:if>
	

	<c:if test="${totalCount>0}">
		<h4 class="alert alert-info" style="width: 200px; margin: 50px; 50px;">사원은 총 ${totalCount}명이 있습니다 </h4>
		
		<hr>
		
		<div style="width: 800px; margin:50px 20px; text-align: cemter;">
			<form action="list" class="form-inline">
				<select name="title" class="form-control" style="width: 120px;">
					<option value="name" ${title=='name'?"selected":""} >이름</option>
					<option value="buseo" ${title=='buseo'?"selected":""} >부서</option>
					<option value="driver" ${title=='driver'?"selected":""} >운전면허</option>
				</select>
				
				<input type="text" name="search" class="form-control" placeholder="검색단어" style="width: 200px;" 
				value="${search }">
				
				<button type="submit" class="btn btn-info">검색</button>
			</form>
		
		</div>
		
		<table class="table table-bordered" style="margin: 50px 20px; width: 800px;;">
		<tr>
			<th bgcolor="pink">번호</th>
			<th bgcolor="pink">이름</th>
			<th bgcolor="pink">사진</th>
			<th bgcolor="pink">부서</th>
			<th bgcolor="pink">운전면허</th>
			<th bgcolor="pink">가입일</th>
			<th bgcolor="pink">비고</th>
		</tr>
		
			<c:forEach var="list" items="${list}" varStatus="i">
		<tr>
				<td align="center">${i.count} </td>
				<td align="center">${list.name} </td>
				<td align="center">
					<img src="../photo/${list.image }" style="width: 50px;">
				</td>
				<td align="center">${list.buseo} </td>
				<td align="center">${list.driver} </td>
				<td align="center">${list.ipsaday} </td>
				<td align="center">
					<button type="button" class="btn btn-info" onclick="location.href='updateform?num=${list.num}'">수정</button>
					<button type="button" class="btn btn-danger" onclick="location.href='delete?num=${list.num}'">삭제</button>
				</td>
		</tr>
			</c:forEach>
	</table>
</c:if>
	
	
	<button type="button" class="btn btn-info" style="margin-left: 50px; margin-top: 20px;"  onclick="location.href='addform'">사원추가</button>
</body>
</html>