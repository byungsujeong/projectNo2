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
        		url: "http://localhost:8080/Project_2nd/reservationlist_ver3.jsp",
        		dataType: "html",
        		success: function(result) {	
        			result1=result.trim();
        			//console.log(result1);
						$("#reservationlist").append(result1);
						console.log("append성공");
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
	$("#reservationconfirm").on("click",".statechange", function() {
		console.log("confirm click");
		alert("선택창을 띄우자");
		//예약상태 변경 버튼
		$("#dialog-message").dialog( "open" );
	});//click
	//confirm 
		
		
	//버튼 누를시 테이블 값 받기
	/* $("#reservation-confirm").click(function(){ 
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
		
		//$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());		
		//$("#ex2_Result2").html(str);	
	});
	//버튼 누를시 테이블 값 받기 */
		
	
	
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
