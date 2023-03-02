<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
       <link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
   <link rel="stylesheet" type="text/css" href="menu/css/menu.css">
    
   <script type="text/javascript" src="menu/js/jquery.js"></script>
   <script type="text/javascript" src="menu/js/function.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<%
   //프로젝트 경로 구하기..절대경로
   String root=request.getContextPath();
%>
<body>
<div id="wrap">
      <div class="inner relative">
            <ul id="main-menu">
               <li class="current-menu-item"><a href="<%=root%>/index.jsp">홈</a></li>
               <li class="parent">
                  <a href="#">유저</a>
                  <ul class="sub-menu">
                     <li><a href="<%=root%>/index.jsp?main=login/loginmain.jsp"><i></i>로그인</a></li>
                     <li><a href="<%=root%>/index.jsp?main=member/addform.jsp"><i></i>회원가입</a></li>
                     <li><a href="<%=root%>/index.jsp?main=member/memberlist.jsp"><i></i>회원목록</a></li>
                  </ul>
               </li>
               <li><a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">방명록</a></li>
               <li>
                  <a href="<%=root%>/index.jsp?main=board/boardlist.jsp">Q&A게시판</a>
               </li>
               <li><a href="#">스마트게시판</a></li>
               <li><a href="#">상품등록</a></li>
            </ul>

         <div class="clear"></div>
      </div>
</div>    
</body>
</html>