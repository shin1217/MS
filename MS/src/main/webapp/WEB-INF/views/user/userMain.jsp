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

.userMain_container {
	text-align: center;
}

.left_area, .center_area, .right_area {
	display: inline-block;
	width: 33%;
}

.left_area {
	border: 1px solid black;
	border-radius: 15px;
}

.center_area {
	border: 1px solid black;
	border-radius: 15px;
}

.right_area {
	background-color: green;
}

.timeTable {
	margin: 0 auto;
	border-spacing: 20px;
	border-collapse: separate;
}

.timeTable td {
	width: 250px;
	height: 100px;
	border-radius: 15px;
	font-size: 30px;
	color: gray;
	text-align: center;
	background-color: lightgray;
}

.timeTable td:hover {
	opacity: 0.7;
	cursor: pointer;
}

.seatTable {
	margin: 0 auto;
	border-spacing: 20px;
	border-collapse: separate;
}

.seatTable td {
	width: 100px;
	height: 100px;
	border-radius: 15px;
	font-size: 30px;
	color: gray;
	text-align: center;
	background-color: lightgray;
}

.seatTable td:hover {
	opacity: 0.7;
	cursor: pointer;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<h1>유저 메인 페이지입니다.</h1>

	<div class="userMain_container">
		<div class="left_area">자리선택
			<table id="seatTable" class="seatTable">

			</table>
		</div>

		<div class="center_area">시간선택
			<table id="timeTable" class="timeTable">

			</table>
		</div>

		<div class="right_area">결제선택</div>
	</div>
</body>

<script>
	$(document).ready(function() {
		/* 시간 테이블 동적 생성 */
		var str = '';
		var id = 1;

		for (var i = 0; i < 6; i++) {
			str += '<tr>';

			for (var j = 0; j < 2; j++) {
				str += '<td id=t' + id + '>' + id + '시간</td>';
				id++;
			}
			str += '</tr>';
		}
		$('#timeTable').append(str);
		str = '';
		id = 1;
		
		//////////////////////////////////////////////////////////////////////////////////////
	
		for (var i = 0; i < 5; i++) {
			str += '<tr>';

			for (var j = 0; j < 4; j++) {
				str += '<td id=s' + id + '>' + id + '번</td>';
				id++;
			}
			str += '</tr>';
		}
		$('#seatTable').append(str);
		str = '';
		id = 1;
		
		
	}); // end $(document).ready(function())}
	
	
	
	
</script>
</html>

