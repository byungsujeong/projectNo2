<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>예약정보확인</title>
<link rel="stylesheet" href="css/basic.css">
<script type="text/javascript" src="js/jquery-3.4.1.js">
</script>
<script>
$(function() {
	$("#reservation-confirm").click(function() {
		alert("선택창을 띄우자");
		//상태에 따른 변경 -> default 확정대기 예약확정 예약거절
	});
});
</script>
</head>

<body>
	<table border="1">
		<tr class="header">
			<td colspan="7">예약확인</td>
		</tr>
		<tr>
			<td>예약번호 <!-- (클릭 시 일꾼/사업자 정보창 이동) -->
			</td>
			<td>사업자번호 <!-- (클릭 시 사업자 정보 이동) -->
			</td>
			<td>예약날짜</td>
			<td>요청자이름</td>
			<td>기타정보</td>
			<td>추가정보</td>
			<td>현 상태 출력(예약 확인 대기/예약확정등) <!-- (버튼누르면 alert? confirm 출력하여 해당 버튼값으로 상태 출력) -->
				
			</td>
		</tr>
		<tr>
			<!-- db내 예약 있을시 해당 예약 내용 받아서 입력 -->
			<td>reserveNum</td>
			<td>regNum</td>
			<td>reserveDate</td>
			<td>reserveName</td>
			<td>etc</td>
			<td>additional</td>
			<td>
				<button type="button" id="reservation-confirm">nowState</button> 
				<!-- jquery 이용, 클릭 후 상태 선택 및 변경 후 db반영 -->
				<!-- 현재 예약 상황 노출, 함수로 번호에 따라 버튼 출력 이름 및 색상 변경 -->
			</td>
		</tr>

	</table>

</body>

</html>