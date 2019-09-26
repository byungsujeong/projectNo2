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
		%>
<div>
<table id="reservationlist" border="1">
<tr>
			<td>예약번호 <!-- (클릭 시 일꾼/사업자 정보창 이동) -->
			</td>
			<td>사업자번호 <!-- (클릭 시 사업자 정보 이동) -->
			</td>
			<td>예약날짜</td>
			<td>요청자이름</td>
			<td>업종</td>
			<td>지역</td>
			<td colspan="2">현 상태 출력<!--(예약 확인 대기/예약확정등)  (버튼누르면 alert? confirm 출력하여 해당 버튼값으로 상태 출력) -->
			</td>
		</tr>
		<%
		//for문으로 selectAll table생성
		for(int i=0; i<list.size(); i++){
		%>	
		<tr>
			<td><%=list.get(i).getReserveNum()%></td>
			<td><%=list.get(i).getRegNum()%></td>
			<td><%=list.get(i).getReserveDate()%></td>
			<td><%=list.get(i).getReserveName()%></td>
			<td><%=list.get(i).getType1()%></td>
			<td><%=list.get(i).getAddress1()%></td>
			<td><%=list.get(i).getState()%></td>
			<td id="reservationconfirm">
			<input type="hidden" id="reservationstate<%=i %>" value="히든">
			<button class='statechange'>현재상태<%=i%></button>
			</td>
		</tr>
		<%}
		%>
		</table>
</div>