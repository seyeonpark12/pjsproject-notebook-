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
<h2>사원폼</h2>
<form action="read1" method="post">
사원명:	<input type="text" name="name" > <br>
부서명:	<input type="text" name="buseo" > <br>
급여   :	<input type="text" name="pay" > <br>
나이   :	<input type="text" name="age" > <br>
혈액형:	<input type="text" name="blood" > <br>
<button type="submit">제출</button>

</form>
</body>
</html>