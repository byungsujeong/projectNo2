<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
#dis {
	display: none;
}

#btn3 {
	background: none;
	border: none;
	outline: none;
	color: blue;
}

#btn3:hover {
	text-decoration: underline;
}

</style>

<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$("#btn").on("click", function() {
			$("#dis").slideToggle("middle");
		});

		$(".radio")
				.click(
						function() {
							if ($(".radio:checked").val() == 1) {
								$("#score")
										.html(
												"<img src = img/one.jpg width=200 height=36.27>");
								$(".radio:checked") = check;
								return false;
							} else if ($(".radio:checked").val() == 2) {
								$("#score")
										.html(
												"<img src = img/two.jpg width=200 height=36.27>");
								$(".radio:checked") = check;
								return false;
							} else if ($(".radio:checked").val() == 3) {
								$("#score")
										.html(
												"<img src = img/three.jpg width=200 height=36.27>");
								$(".radio:checked") = check;
								return false;
							} else if ($(".radio:checked").val() == 4) {
								$("#score")
										.html(
												"<img src = img/four.jpg width=200 height=36.27>");
								$(".radio:checked") = check;
								return false;
							} else if ($(".radio:checked").val() == 5) {
								$("#score")
										.html(
												"<img src = img/five.jpg width=200 height=36.27>");
								$(".radio:checked") = check;
								return false;
							}
						})

		$("#review").click(function() {
			var scoreValue = $(".radio:checked").val();
			var idValue = $("#id").val();
			var reValue = $("#re").val();
			if(scoreValue==null){
				alert("평점을 선택해주세요!");
			}else{
				$.ajax({
					url : "reviewdata.jsp",
					data : {
						score : scoreValue,
						id : idValue,
						re : reValue
					},
					success : function(result) {
						$("#dis").append(result);
					}
				});
			}
		});
	})
</script>
<body>

	<table>
		<tr>
			<td colspan="2">
				<form action="">
					<table>
						<tr>
							<td><input type="radio" name="score" class="radio" value="1">1</td>
							<td><input type="radio" name="score" class="radio" value="2">2</td>
							<td><input type="radio" name="score" class="radio" value="3">3</td>
							<td><input type="radio" name="score" class="radio" value="4">4</td>
							<td><input type="radio" name="score" class="radio" value="5">5</td>
							<td id="score"><img src="img/zero.jpg" width="200"
								height="auto"></td>
						</tr>
					</table>
			</td>
		</tr>
		<tr>
			</form>
			<input type="hidden" name="id" id="id">
			<td>댓글입력</td>
			<td><textarea rows="5" cols="40" name="re" id="re"></textarea>
				</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<button id="review">등록</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<hr color="red">
				<button id="btn">댓글보기</button>
				<div id="dis"></div>
			</td>
		</tr>
	</table>
</body>
</html>