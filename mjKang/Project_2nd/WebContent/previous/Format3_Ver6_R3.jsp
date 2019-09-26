<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>예약정보확인</title>
<script src="js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="css/basic.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<style>
a {
    text-decoration:none
}
</style>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.form.js"></script>
<script>
//세션아이디 필요
	$(function() {
		//ajax, 예약요청내용 리스트 selectAll로 input, 테이블에 순서대로 넣기?-->sort 예약날짜(sql문)
			//예약요청내용 db입력 코드 시작
            //json 전환하여 넣기
            $.ajax({
        		url: "http://localhost:8080/Project_2nd/reservationlist_ver3.jsp",
        		dataType: "json",
        		success: function(result1) {
        			var str = "<tr>";
        			//console.log(result);
					if($(result1).length>0){
						$(result1).each(function(i, result) {
								var reserveNum = result.reserveNum;
								var regNum = result.regNum;
								var reserveDate = result.reserveDate;
								var reserveName = result.reserveName;
								var type1 = result.type1;
								var address1 = result.address1;
								var state = result.state;
								var stateacceptbtn=null;
								var stateconfirmbtn=null;
								var staterefusebtn=null;
								var statecancelbtn=null;
								
								if (state==0) {
									stateacceptbtn = "<td><input type='hidden' name='reservation-accept' id='reservation-accept' value='1'><button type='button' name='reservation-accept' id='reservation-accept'><a href='reservationConfirm.jsp'>예약확정하기</a></button></td>";
									//예약 확정버튼 -> state update 및 calendarlist insert 기능하는 jsp로 갔다 돌아오기
									staterefusebtn = "<td><input type='hidden' name='reservation-refuse' id='reservation-refuse' value='-1'><button type='button' name='reservation-refuse' id='reservation-refuse'><a href='reservationRefuse.jsp'>예약취소</a></button></td>";
									//예약 거절버튼 -> state update
								} else if(state==1){ //state 1or-1 1: 예약확정, -1:예약취소
									stateconfirmbtn= "<td colspan='2'><input type='hidden' name='reservation-state' id='reservation-state'><button type='button' name='reservation-confirm' id='reservation-confirm' disabled='true'>예약확정</button></td>";
										
									//statebtn = "$("#reservation-confirm").attr("disabled",true)"; 
									//스트링으로 input 조건 내에 구문 추가
								} else if(state==-1){
									statecancelbtn= "<td colspan='2'><input type='hidden' name='reservation-state' id='reservation-state'><button type='button' name='reservation-cancel' id='reservation-cancel' disabled='true'>취소됨</button></td>";
									
								}
								
								//state를 받아오고, state상태에 따라, 버튼 만드는거 다르게
								//console.log(address1);
								//console.log(state);
								str+="<form><td>"+reserveNum+"</td>"
								+"<td>"+regNum+"</td>"
								+"<td>"+reserveDate+"</td>"
								+"<td>"+reserveName+"</td>"
								+"<td>"+type1+"</td>"
								+"<td>"+address1+"</td>"
								+stateacceptbtn+staterefusebtn+stateconfirmbtn+statecancelbtn;
								//state는 버튼 들어가야하는 장소
								str+="</form></tr>";
								//각 data table 생성 및 넣기,테이블 생성 어떻게... for문으로 아래 연달아서????
								//, state에 따라 reservation confirm 버튼 diabled변경
							})//each	
							}//if
							$("#reservationlist").append(str);
							//console.log("append성공");
							}
             		}); //예약요청내용 db ajax
          //예약요청내용 db입력 코드 끝
		
	 		//버튼 누를시 테이블 값 받기
 	$("#reservation-accept").click(function(){ 
		console.log("버튼 눌렀다");
		var str = ""
		var tdArr = new Array();	// 배열 선언
		var checkBtn = $(this);
		
		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkBtn.parent().parent();
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
	
	});//$(function(){});
	
	function refresh() {
		console.log("refresh");
		$(document).ready();
		console.log("refresh 완료");
	};
	

	
</script>
</head>

<body>

<div id="dialog-message" title="예약확인">
	예약을 확인해주세요.
</div>

	<table border="1">
		
		<tr>
			<!-- db내 예약 있을시 해당 예약 내용 받아서 입력 -->
			<td>reserveNum</td>
			<td>regNum</td>
			<td>reserveDate</td>
			<td>reserveName</td>
			<td>type1</td>
			<td>address1</td>
			<td>
				<input type="hidden" id="reservation-state" name="reservation-state">
				<button type="button" id="reservation-confirm">nowState</button> <!-- jquery 이용, 클릭 후 상태 선택 및 변경 후 db반영 -->
				<!-- 현재 예약 상황 노출, 함수로 번호에 따라 버튼 출력 이름 및 색상 변경 -->
			</td>
			<td>
				<button type="button" id="refresh" onclick=refresh()>고치기중</button>
			</td>
		</tr>
	</table>
	<table id="reservationlist" border="1">
	<tr class="header">
			<td colspan="7">예약확인</td>
			<!-- 예약 날짜별 sort 필요 -->
		</tr>
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
		<!-- selectAll 결과 들어가는 곳 -->
	</table>
	<div>
		
	</div>

	<div style=float:left>
		<input id="movecalendarlist" type="button" onclick="location.href='1_1_test8.jsp'" value="휴무일 캘린더로">
		<!-- ajax, 예약상태 확인하여 value에 예약상태를 확인해주세요 및 disabled로 변경  -->
	</div>	

</body>

</html>
