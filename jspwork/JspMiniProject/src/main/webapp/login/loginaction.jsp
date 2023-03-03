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
   String pass=request.getParameter("pass");
   String cbsave=request.getParameter("cbsave");
   
   MemberDao dao=new MemberDao();
   boolean b=dao.isIdPassCheck(id, pass);
   
   //아이디와 비번이 맞으면 3개의 세션을 저장하고 로그인메인으로 이동
   if(b){
      
      //세션유지시간(생략시 30분)
      session.setMaxInactiveInterval(60*60*8);
      session.setAttribute("loginok", "yes");
      session.setAttribute("myid", id);
      session.setAttribute("saveok",cbsave==null?null:"yes");
      
      //로그인메인이동
      response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
   }else{%>
      
      <script type="text/javascript">
         alert("아이디와 비번이 맞지않습니다");
         history.back();
      </script>
   <%}
   
   
%>
</body>
</html>