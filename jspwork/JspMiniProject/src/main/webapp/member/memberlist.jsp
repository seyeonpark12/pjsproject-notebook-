<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
	MemberDao dao=new MemberDao();

	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	int no=1;
%>
<body>
	<table class="table table-bordered" style="width: 1000px; font-size: 0.9em" >
		<caption><b>전체회원목록</b></caption>
		<tr bgcolor="lightgray" class="text-center">
			<th width="70" class="text-center">번호</th>
			<th width="120" class="text-center">회원명</th>
			<th width="160" class="text-center">아이디</th>
			<th width="260" class="text-center">핸드폰</th>
			<th width="300" class="text-center">주소</th>
			<th width="260" class="text-center">이메일</th>
			<th width="260" class="text-center">가입일</th>
			<th width="320" class="text-center">편집</th>
		</tr>
		
		<%
			for(MemberDto dto:list){%>
					
				<tr align="center">
					<td><%=no %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getId() %></td>
					<td><%=dto.getHp() %></td>
					<td><%=dto.getAddr() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=sdf.format(dto.getGaipday()) %></td>
					<td>
						<button type="button" class="btn btn-danger btn-xs"
						 onclick="location.href='member/deleteproc.jsp?num=<%=dto.getNum()%>'">삭제</button>		
					</td>
				</tr>
			<%
			no+=1;
			}
		%>
	</table>
</body>
</html>