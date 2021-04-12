<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

webapp\Album_start.jsp <br>

<%
	String viewPage = request.getContextPath()+"/list.ab"; // AlbumListController
	response.sendRedirect(viewPage);
%>

