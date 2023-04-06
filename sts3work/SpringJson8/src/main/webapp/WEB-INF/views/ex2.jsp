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
<script type="text/javascript">
	$(function(){
		
		$("#btn").click(function(){
			
			$.ajax({
				
				type:"get",
				dataType:"json",
				url:"list2",
				success:function(res){
					
					$("#out").empty();
					$.each(res,function(index,items){
						
						$("#out").append("<img src='upload/"+items.photo+"'><br>");
						$("#out").append("제목: "+items.name+"<br><br>");
					})
				}
			});
		});
	})
</script>
<body>
	<h3 class="alert alert-info">Ex2 에제</h3>
	<br>
	<button type="button" id="btn">list2 json데이타 출력하기</button>
	<br>
	<img alt="" src="">
	<div id="out"></div>
</body>
</html>