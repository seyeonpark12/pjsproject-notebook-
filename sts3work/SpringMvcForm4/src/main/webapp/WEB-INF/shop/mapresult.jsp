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
	<h2>입력데이타 확인</h2>
	이름: ${name } <br>
	자바: ${java } <br>
	오라클: ${oracle } <br>
	스프링: ${spring } <br>

<c:set var="tot" value="${java+oracle+spring }"></c:set>
<c:set var="evg" value="${tot/3.0 }"></c:set>

총점: ${tot } <br>
합계: ${evg }
</body>
</html>