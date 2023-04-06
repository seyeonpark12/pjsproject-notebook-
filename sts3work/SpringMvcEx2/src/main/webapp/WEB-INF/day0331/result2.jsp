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
<c:set var="tot" value="${java+spring }"/>
<c:set var="avg" value="${tot/2 }"/>

<h1>result2.jsp입니다</h1>
<h1>HelloController 로부터 포워드</h1>
<b>자바 점수: ${java }</b>
<b>스프링 점수: ${spring }</b>
<b>총점: ${tot }</b>
<b>평균: ${avg }</b>


</body>
</html>