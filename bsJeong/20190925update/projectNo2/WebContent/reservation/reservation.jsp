<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	#reservation{
		font-size: 100%;
	}
</style>

<body>

	<table align="center">
		<tr>
			<td width="100"></td>
			<td><%@include file="../worker/worker.jsp"%></td>
			<td width="100"></td>
			<td><%@include file="../review/review.jsp"%></td>
			<td width="100"></td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<form action="">
				<input type="hidden" name="regnum" value="">
				<input type="hidden" name="reseredate" value="">
				<input type="hidden" name="reservename" value="">
				<input type="hidden" name="nowstate" value="">
				<table>
					<tr>
						<td>기타정보</td>
						<td><textarea rows="5" cols="40" name="etc"></textarea></td>
						<td>추가정보</td>
						<td><textarea rows="5" cols="40" name="additional"></textarea></td>
						<td><input type="submit" value="예약하기" id="reservation"></td>
					</tr>
				</table>
				</form>
			</td>
		</tr>			
	</table>
	
	

</body>
</html>