<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<%
	String id=request.getParameter("id");
	MemberDao dao=new MemberDao();
	
	//아이디에 따른 이름 얻어오기
	String name=dao.getName(id);
%>

<div>
	<img src="image2/11.png">
	<b><%=name%>님의 회원가입을 축하드립니다!!!</b>
	<br><br>
	<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
	<button type="button" class="btn btn-info" onclick="location.href='index.jsp'">home</button>
</div>
</body>
</html>