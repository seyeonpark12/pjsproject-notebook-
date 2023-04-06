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
	<c:set var="su1" value="7"/>
	<c:set var="su2" value="4"/>
	
	<c:if test="${su1>su2 }">
		<h2>숫자1이 더 크네요!!!</h2>
	</c:if>
	
	<c:if test="${su1<su2 }">
		<h2>숫자2이 더 크네요!!!</h2>
	</c:if>	
	
	<c:set var="nara" value="프랑스"/>
	
	<c:if test="${nara=='하와이'}">
		<h2>하와이는 훌라춤이 유명합니다</h2>
	</c:if>
	
	<c:if test="${nara=='프랑스'}">
		<h2>프랑스는 </h2>
	</c:if>	
	
</body>
</html>