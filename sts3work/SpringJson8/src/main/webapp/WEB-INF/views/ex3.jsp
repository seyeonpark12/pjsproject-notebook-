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
		
		$("#title").keyup(function(e){
			
			if(e.keyCode == 13){
				
				var title=$(this).val();
				$.ajax({
					
					type:"get",
					dataType:"json",
					url:"list3",
					success:function(res){
						
						$.each(res,function(index,items){
							
							if(title==items.name){
								
								$("#result").empty();
								$("#result").append("<img src='upload/"+items.photo+"'><br>");
								$("#result").append("제목: "+items.name+"<br><br>");
								return false;
							}else{
								
								$("#result").empty();
								$("#result").append("<b>"+title+" 영화는 없습니다</b>");
							}
						});
					}
				});				
				
			}
		});
	});	
	</script>
<body>
	<div style="margin: 50px; 50px;">
		<h3 class="alert alert-info">3번예제</h3>
		<input type="text" id="title" name="title" >제목입력
		
	</div>
	
	<div id="result" style="margin-left: 50px; margin-top: 20px;">
	</div>
</body>
</html>