<%@page import="project.WorkerDTO"%>
<%@page import="project.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String job = request.getParameter("job");
	String location = request.getParameter("location");
	String location2 = request.getParameter("location2");
	MemberDAO dao = new MemberDAO();
	WorkerDTO dto = new WorkerDTO();
	
	dto.setStartdate(start);
	dto.setEnddate(end);
	dto.setType1(job);
	dto.setAddress1(location);
	dto.setAddress2(location2);

	
	dao.search(dto);
	
	

 out.print(dao.search(dto));
%>
