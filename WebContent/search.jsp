<%@page import="bean.MemberDAO"%>
<%@page import="bean.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.JoinDTO"%>
<%@page import="bean.JoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String type = request.getParameter("type");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2"); // 검색을 위해 작성한 값들
	JoinDAO joinDAO = new JoinDAO();
	JoinDTO joinDTO = new JoinDTO();
	
	joinDTO.setStartdate(start);
	joinDTO.setEnddate(end);
	joinDTO.setType1(type);
	joinDTO.setAddress1(address1);
	joinDTO.setAddress2(address2); // 값들을 joinDTO 저장
	MemberDTO memberDTO = new MemberDTO();
	MemberDAO memberDAO = new MemberDAO();

	ArrayList<JoinDTO> list = joinDAO.search(joinDTO);
	ArrayList<MemberDTO> namelist = new ArrayList();
	for(int i=0; i<list.size(); i++){
		joinDTO = list.get(i); // 선택된 것들을 리스트로 dto에 저장
		memberDTO.setMid(joinDTO.getMid()); //joinDTO에 저장된 mid 값을 memberDTO mid 에 저장
		memberDTO = memberDAO.select(memberDTO); //mid 값으로 select문을 돌림
		namelist.add(memberDTO); //namelist 에 select 한 값들 저장
	}
	request.setAttribute("namelist", namelist);
	request.setAttribute("list", list);//wnum, mid, image
	request.setAttribute("start", start);
	request.setAttribute("end", end);
	request.setAttribute("type", type);
	request.setAttribute("address1", address1);
	request.setAttribute("address2", address2); // 얻어온 값들을 request에 저장
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("searchresult.jsp");
	dispatcher.forward(request, response);  // 위에서 저장된 값들을 searchresult 화면으로 보내줌
	
%>
