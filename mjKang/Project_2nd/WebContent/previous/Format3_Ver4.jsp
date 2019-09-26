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
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.form.js"></script>
<script>
//세션아이디 필요
	$(function() {
		//ajax, 예약요청내용 리스트 selectAll로 input, 테이블에 순서대로 넣기?-->sort 예약날짜(sql문)
			//예약요청내용 db입력 코드 시작
            //json 전환하여 넣기
            $.ajax({
        		url: "http://localhost:8080/Project_2nd/reservationlist.jsp",
        		dataType: "json",
        		success: function(result) {	
        			var str = "<tr>";
        			//console.log(result[0].address1);
							for(var i=0; i<4; i++){
								var reserveNum = result[i].reserveNum;
								var regNum = result[i].regNum;
								var reserveDate = result[i].reserveDate;
								var reserveName = result[i].reserveName;
								var type1 = result[i].type1;
								var address1 = result[i].address1;
								var state = result[i].state;
								var statebtn;
								
								if (state==0) {
									//disabled 처리 하지 않음
								} else{ //state 1or-1 1: 예약확정, -1:예약취소
									//statebtn = "$("#reservation-confirm").attr("disabled",true)"; 
									//스트링으로 input 조건 내에 구문 추가
									//버튼 disabled 
								}
								//console.log(address1);
								//console.log(state);
								str+="<td>"+reserveNum+"</td>"
								+"<td>"+regNum+"</td>"
								+"<td>"+reserveDate+"</td>"
								+"<td>"+reserveName+"</td>"
								+"<td>"+type1+"</td>"
								+"<td>"+address1+"</td>"
								//+"<td>"+state+"</td>";
								+"<td><input type='hidden' id='reservation-state'><button type='button' id='reservation-confirm'>nowState</button></td>";
								//+"<td><input type='hidden' id='reservation-state'><button type='button' id='reservation-confirm'><a href='NewFile.html'>nowState</a></button></td>";
								//state는 버튼 들어가야하는 장소
								str+="</tr>";
								//각 data table 생성 및 넣기,테이블 생성 어떻게... for문으로 아래 연달아서????
								//, state에 따라 reservation confirm 버튼 diabled변경
								}
							$("#reservationlist").append(str);
							//console.log("append성공");
							
							}
             		}); //예약요청내용 db ajax
          //예약요청내용 db입력 코드 끝
		//예약요청 취소시 리스트 refresh???? -> dialog아래
		
		
		//dialog 사용 후 reservation-state 확인하여 movecalendarlist btn 상태 변경
		
		
		
		
		
		//dialog
		$("#dialog-message").dialog({
			//dialog 창 띄우기
			autoOpen:false,
			//dialog 내용 켜기
			width: 350,
			modal: true,
			buttons:{
				"예약 확정": function(){
					$(this).dialog('close');
				//예약 확정시 calendarlist에 insert하여 예약확정 및 예약테이블엔 update하여 reservation state 변경
				//예약 요청자에 이메일 발송?
						$(function() {});//refresh -> state update
				},
				"예약 취소": function() {
					$(this).dialog('close');
				//예약테이블에서 해당 예약 delete
				//예약 요청자에 이메일 발송? -> 취소 이유 기입 창 생성?
				},
				"돌아가기": function() {
					$(this).dialog('close');
				}
			}
			//버튼 값에 따른 상태에 따른 변경 -> default 예약대기 예약확정 예약거절, reservation confimr 버튼 disable
			
		});//dialog open
		//dialog

	//confirm
	$("#reservation-confirm").click(function() {
		console.log("confirm click");
		alert("선택창을 띄우자");
		//예약상태 변경 버튼
		$("#dialog-message").dialog( "open" );
	});//click
	//confirm
		
		
		
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
			<td>현 상태 출력<!--(예약 확인 대기/예약확정등)  (버튼누르면 alert? confirm 출력하여 해당 버튼값으로 상태 출력) -->
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
