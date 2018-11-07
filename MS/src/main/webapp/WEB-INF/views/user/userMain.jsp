<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.left_area {
	width: 30%;
	padding-top: 4%;
	padding-left: 6%;
	float: left;
}

.right_area {
	width: 70%;
	float: right;
}

/* 사용자 정보 표시 */
.left_content {
	position: absolute;
	width: 400px;
	height: 80%; 
	border-radius: 15px;
	border: 1px solid black;
}

.comTable {
	margin: 0 auto;
	border-spacing: 40px;
	border-collapse: separate;
}

.comTable td {
	width: 200px;
	height: 200px;
	border-radius: 15px;
	background-color: lightgray;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/userHeader.jsp"%>

	<div class="userMain_container">
		<div class="left_area">
			<div class="left_content"></div>
		</div>
		<div class="right_area">
			<table class="comTable">
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>1</td>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>1</td>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>1</td>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>1</td>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>1</td>
				</tr>
			</table>
		</div>
	</div>

</body>

<script>
	$(document).ready(function() {
		
		/* 스크롤따라 움직이는 Div */
		var currentPosition = parseInt($(".left_content").css("top"));
		
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$(".left_content").stop().animate({
				"top" : position + currentPosition + "px"
			}, 1000);
		});
	});
</script>
</html>