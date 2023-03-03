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
   //세션에 저장된 loginok를 읽는다
   String loginok=(String)session.getAttribute("loginok");

   //로그아웃상태
   if(loginok==null){%>   
      
      <jsp:include page="loginform.jsp"></jsp:include>
   <%}else{%>
      
      <jsp:include page="logoutform.jsp"></jsp:include>
   <%}
%>
</body>
</html>