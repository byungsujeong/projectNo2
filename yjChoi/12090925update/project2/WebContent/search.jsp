<%@page import="java.util.ArrayList"%>
<%@page import="project.JoinDTO"%>
<%@page import="project.JoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String type = request.getParameter("type");
	String location = request.getParameter("location");
	String location2 = request.getParameter("location2");
	JoinDAO joinDAO = new JoinDAO();
	JoinDTO joinDTO = new JoinDTO();
	
	joinDTO.setStartdate(start);
	joinDTO.setEnddate(end);
	joinDTO.setType1(type);
	joinDTO.setAddress1(location);
	joinDTO.setAddress2(location2);

	ArrayList<JoinDTO> list = joinDAO.search(joinDTO);
	
	request.setAttribute("list", list);//wnum, mid, img
	request.setAttribute("start", start);
	request.setAttribute("end", end);
	request.setAttribute("type", type);
	request.setAttribute("location", location);
	request.setAttribute("location2", location2);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("searchresult.jsp");
	dispatcher.forward(request, response);
	
%>
