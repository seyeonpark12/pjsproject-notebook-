<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SmartDao"%>
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
<%

   SmartDao dao = new SmartDao();
   //List<GuestDto> list = dao.getAllBoardDatas();
   //블럭 < 1 2 3 4 5 >
   
   int totalCount;
   int totalPage;//총페이지수
   int startPage;//각블럭의 시작페이지
   int endPage;//각블럭의 끝페이지
   int start;//각페이지의 시작번호
   int perPage=3;//한페이지에 보여질 글의 갯수
   int perBlock=5; //한블럭당 보여지는 페이지
   int currentPage;//현재페이지
   int no;
   
   //총개수
   totalCount= dao.getTotalCount();
   
   
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
        List<SmartDto> list = dao.getList(start, perPage);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        
        no = totalCount - (currentPage - 1) * perPage;
        
        
        
        //댓글에 관한 dao처리
        SmartAnswerDao adao=new SmartAnswerDao();
        
        for(SmartDto dto:list){
        	
        	//댓글변수에 댓글총개수 넣기
        	int acount=adao.getAllAnswers(dto.getNum()).size();
        	dto.setAnswercount(acount);
        }
        

%>

<style type="text/css">
	a:link, a:visited{
	
		text-decoration: none;
		color: black;
	}
</style>

<script type="text/javascript">

	$(function(){
		
		//전체체크클릭시 체크값 얻어서 모든체크값 전달
		$(".alldelcheck").click(function(){
			
			var chk=$(this).is(":checked");
			
			//전체체크값을 글앞 체크에 일괄전달
			$(".alldel").prop("checked",chk);
		});
		
		$("#btndel").click(function(){
			
			//체크된 길이
			var len=$(".alldel:checked").length;
			//alert(len);
			
			if(len==0)
				alert("최소 한개 이상의 글을 선택해주세요");
			else{
				
				var a=confirm(len+"개의 글을 삭제하려면 [확인]을 눌러주세요");
				
				//체크된곳의 value(num)얻어야한다
				var n="";
				$(".alldel:checked").each(function(idx){
					
					n+=$(this).val()+","
				})
				
				//마지막 컴마제거하기
				
				n=n.substring(0, n.length-1);
				//alert(n);
				
				//삭제파일로 전송
				location.href="board/alldelete.jsp?nums="+n;
			}
		})
		
	});
</script>
</head>
<body>
	<div style="margin: 30px 30px; width: 720px;">
		<br>
		<h6><b><%=totalCount %>개의 글이 있습니다</b></h6>
		<table class="table table-bordered">
			<caption><b>스마트 게시판 목록</b></caption>
			<tr>
				<th width="70">번호</th>
				<th width="300">제목</th>
				<th width="100">작성자</th>
				<th width="200">작성일</th>
				<th>조회</th>
			</tr>
			
			<%
			if(totalCount==0){%>
				
				<tr>
					<td colspan="5" align="center">
						<h3>등록된 게시글이 없습니다</h3>
					</td>
				</tr>
			<%}else{
				
				for(SmartDto dto:list){%>
					
					<tr>
						<td align="center">
							<input type="checkbox" class="alldel" value="<%=dto.getNum()%>">
							&nbsp;&nbsp;
							<%=no-- %>
						</td>
						
						<td>
						
						<%
							if(dto.getAnswercount()>0){%>
								
								<a href="index.jsp?main=board/detailview.jsp?num=<%=dto.getNum()%>
								&currentPage=<%=currentPage%>"><%=dto.getSubject()%>  <span style="color: red">
								[<%=dto.getAnswercount()%>]</span></a>
							<%}else{%>
								
								<a href="index.jsp?main=board/detailview.jsp?num=<%=dto.getNum()%>
								&currentPage=<%=currentPage%>"><%=dto.getSubject() %></a>
								
							<%}
						%>
						
						</td>
						
						<td><%=dto.getWriter() %></td>
						<td><%=sdf.format(dto.getWriteday()) %></td>
						<td><%=dto.getReadcount() %></td>
					</tr>
				<%}
			}
			%>
			
			<tr>
				<td colspan="5">
					<input type="checkbox" class="alldelcheck">전체선택
					<span style="float: right;"> 
						<button type="button" class="btn btn-danger btn-sm" id="btndel"><span class="glyphicon glyphicon-remove"></span>삭제</button>
					&nbsp;
					<button type="button" class="btn btn-success btn-sm" onclick="location.href='index.jsp?main=board/smartform.jsp'"><span class="glyphicon glyphicon-pencil">글쓰기</span></button>
					</span>
				</td>
			</tr>
		</table>
	</div>




 <!-- 페이징 처리 -->
   <div style="width:500px; text-align:center;" class="container">
      <ul class="pagination">
         <%
         //이전
         
         if(startPage > 1) {
            %>
            <li>
               <a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage-1%>">이전</a>
            </li>
            <%
         }
         for(int pp=startPage;pp<=endPage;pp++)
         {
             if(pp==currentPage)
             {%>
                <li class="active">
                <a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
                </li>
             <%}else{%>
               
                <li>
                <a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
                </li>
             <%}
         }
         
         //다음
         if(endPage<totalPage) {
            %>
            <li>
               <a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage + 1%>">다음</a>
            </li>
            <%
         }
         %>
      </ul>
   </div>
</body>
</html>