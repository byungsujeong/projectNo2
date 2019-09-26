<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="bean.ReservationListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ReservationListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
//		String id = request.getParameter("id"); 세션아이디
		String id = "yang";
		ReservationListDTO dto = new ReservationListDTO();
		dto.setwNum(id);
		ReservationListDAO dao = new ReservationListDAO();
		//	select 사용하여 세션id해당 data 모두 list화 하여 넘겨주기
		//id를 가지고 dao.select(dto) 실행
		ArrayList<ReservationListDTO> list = dao.selectAll(dto);
		JSONArray jarray = null;
		try{
		jarray = new JSONArray();
		for(int i =0; i<list.size(); i++){
			JSONObject jobject = new JSONObject();
			jobject.put("reserveNum", list.get(i).getReserveNum());
			jobject.put("regNum", list.get(i).getRegNum());
			jobject.put("reserveDate", list.get(i).getReserveDate());
			jobject.put("reserveName", list.get(i).getReserveName());
			jobject.put("type1", list.get(i).getType1());
			jobject.put("address1", list.get(i).getAddress1());
			jobject.put("state", list.get(i).getState());
			
			jarray.add(jobject);
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		%>
		<%= jarray.toJSONString() %>
		 

