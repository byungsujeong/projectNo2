<%@page import="java.util.ArrayList"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@page import="bean.WorkerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
#dis2 {
	display: none;
}

#btn {
	background: none;
	border: none;
	outline: none;
	color: blue;
}

#btn:hover {
	text-decoration: underline;
}
</style>
<script src="../js/jquery-3.4.1.js"></script>
<script>
	$(
			function() {
				var flag = 1;
				$("#btn").on("click", function() {
					if(flag==1){
						$(this).html($(this).text().replace($("#btn").text(),'닫기'));
						flag=0;
					}else if(flag==0){
						$(this).html($(this).text().replace($("#btn").text(),'더보기'));
						flag=1;
					}
					$("#dis2").slideToggle("middle");
				});

				$(".radio")
						.click(
								function() {
									if ($(".radio:checked").val() == 1) {
										$("#rating")
												.html(
														"<img src = ../img/one.jpg width=200 height=36.27>");
									} else if ($(".radio:checked").val() == 2) {
										$("#rating")
												.html(
														"<img src = ../img/two.jpg width=200 height=36.27>");
									} else if ($(".radio:checked").val() == 3) {
										$("#rating")
												.html(
														"<img src = ../img/three.jpg width=200 height=36.27>");
									} else if ($(".radio:checked").val() == 4) {
										$("#rating")
												.html(
														"<img src = ../img/four.jpg width=200 height=36.27>");
									} else if ($(".radio:checked").val() == 5) {
										$("#rating").html("<img src = ../img/five.jpg width=200 height=36.27>");
									}
								})

				$("#review").click(function() {
					var resnum = "temp";
					var wnum = "1";
					var mid = $("#mid").val();
					var rating = $(".radio:checked").val();
					var wrcontent = $("#wrcontent").val();
					if (rating == null) {
						alert("평점을 선택해주세요!");
					} else {
						$.ajax({
							url : "../review/insertreview.jsp",
							type : 'POST',
							data : {
								resnum : resnum,
								wnum : wnum,
								mid : mid,
								rating : rating,
								wrcontent : wrcontent
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
<input type="hidden" name="mid" id="mid" value="<%=session.getAttribute("mid")%>">
	<table>
		<tr>
			<td colspan="2">
					<table>
						<tr>
							<td><input type="radio" name="rating" class="radio"
								value="1">1</td>
							<td><input type="radio" name="rating" class="radio"
								value="2">2</td>
							<td><input type="radio" name="rating" class="radio"
								value="3">3</td>
							<td><input type="radio" name="rating" class="radio"
								value="4">4</td>
							<td><input type="radio" name="rating" class="radio"
								value="5">5</td>
							<td id="rating"><img src="../img/zero.jpg" width="200"
								height="auto"></td>
						</tr>
					</table>
			</td>
		</tr>
		<tr>
			<td>댓글입력</td>
			<td><textarea rows="5" cols="40" name="wrcontent" id="wrcontent"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<button id="review" type="button" onclick="">등록</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<hr color="red">
			</td>
		</tr>
		<tr>
			<td colspan="2" height="300">
				<div style="width: 100%; height:100% ; overflow: auto;">
				<div id="dis"></div>
				<%@include file = "selectreview.jsp"%>
				<div id="dis2"><%@include file = "selectreview2.jsp"%></div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button id="btn">더보기</button>
			</td>
		</tr>
		
	</table>
</body>
</html>