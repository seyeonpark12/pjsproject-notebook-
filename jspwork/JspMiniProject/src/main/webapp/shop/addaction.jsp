<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	 //이미지가 업로드되는 실제경로
   String realPath=getServletContext().getRealPath("/shopsave");
   System.out.println(realPath);
  
   
   int uploadSize=1024*1024*2; //2메가
   MultipartRequest multi=null;
   
   try{
      
      multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
            new DefaultFileRenamePolicy());
      
      //multi변수로 모든 폼데이타 읽어오기
      String category=multi.getParameter("category");
      String photo=multi.getFilesystemName("photo");
      String sangpum=multi.getParameter("sangpum");
      int price=Integer.parseInt(multi.getParameter("price"));
      
      //dto저장
      ShopDto dto=new ShopDto();
      
      dto.setCategory(category);
      dto.setPhoto(photo);
      dto.setPrice(price);
      dto.setSangpum(sangpum);
      
      ShopDao dao=new ShopDao();
      dao.insertShop(dto);
      
      //방명록 목록으로 이동
      response.sendRedirect("../index.jsp?main=shop/addform.jsp");
      
      
   }catch(Exception e){
      
      System.out.print("업로드 오류: "+e.getMessage());
   }   
%>