<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemberDao dao=new MemberDao();
	MemberDto dto=new MemberDto();
	
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	
	dto.setName(name);
	dto.setId(id);
	dto.setPass(pass);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setEmail(email);
	
	dao.insertMember(dto);
	
	response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?id="+id);
%>