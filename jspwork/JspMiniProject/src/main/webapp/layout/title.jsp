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
<%
   //프로젝트 경로구하기
   String root=request.getContextPath();
%>
<body>
   <a href="<%=root%>" style="color: black;">
   <img src="image/t1.jpg" style="max-width: 400px; max-height: 100px;">
   Jsp&Jauery 미니프로젝트
   </a>
   
   <div style="float: right; padding-right: 100px">
   <%
      //로그인세션 얻기
      String loginok=(String)session.getAttribute("loginok");
      //아이디 얻기(name)
      String myid=(String)session.getAttribute("myid");
      MemberDao dao=new MemberDao();
      String name=dao.getName(myid);
      
      if(loginok==null){%>
         
         <button type="button" class="btn btn-success" style="width: 100px"
         onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
      <%}else{%>
         
         <b style="font-size: 12px"><%=name %>님 로그인중...</b>
         
         <button type="button" class="btn btn-danger" style="width: 100px"
         onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
      <%}
   %>
   </div>
</body>
</html>