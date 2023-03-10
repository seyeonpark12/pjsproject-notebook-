<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String nums=request.getParameter("nums");


	//,로 분리해서[]
	String [] num=nums.split(",");
	SmartDao dao=new SmartDao();
	
	for(int i=0;i<num.length;i++){
		
		dao.deleteSmart(num[i]);
	}
	

	response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
	
	
%>