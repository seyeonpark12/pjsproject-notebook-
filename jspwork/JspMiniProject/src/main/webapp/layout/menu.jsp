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
   
   //아이디
   String myid=(String)session.getAttribute("myid");

   //로그인상태
   String loginok=(String)session.getAttribute("loginok");
   
%>
<body>
<div id="wrap">
      <div class="inner relative">
            <ul id="main-menu">
               <li class="current-menu-item"><a href="<%=root%>/index.jsp">홈</a></li>
               <li class="parent">
                  <a href="#">유저</a>
                  <ul class="sub-menu">
                  
                  	 <%
                  	 	if(loginok==null){%>
                  	 		
                     		<li><a href="<%=root%>/index.jsp?main=member/addform.jsp"><i></i>회원가입</a></li>  	 		
                  	 	<%}
                  	 %>
                     
                     <%
                     	if(loginok!=null){%>
                        	
                        	<li><a href="index.jsp?main=member/myinfo.jsp"><i></i>내정보</a></li>                    		
                     	<%}
                     %>
                     <%
                        //로그인중이고 그 아이디가 관리자
                        if(loginok!=null && myid.equals("admin")){%>
                           
                              <li><a href="<%=root%>/index.jsp?main=member/memberlist.jsp"><i></i>회원목록</a></li>
                        <%}
                     %>
                  </ul>
               </li>
               <li><a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">방명록</a></li>
               <li>
                  <a href="<%=root%>/index.jsp?main=board/boardlist.jsp">Q&A게시판</a>
               </li>
               <li><a href="index.jsp?main=board/smartform.jsp">스마트게시판</a></li>
               <li><a href="#">상품등록</a></li>
            </ul>

         <div class="clear"></div>
      </div>
</div>    
</body>
</html>