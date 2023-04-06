<%@page import="java.text.NumberFormat"%>
<%@page import="com.mysql.cj.protocol.a.NativeConstants.IntegerDataType"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
	div.sangpum img.photo {
         width: 60px;
         height: 90px;
         border: 2px solid gray;
         
      }
      
      div.sangpum, span.del {
         cursor: pointer;
      }
</style>

<script type="text/javascript">
	$(function(){
		
		//전체상품 선택,해제
		$("#allcheck").click(function(){
			
			var chk=$(this).is(":checked");
			
			$(".idx").prop("checked",chk);
		});
		
		//상품선택시 디테일페이지 이동
		$("div.sangpum").click(function(){
			
			var shopnum=$(this).attr("shopnum");
			location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
				
		});
		
		//휴지통모양 개별삭제
		$("span.del").click(function(){
			
			var idx=$(this).attr("idx");
			//alert(idx);
			var a=confirm("삭제하려면 [확인]을 눌러주세요");
			
			if(a){
				
				del(idx);
				location.reload();  //현쟆이지 새로고침
			}
		});
		
		//선택한 상품 삭제버튼
		$("#btncartdel").click(function(){
			
			//체크한 갯수
			var cnt=$(".idx:checked").length;
			//alert(cnt);
			if(cnt==0){
				
				alert("삭제할 상품을 선택해주세요");
				return;
			}
			
			$(".idx:checked").each(function(i,element){
				
				var idx=$(this).attr("idx");
				//console.log(idx);
				del(idx);
			});
			location.reload();
			
		});
		
	});
	
	function del(idx){
		
		$.ajax({
			
			type:"get",
			dataType:"html",
			url:"shop/cartdelete.jsp",
			data:{"idx":idx},
			success:function(){
			}
			
		});
	}
</script>
</head>
<%
	MemberDao mdao=new MemberDao();
	String myid=(String)session.getAttribute("myid");
	String num=mdao.getNum(myid);
	String name=mdao.getName(myid);
	
	ShopDao sdao=new ShopDao();
 	int cartSize=sdao.getCartList(myid).size();
 	
 	//장바구니 목록
 	List<HashMap<String,String>> list=sdao.getCartList(myid);	
 	
 	int total=0;
 	NumberFormat nf=NumberFormat.getInstance();
%>


<body>
	<h3><%=name%>님의 장바구니</h3>
	<br>
	<h4 class="alert alert-info" style="width: 1000px;">총 <%=cartSize%>개의 상품이 담겨져 있습니다</h4>
	
	<table class="table table-bordered" style="width: 1000px;">
		<tr>
			<th style="width: 30px;">
				<input type="checkbox" id="allcheck">
			</th>
			<th style="width: 200px;">상품정보</th>
			<th style="width: 200px;">상품금액</th>
		</tr>
		
		<%
		for(int i=0;i<list.size();i++){
			
			HashMap<String,String> map=list.get(i);
			//사진얻기
			String photo=map.get("photo");
			
			int cnt=Integer.parseInt(map.get("cnt"));
			%>
			
			<tr>
				<td>
					<input type="checkbox" name="idx" class="idx" idx="<%=map.get("idx")%>">
				</td>
				
				<td>
					<div shopnum="<%=map.get("shopnum") %>" class="sangpum">
						<img src="shopsave/<%=photo%>" class="photo" align="left" hspace="20" >
						
						<h5><b>상품명: <%=map.get("sangpum") %></b></h5>
						<h5><b>갯수: <%=cnt %>개</b></h5>
						<h5><b>날짜: <%=map.get("cartday") %></b></h5>
					</div>
				</td>
				
				<td align="left" style="padding-right: 400px;">
					<%
						int price=Integer.parseInt(map.get("price"));
						price*=cnt;
						total=total+price*cnt;
					%>
					<h4>
						<%=nf.format(price) %>원
						<span class="glyphicon glyphicon-trash del" style="color:red;" idx="<%=map.get("idx")%>"></span>
					</h4>
					
					
				</td>
			</tr>
			
		<%}
		%>
		
		<tr>
			<td colspan="3">
				<button type="button" class="btn btn-danger btn-lg" 
				style="margin-left: 100px;" id="btncartdel">선택상품삭제</button>
				<h3 style="font-size: 2em;">총 주문금액: <%=nf.format(total) %></h3>
			</td>
		</tr>
		
	</table>
	
</body>
</html>