<%@page import="java.util.Date"%>
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
	<c:set var="name" value="이지민"></c:set>
	<c:set var="age" value="24"></c:set>
	<c:set var="today" value="<%=new Date()%>"></c:set>
	
	<!-- 변수 출력 -->
	<!-- c:out이 변수 출력이지만 생략가능 -->
	<h2>이름: ${name}</h2>
	<h2>나이: <c:out value="${age }"></c:out></h2>
	<h2>날짜: ${today}</h2>
	
	<!-- pattern 을 이용한 fmt날짜 형식 -->
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm"/>
	
	<c:set var="money" value="6789000"></c:set>
	<c:set var="num1" value="123.45678"></c:set>
	
	
	<!-- jslt에서의 숫자출력양식 -->
	<pre>
		${money} <br>
		${num1} <br>
		
		<!-- 3자리마다 컴마 -->
		<fmt:formatNumber value="${money }" type="number"></fmt:formatNumber>
		
		
		<!-- 3자리마다 컴마와 화폐단위 -->
		<fmt:formatNumber value="${money }" type="currency"></fmt:formatNumber>
		
		<!-- pattern -->
		<fmt:formatNumber value="${num1}" pattern="0.00"></fmt:formatNumber>
		<fmt:formatNumber value="${num1}" pattern="0.##"></fmt:formatNumber>
	</pre>

</body>
</html>