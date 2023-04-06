<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <title>Insert title here</title>
   <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <style type="text/css">
      span.day {
         float:right;
         font-size:11pt;
         color:gray;
      }
   </style>
   <script type="text/javascript">
      $(function(){
         $("span.likes").click(function(){
            var num = $(this).attr("num");
            var tag = $(this);
            //alert(num);
            
            $.ajax({
               type:"get",
               dataType:"json",
               url:"guest/ajaxlikechu.jsp",
               data:{"num":num},
               success:function(res){
                  //alert(res.chu);
                  tag.next().text(res.chu);
                  
                  tag.next().next().animate({"font-size":"20px"}, 500, function(){
                     //애니메이션 끝나고 글꼴크기0px;
                     $(this).css("font-size", "0px");
                     
                  });
               }
            });
         });
         
         //댓글부분은 무조건 안보이게
         $("div.answer").hide();
         //댓글 클릭 시 댓글 부분이 보였다 안보였다 하기
         $("span.answer").click(function(){
           $(this).parent().parent().siblings().find("div.answer").toggle();
         });
         
         $("span.adel").click(function(){
        	 
        	 var idx=$(this).attr("idx");
        	 //alert(idx);
        	 $.ajax({
        		
        		 type:"get",
        		 url:"guest/deleteanswer.jsp",
        		 dataType:"html",
        		 data:{"idx":idx},
        		 success:function(){
        			 
					location.reload();

        		 }
        	 });
         });
         
         
      });
   </script>
</head>


<%
   //로그인상태 확인 후 입력폼  나타내기
   String loginok = (String)session.getAttribute("loginok");
   //id
   String myid = (String)session.getAttribute("myid");

   GuestDao db = new GuestDao();
   //List<GuestDto> list = db.getAllBoardDatas();
   //블럭 < 1 2 3 4 5 >
   int totalCount;
   int totalPage;//총페이지수
   int startPage;//각블럭의 시작페이지
   int endPage;//각블럭의 끝페이지
   int start;//각페이지의 시작번호
   int perPage=8;//한페이지에 보여질 글의 갯수
   int perBlock=5; //한블럭당 보여지는 페이지
   int currentPage;//현재페이지
   int no;
   
   //총개수
   totalCount= db.getTotalCount();
   
   
   //현재페이지 번호 읽기(단 null일때는 1페이지로둠)
   if(request.getParameter("currentPage") == null)
      currentPage = 1;
   else
      currentPage = Integer.parseInt(request.getParameter("currentPage"));
   
      //총 페이지 개수
        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
      
      //각블럭의 시작페이지.. 현재페이지가 3(s:1, e:5)  6(s:6, e:10)
        startPage = (currentPage - 1) / perBlock * perBlock + 1;
        endPage = startPage + perBlock - 1;
   
        //총페이지가8 (6~10 ... endpage를 8로 수정해주어야함.)
      if(endPage > totalPage)
         endPage = totalPage;
        
        //각페이지에서 불러올 시작번호
        start = (currentPage-1) * perPage;
        
        //각페이지에서 필요한 게시글 가져오기
        List<GuestDto> list = db.getList(start, perPage);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        
        //no = totalCount - (currentPage - 1) * perPage;//목록이 아니라 빼둠

%>
<body>
<%
   if(loginok != null) {%>
      <jsp:include page="addform.jsp"/>
      <hr align="left" width="800">   
<%   }
%>
   
   
   <div>
      <b>총 <%=totalCount %>개의 방명록 글이 있습니다.</b>
      <%
         MemberDao mdao = new MemberDao();
         for(GuestDto dto:list) {
            //이름얻기
            String name = mdao.getName(dto.getMyid());
            
            %>
            <table class="table" style="width: 600px;">
               <tr>
                  <td>
                  
                     <%
                        //각 방명록에 달린 댓글목록 가져오기
                        AnswerDao adao = new AnswerDao();
                        List<AnswerDto> alist = adao.getAllAnswers(dto.getNum());
                     %>
                  
                  
                  
                     <b><span class="glyphicon glyphicon-user"></span><%=name %>(<%=dto.getMyid() %>)</b>
                     <span class="answer" style="cursor:pointer;"num="<%=dto.getNum()%>">댓글<%=alist.size() %></span>
                     <span class="likes" style="margin-left: 20px; cursor: pointer;"num="<%=dto.getNum()%>">추천</span>
                     <span class="chu"><%=dto.getChu() %></span>
                     <span class="glyphicon glyphicon-heart" style="color:red; font-size:0px;"></span>
                     
                     <%
                     //로그인한 아이디와 글을 쓴 아이디가 같을경우에만 수정,삭제 보이게..(자기글만 보이게)
                     if(loginok != null && dto.getMyid().equals(myid)){
                     %>
                     | <a href="index.jsp?main=guest/updateform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color:black;">수정</a>
                     | <a href="guest/delete.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color:black;">삭제</a>   
                     <%   
                     }
                     %>
                     <span class="day"><%=sdf.format(dto.getWriteday()) %></span>
                  </td>
               </tr>
               
               
               <tr>
                  <td>
                     <!-- 이미지가 null이 아닌 경우만 출력 -->
                     <%
                        if(dto.getPhotoname() != null) {
                           %>
                           <a href="save/<%=dto.getPhotoname()%>" target="_blank">
                              <img src="save/<%=dto.getPhotoname()%>" align="left" style="width:100px;">
                           </a>
                           <%
                        }
                     %>
                     <%=dto.getContent().replace("\n", "<br>") %> <!-- \n인식을 못해서 넣어줌 -->
                     
                     <!-- 댓글 -->
                        
                  
                        
                     <div class="answer">
                        <%
                        if(loginok != null) {
                           %>
                           <div class="answerform">
                              <form action="guest/insertanswer.jsp" method="post">
                              <!-- hidden -->
                              <input type="hidden" name="num" value="<%=dto.getNum() %>">
                              <input type="hidden" name="myid" value="<%=myid %>">
                              <input type="hidden" name="currentPage" value="<%=currentPage%>">
                                 <table>
                                    <tr>
                                       <td>
                                          <textarea style="width:470px; height:70px;"
                                           name="content" required="required" class="form-control"></textarea>
                                       </td>
                                       <td>
                                          <button type="submit" class="btn btn-info" style="width:70px;height:70px;">등록</button>
                                       </td>
                                    </tr>
                                 </table>
                              </form>
                           </div>
                           <%
                        }
                        %>
                        <div class="answerlist">
                           <table class="table" style="width: 500px;">
                              <%
                              for(AnswerDto adto : alist){
                                 %>
                                 <tr>
                                    <td width="60" align="left">
                                       <span class="glyphicon glyphicon-user"></span>
                                    </td>
                                    <td>
                                       <%
                                       //작성자명 얻기
                                       String aname = mdao.getName(adto.getMyid());
                                       %>
                                       <br>
                                       <b><%=aname %></b>&nbsp;
                                       <%
                                       //글작성자와 댓글쓴 작성자가 같을 경우
                                       if(dto.getMyid().equals(adto.getMyid())) {
                                          %>
                                          <span style="color:red;">작성자</span>
                                          <%
                                       }
                                       %>
                                       <span style="font-size:9pt; color:gray; margin-left:20px;">
                                          <%=sdf.format(adto.getWriteday()) %>
                                       </span>
                                       
                                       <%
                                       //댓글삭제는 로그인 중이면서 로그인한 아이디와 같을 경우에만 삭제아이콘 보이게
                                       if(loginok != null && adto.getMyid().equals(myid)){
                                          %>
                                          <span class="adel glyphicon glyphicon-trash" idx="<%=adto.getIdx()%>"
                                          style="font-size: 12pt;color:green;margin-left: 10pt;cursor: pointer;"></span>
                                          <%
                                       }
                                       %>
                                       
                                       <br>
                                       <span style="font-size: 10pt;">
                                       	<%=adto.getContent().replace("\n", "<br>") %>
                                       </span>
                                       <br>
                                    </td>
                                 </tr>
                                 <%
                              }
                              %>
                           </table>
                        </div>
                     </div>
                  </td>
               </tr>
               
            </table>
            
            
            <%
         }
      %>
   </div>
   
   
   <!-- 페이징 처리 -->
   <div style="width:500px; text-align:center;" class="container">
      <ul class="pagination">
         <%
         //이전
         
         if(startPage > 1) {
            %>
            <li>
               <a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage-1%>">이전</a>
            </li>
            <%
         }
         for(int pp=startPage;pp<=endPage;pp++)
         {
             if(pp==currentPage)
             {%>
                <li class="active">
                <a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
                </li>
             <%}else{%>
               
                <li>
                <a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
                </li>
             <%}
         }
         
         //다음
         if(endPage<totalPage) {
            %>
            <li>
               <a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage + 1%>">다음</a>
            </li>
            <%
         }
         %>
      </ul>
   </div>
</body>
</html>