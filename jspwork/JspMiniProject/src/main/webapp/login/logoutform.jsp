<%@page import="data.dao.ShopDao"%>
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
   String myid=(String)session.getAttribute("myid");
   MemberDao dao=new MemberDao();
   
   //아이디에 따른 이름 얻어오기
   String name=dao.getName(myid);
   
%>

<div>
   <img src="image2/14.jpg">
   <br><br>
   <b style="margin-left: 120px;"><%=name%>님 환영합니다</b> &nbsp;&nbsp;&nbsp;
   <button type="button" class="btn btn-danger" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
</div>
</body>
</html>