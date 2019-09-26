<%@page import="bean.ReservationListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ReservationListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		var wNum = "yang";
	<%
		String wwNum="yang";
//		String id = request.getParameter("id"); 세션아이디
		ReservationListDTO dto = new ReservationListDTO();
		dto.setwNum(wwNum);
		ReservationListDAO dao = new ReservationListDAO();
		//	select 사용하여 세션id해당 data 모두 list화 하여 넘겨주기
		//id를 가지고 dao.select(dto) 실행
		ArrayList<ReservationListDTO> list = dao.selectAll(dto);
	%>
		$(".reservationvalue").append("<td><button class='statechange' id='stateaccept'>예약확정"+"</button></td>");
		$(".reservationvalue").append("<td><button class='statechange' id='staterefuse'>예약취소"+"</button></td>");
	//state 상태에 따른 버튼 변경... 해야함
		
	 //confirm accept
	$(".reservationvalue").on("click","#stateaccept", function() {
		//$("#reservation-confirm").click(function(){
		//console.log("accept click");
		//예약상태 변경 버튼
		//alert("컨펌창을 띄우자");
		var acceptcheck = confirm("예약을 수락하시겠습니까?");
		if (acceptcheck) {
			//예약수락
			//테이블 값 받기 실행
			console.log("accept 완료");
			
			//버튼 누를시 테이블 값 받기
 			//$("#stateaccept").click(function(){ 
				console.log("값 받기 버튼 눌렀다");
				var tdArr = new Array();	// 배열 선언
				var checkBtn = $(this);
				// checkBtn.parent() : checkBtn의 부모는 <td>이다.
				// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkBtn.parent().parent();
				var td = tr.children();
		
				console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
				var reserveNum = td.eq(0).text();
				var regNum = td.eq(1).text();
				var reserveDate = td.eq(2).text();
				var reserveName = td.eq(3).text();
				var type1 = td.eq(4).text();
				var address1 = td.eq(5).text();
				var state = 1;
				//ajax로 버튼값에 따라 전송장소 변경
				 $.ajax({
					url: "ReservationAceept.jsp",
					data:{
						wNum : wNum,
						reserveNum : reserveNum,
						regNum : regNum,
						reserveDate : reserveDate,
						reserveName : reserveName,
						type1 : type1,
						address1 : address1,
						state : state
						},
						success: function(result){
							console.log(result);
						}//success
			});//ajax 
				alert("값 가져오기 성공 예약확정 ㄱㄱ");
		
			//});
			//버튼 누를시 테이블 값 받기
	
		}else{
			//예약수락취소
			return false;
		}
		//컨펌창 이용 true false
	});//click
	//confirm accept
	
	
	 //confirm refuse
	$(".reservationvalue").on("click","#staterefuse", function() {
		//$("#reservation-confirm").click(function(){
		//console.log("refuse click");
		//예약상태 변경 버튼
		//alert("컨펌창을 띄우자");
		var refusecheck = confirm("예약을 거절하시겠습니까?");
		if (refusecheck) {
			//예약거절
			console.log("refuse 완료");
			//버튼 누를시 테이블 값 받기
 			//$("#stateaccept").click(function(){ 
				console.log("값 받기 버튼 눌렀다");
				var tdArr = new Array();	// 배열 선언
				var checkBtn = $(this);
				// checkBtn.parent() : checkBtn의 부모는 <td>이다.
				// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkBtn.parent().parent();
				var td = tr.children();
		
				console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
				var ReserveNum = td.eq(0).text();
				var RegNum = td.eq(1).text();
				var ReserveDate = td.eq(2).text();
				var ReserveName = td.eq(3).text();
				var Type1 = td.eq(4).text();
				var Address1 = td.eq(5).text();
				var state = -1;
		
				//ajax로 버튼값에 따라 전송장소 변경
				 $.ajax({
					url: "ReservationRefuse.jsp",
					data:{
						wNum : wNum,
						ReserveNum : ReserveNum,
						RegNum : RegNum,
						ReserveDate : ReserveDate,
						ReserveName : ReserveName,
						Type1 : Type1,
						Address1 : Address1,
						state : state
						},
						success: function(result){
							console.log(result);
						}//success
			});//ajax 
				alert("값 가져오기 성공 예약확정 ㄱㄱ");
		
			//});
			//버튼 누를시 테이블 값 받기
			
		}else{
			//예약거절취소
			return false;
		}
		//컨펌창 이용 true false
	});//click
	//confirm refuse
	
	
	
	
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
		<tr class="reservationvalue">
			<td><%=list.get(i).getReserveNum()%></td>
			<td><%=list.get(i).getRegNum()%></td>
			<td><%=list.get(i).getReserveDate()%></td>
			<td><%=list.get(i).getReserveName()%></td>
			<td><%=list.get(i).getType1()%></td>
			<td><%=list.get(i).getAddress1()%></td>
			<td><%=list.get(i).getState() %></td>
		</tr>
		<%
		}
		%>
		</table>
</div>