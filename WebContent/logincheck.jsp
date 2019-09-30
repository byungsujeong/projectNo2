<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberDTO"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id"); // id 와 pw 에 입력된 값을 받아옴
	String pw = request.getParameter("pw");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	
	ArrayList<MemberDTO> list = dao.selectAll();
	
	int data = 0;

	for(int i = 0; i < list.size(); i++ ){
		MemberDTO dto2 = list.get(i);
		if(id.equals(dto2.getMid()) && pw.equals(dto2.getPw())){ // 입력된 아이디, 비밀번호와 db에 저장된 id,pw 비교
			data = 1;
			session.setAttribute("id", id); // session set

		}
	}
	
	out.print(data);
	
	
	
	




%>