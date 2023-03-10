<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
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
	img.large{
	width: 450px;
	height: 550pxl
}
</style>


</head>
<%
	String loginok=(String)session.getAttribute("loginok");

	MemberDao mdao=new MemberDao();
	String myid=(String)session.getAttribute("myid");
	String num=mdao.getNum(myid);
	
	String shopnum=request.getParameter("shopnum");
	
	ShopDao sdao=new ShopDao();
	ShopDto sdto=sdao.getData(shopnum);

%>



<body>
	<form id="frm">
		<!-- hidden: num,shopnum -->
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="shopnum" value="<%=shopnum%>">
		
		<table style="width: 800px;" >
			<tr>
				<td style="width: 500px;">
				 <img src="shopsave/<%=sdto.getPhoto()%>" class="large img-thumbnail">
				</td>
				
				<td style="width: 300px;">
					<h3>카테고리:  <%=sdto.getCategory()%></h3>
					<h3>상품명:  <%=sdto.getSangpum()%></h3>
					<%
					NumberFormat nf=NumberFormat.getCurrencyInstance();
					%>
					<h3>가격:  <%=nf.format(sdto.getPrice())%></h3>
					
					<!-- 갯수선택 -->
					<h3>갯수:  
						<input type="number" min="1" max="10" value="1" step="1" name="cnt">
					</h3>
					
					<div style="margin-top: 100px; margin-left: 60px;">
						<button type="button" class="btn btn-success" style="width: 100px;" 
						id="btncart">장바구니</button>
						
						<button type="button" class="btn btn-info" style="width: 100px;"
						onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>

<script type="text/javascript">	
		$("#btncart").click(function(){
			
			//form태그 모든값 가져오기(name)
			var formdata=$("#frm").serialize();
			//alert(formdata);
			$.ajax({
				
				type:"get",
				dataType:"html",
				url:"shop/detailproc.jsp",
				data:formdata,
				success:function(){
					
					var a=confirm("장바구니에 저장하였습니다 \n장바구니로 이동하려면 [확인]을 눌러주세요");
					
					if(a){
						
						location.href="index.jsp?main=shop/mycart.jsp";
					}
				}
					
					
				
			});
			
		});
</script>
</html>