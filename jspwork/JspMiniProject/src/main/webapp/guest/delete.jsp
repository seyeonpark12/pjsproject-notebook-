<%@page import="data.dto.GuestDto"%>
<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
   String num=request.getParameter("num");
   
   GuestDao dao=new GuestDao();
   GuestDto dto=dao.getData(num);
   
   
   String fileName = dto.getPhotoname();
   
   String uploadPath=getServletContext().getRealPath("/save");
   
   File file=new File(uploadPath+"\\"+fileName);

   if(file.exists()){
      
      file.delete();
   }

   dao.deleteGuest(num);
   
   
   response.sendRedirect("../index.jsp?main=guest/guestlist.jsp");
%>