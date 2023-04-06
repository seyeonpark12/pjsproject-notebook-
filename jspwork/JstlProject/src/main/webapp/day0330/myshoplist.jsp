<%@page import="myshop.model.MyshopDto"%>
<%@page import="java.util.List"%>
<%@page import="myshop.model.MyshopDao"%>
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
<%
	MyshopDao dao=new MyshopDao();
	List<MyshopDto> list=dao.getAllSangpums();
	request.setAttribute("list", list);
%>

	<div style="margin: 30px 30px;">
		<h3 class="alert alert-danger" style="width: 800px;">MyShop목록출력하기</h3>
		<br>
		
		<table class="table table-bordred" style="width: 800px;">
			<tr>
				<th width="50">No.</th>
				<th width="50">상품명</th>
				<th width="50">가격</th>
				<th width="50">입고일</th>
				<th width="50">등록일</th>
			</tr>
			
			<c:forEach var="a" items="${list}" varStatus="i" >
				<tr>
					<td>${i.count }</td>
					<td>
						<img style="width: 35px;" src="../image/${a.photo }.jpg">
						${a.sangpum }
					</td>
					<td>
					${a.price }
					</td>
					<td>${a.ipgoday }</td>
					<td>${a.writeday }</td>
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>