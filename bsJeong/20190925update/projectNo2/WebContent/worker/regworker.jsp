<%@page import="java.util.ArrayList"%>
<%@page import="bean.AddressDAO"%>
<%@page import="bean.AddressDTO"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#regworker {
	margin: 0 auto;
	width: 330px;
	height: auto;
}

#reg {
	width: 300px;
	height: 30px;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../js/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		var list1 = [];
		var list2 = [];

		$("#address1").focus(function() {

			$.ajax({

				url : "selectregworker.jsp",
				dataType : "json",
				success : function(result) {
					for (var i = 0; i < result.length; i++) {
						list1[i] = result[i];
					}	
				}

			});

		});

		$("#address2").focus(function() {
			var address1 = $("#address1").val();
			
			$.ajax({

				url : "selectregworker2.jsp",
				dataType : "json",
				data : {
					address1 : address1
				},
				success : function(result) {
					for (var i = 0; i < result.length; i++) {
						list2[i] = result[i];
					}	
				}

			});

		});
		
		$("#address1").autocomplete({
			source : list1
		});
		$("#address2").autocomplete({
			source : list2
		});

		$("#reg").click(function() {
			var mid = $("#mid").val();
			var type1 = $("#type1").val();
			var period1 = $("#period1").val();
			var type2 = $("#type2").val();
			var period2 = $("#period2").val();
			var type3 = $("#type3").val();
			var period3 = $("#period3").val();
			var address1 = $("#address1").val();
			var address2 = $("#address2").val();
			var wcontent = $("#wcontent").val();

			$.ajax({
				url : "insertregworker.jsp",
				data : {
					mid : mid,
					type1 : type1,
					period1 : period1,
					type2 : type2,
					period2 : period2,
					type3 : type3,
					period3 : period3,
					address1 : address1,
					address2 : address2,
					wcontent : wcontent
				},
				success : function(result) {
					/* location.href=""; */
				}
			});

		});

	});
</script>

<body>
	<input type="hidden" name="mid" id="mid"
		value="<%=session.getAttribute(" mid ")%>">
	<div style="padding-top: 5%;"></div>
	<form action="">
		<div id="regworker">
			<table>
				<tr>
					<td>경력업종1</td>
					<td><select name="type1" id="type1">
							<option value="cafe">cafe</option>
							<option value="factory">factory</option>
							<option value="design">design</option>
					</select></td>
				</tr>
				<tr>
					<td>경력기간1(개월)</td>
					<td><input type="text" name="period1" id="period1"></td>
				</tr>
				<tr>
					<td>경력업종2</td>
					<td><select name="type2" id="type2">
							<option value=""></option>
							<option value="cafe">cafe</option>
							<option value="factory">factory</option>
							<option value="design">design</option>
					</select></td>
				</tr>
				<tr>
					<td>경력기간2</td>
					<td><input type="text" name="period2" id="period2"></td>
				</tr>
				<tr>
					<td>경력업종3</td>
					<td><select name="type3" id="type3">
							<option value=""></option>
							<option value="cafe">cafe</option>
							<option value="factory">factory</option>
							<option value="design">design</option>
					</select></td>
				</tr>
				<tr>
					<td>경력기간3</td>
					<td><input type="text" name="period3" id="period3"></td>
				</tr>
				<tr>
					<td>근무지역(시/군)</td>
					<td><input type="text" name="address1" id="address1"></td>
				</tr>
				<tr>
					<td>근무지역(구/읍/면)</td>
					<td><input type="text" name="address2" id="address2"></td>
				</tr>
				<tr>
					<td colspan="2">본인소개</td>
				</tr>

				<tr>
					<td colspan="2"><textarea rows="5" cols="42" name="wcontent"
							id="wcontent"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button id="reg" type="button"
							onclick="">등록</button></td>
				</tr>
			</table>
		</div>
	</form>

</body>

</html>