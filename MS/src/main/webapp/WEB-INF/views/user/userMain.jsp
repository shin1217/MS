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

html, body {
	height: 100%;
}

.userMain_container {
	text-align: center;
	padding: 30px;
	height: 100%;
}

.left_area, .center_area, .right_area {
	display: inline-block;
	width: 33%;
	height: 100%;
	padding-top: 10px;
	border: 1px solid black;
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
	overflow-y: scroll;
}

.left_area {
}

.center_area {
}

.right_area {
}

.title_text {
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 20px;
}

.content_text {
	font-size: 30px;
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

	<div class="userMain_container">
		<div class="title_text">안녕하세요. 김민수님!</div>
		<div class="title_text">MS PC방에 오신 것을 환영합니다:p</div>
		
		<div class="left_area">
			<div class="content_text">자리선택</div>
			<hr>
			<div class="content_text">5/20</div>
			<table id="seatTable" class="seatTable">
			</table>
		</div>

		<div class="center_area">
			<div class="content_text">시간선택</div>
			<hr>
			<table id="timeTable" class="timeTable">
			</table>
		</div>

		<div class="right_area">
			<div class="content_text">결제선택</div>
			<hr>
			<h1>준비 중...</h1>
		</div>
	</div>
</body>

<script>
	$(document).ready(function() {
		createTable('s', $('#seatTable'), 5, 4); // 좌석 테이블 동적 생성	
		createTable('t', $('#timeTable'), 6, 2); // 시간 테이블 동적 생성
		
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		/* 좌석 선택 */
		$('#seatTable td').on('click', function() {
			
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		/* 시간 선택 */
		$('#timeTable td').on('click', function() {
		});
		
	}); // end $(document).ready(function())}
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	/* 테이블 동적 생성(아이디 구분 문자, 테이블 객체, 행, 열) */
	function createTable(ch, obj, r, c) {
		var str = '';
		var id = 1;
		var price = 1000;

		for (var i = 0; i < r; i++) {
			str += '<tr>';

			for (var j = 0; j < c; j++) {
				
				if(ch == 't'){ // 시간 테이블
					str += '<td id='+ ch + id + '>';
					str += '<div>'+ numberWithCommas(price) +'원</div>';
					price += 1000;
					
					if(id < 10){
						str += '<div>0' + id + ':00</div>';
					}
					else {
						str += '<div>' + id + ':00</div>';
					}
					str += '</td>';
				}
				else { // 좌석 테이블
					str += '<td id='+ ch + id + '>' + id + '</td>';
				}
				id++;
			}
			str += '</tr>';
		}
		$(obj).append(str);
	}
	
	/* 가격에 콤마 표시 */
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
</html>

