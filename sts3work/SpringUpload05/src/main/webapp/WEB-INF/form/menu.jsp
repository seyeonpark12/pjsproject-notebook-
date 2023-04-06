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
<div style="margin-left: 200px; margin-top: 50px;">
	<button type="button" class="btn btn-warning" onclick="location.href='shop/form1'">각각읽기</button>
	<button type="button" class="btn btn-warning" onclick="location.href='shop/form2'">Dto읽기</button>
	<button type="button" class="btn btn-warning" onclick="location.href='shop/form3'">Map읽기</button>
	<hr size="5">
	<button type="button" class="btn btn-warning" onclick="location.href='board/uploadform1'">이미지 한개업로드</button>
	<button type="button" class="btn btn-warning" onclick="location.href='board/uploadform2'">이미지 여러개업로드</button>
</div>
</body>
</html>