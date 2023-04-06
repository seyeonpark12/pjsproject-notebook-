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
<script type="text/javascript">

	$(function(){
		
		$("#btn1").click(function(){
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"list1",
				success:function(res){
					
					$("#out1").empty();
					$("#out1").append("이름: "+res.name+"<br>주소: "+res.addr+"<br>핸드폰번호"+res.hp);
					
				}
			});
		});
	})
</script>
</head>

<body>
	<h3 class="alert alert-info">Ex1 에제</h3>
	<br>
	<button type="button" id="btn1">list1 json데이타 출력하기</button>
	<br>
	
	<div id="out1"></div>
</body>
</html>