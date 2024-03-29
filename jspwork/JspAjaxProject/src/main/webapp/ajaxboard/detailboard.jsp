<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	AjaxBoardDao dao=new AjaxBoardDao();

	String num=request.getParameter("num");
	AjaxBoardDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	JSONObject ob=new JSONObject();
	
	ob.put("num",dto.getNum());
	ob.put("writer",dto.getWriter());
	ob.put("subject",dto.getSubject());
	ob.put("content",dto.getContent());
	ob.put("avata",dto.getAvata());
	ob.put("writeday", sdf.format(dto.getWriteday()));
	
%>

<%=ob.toString()%>