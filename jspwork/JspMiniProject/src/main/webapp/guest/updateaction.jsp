<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
   //db에 저장할 id 가져오기
   String myid=(String)session.getAttribute("myid");
   
   //이미지가 업로드되는 실제경로
   String realPath=getServletContext().getRealPath("/save");
   System.out.print(realPath);
   
   int uploadSize=1024*1024*2; //2메가
   MultipartRequest multi=null;
   
   try{
      
      multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
            new DefaultFileRenamePolicy());
      
      //multi변수로 모든 폼데이타 읽어오기
      String num=multi.getParameter("num");
      String content=multi.getParameter("content");
      String photoname=multi.getFilesystemName("photo");
      
      //페이지번호 읽기
      String currentPage=multi.getParameter("currentPage");
      
      //dao
      GuestDao dao=new GuestDao();
      
      //기존의 포토명 가져오기
      String gu_photoname=dao.getData(num).getPhotoname();
      if(gu_photoname!=photoname){
    	  
    	  
      }
      
      //dto저장
      GuestDto dto=new GuestDto();
      
      dto.setNum(num);
      dto.setMyid(myid);
      dto.setContent(content);
      dto.setPhotoname(photoname==null?gu_photoname:photoname);
      
      //update
      dao.updateGuest(dto);
      
      //방명록 목록으로 이동
      response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
      
      
   }catch(Exception e){
      
      System.out.print("업로드 오류: "+e.getMessage());
   }   
%>