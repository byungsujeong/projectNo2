<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	session.invalidate(); //session 초기화
    
    	response.sendRedirect("main.jsp"); // 다시 메인화면으로
    %>
