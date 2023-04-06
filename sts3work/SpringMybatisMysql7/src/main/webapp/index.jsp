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
<!--   <a href="samsung/list">리스트</a> -->
     <button type="button" class="btn btn-info" style="width: 200px; margin:10px;" 
     onclick="location.href='samsung/list'">차량입고</button><br>
     
      <button type="button" class="btn btn-warning" style="width: 200px; margin:10px;"
     onclick="location.href='member/memberlist'">고객명단</button><br>
 
   <button type="button" class="btn btn-warning" style="width: 200px; margin:10px;"
     onclick="location.href='sawon/list'">사원명단</button><br>

</body>
</html>