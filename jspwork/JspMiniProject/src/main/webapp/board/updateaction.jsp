<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	SmartDao dao=new SmartDao();

	request.setCharacterEncoding("utf-8");

	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");

	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	
	SmartDto dto=new SmartDto();
	
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	
	dao.updateSmart(dto);
	
	response.sendRedirect("../index.jsp?main=board/detailview.jsp?num="+num+"&currentPage="+currentPage);
			
	
%>    