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
<h2>foreach문,forToken문</h2>

<c:forEach var="a" begin="1" end="20">
	[${a }]&nbsp;
</c:forEach>
<br>
<c:forEach var="a" begin="1" end="10" step="2">
	[${a }]&nbsp;
</c:forEach>

<%
	String [] mycolor={"red","pink","gray","green","yellow","magenta","orange"};
%>

	<c:set var="mycolor" value="<%=mycolor %>"/>
	
	<table class="table table-bordred" style="width:300px; ">
		<caption>전체출력</caption>
		<tr>
			<th>index</th><th>count</th><th>color</th>
		</tr>
		
		<c:forEach var="a" items="${mycolor }" varStatus="i">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td bgcolor=" ${a}">${a }</td>
			</tr>
			
		</c:forEach>
	</table>
	
	<c:set var="msg" value="장미,후리지아,디밀리아,제리늄,국화"/>
	${msg} <br>
	
	<h2>msg값을 컴마로 분리해서 출력</h2>
	<c:forTokens var="a" items="${msg }" delims="," varStatus="i">
		<h3>${i.count}:${a }</h3>
	</c:forTokens>
	
</body>
</html>