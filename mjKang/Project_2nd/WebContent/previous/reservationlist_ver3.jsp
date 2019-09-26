<%@page import="bean.ReservationListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ReservationListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
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
			$(".reservationvalue").append("<button class='statechange' id='stateaccept'>예약확정"+"</button>");
			$(".reservationvalue").append("<button class='statechange' id='staterefuse'>예약취소"+"</button>");
	
	 //confirm accept
	$(".reservationvalue").on("click","#stateaccept", function() {
		//$("#reservation-confirm").click(function(){
		console.log("accept click");
		//예약상태 변경 버튼
		alert("컨펌창을 띄우자");
		//컨펌창 이용 true false
	});//click
	//confirm accept
	
	 //confirm refuse
	$(".reservationvalue").on("click","#staterefuse", function() {
		//$("#reservation-confirm").click(function(){
		console.log("refuse click");
		//예약상태 변경 버튼
		alert("컨펌창을 띄우자");
		//컨펌창 이용 true false
	});//click
	//confirm refuse
	
	
		//버튼 누를시 테이블 값 받기
 	$(".reservationvalue").click(function(){ 
		console.log("값 받기 버튼 눌렀다");
		var str = ""
		var tdArr = new Array();	// 배열 선언
		var checkBtn = $(this);
		
		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkBtn.parent();
		var td = tr.children();
		
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		var no = td.eq(0).text();
		var userid = td.eq(1).text();
		var name = td.eq(2).text();
		var email = td.eq(3).text();
		
		
		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i){	
			tdArr.push(td.eq(i).text());
		});
	 	
		console.log("배열에 담긴 값 : "+tdArr);
		
		str +=	" * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
				", 아이디 : <font color='red'>" + userid + "</font>" +
				", 이름 : <font color='red'>" + name + "</font>" +
				", 이메일 : <font color='red'>" + email + "</font>";		
		
		$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());		
		$("#ex2_Result2").html(str);	
	});
	//버튼 누를시 테이블 값 받기
	
	
	
	});
</script>		
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
			<%-- <td><%=list.get(i).getState()%></td> --%>
			<td>
			<input type="hidden" id="reservationstate<%=i %>" value="히든">
			</td>
			<td class="reservationvalue">
			</td>
		</tr>
		<%
		}
		%>
		</table>
</div>