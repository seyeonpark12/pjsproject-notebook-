<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String num=request.getParameter("num");
	String shopnum=request.getParameter("shopnum");
	int cnt=Integer.parseInt(request.getParameter("cnt"));
	
	CartDto dto=new CartDto();
	
	dto.setNum(num);
	dto.setShopnum(shopnum);
	dto.setCnt(cnt);
	
	
	ShopDao dao=new ShopDao();
	dao.insertCart(dto);
	
%>