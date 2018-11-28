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
	margin-bottom: 10px;
	border: 1px solid black;
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
	overflow-y: scroll;
}

.title_text {
	font-size: 40px;
	margin-bottom: 20px;
}

.content_text {
	font-size: 30px;
}

.time_table {
	margin: 0 auto;
	border-spacing: 20px;
	border-collapse: separate;
}

.time_table td {
	width: 250px;
	height: 100px;
	border-radius: 15px;
	font-size: 30px;
	color: gray;
	text-align: center;
	background-color: lightgray;
}

.time_table td:hover {
	opacity: 0.7;
	cursor: pointer;
}

.seat_list {
	width: 90%;
	margin: 0 auto;
	margin-left: 6%;
}

.seat_list > div {
	float: left;
	width: 22%;
	height: 90px;
	line-height: 90px;
	border-radius: 15px;
	font-size: 30px;
	color: gray;
	text-align: center;
	background-color: lightgray;
	margin-right: 3%;
	margin-top: 3%;
}

.seat_list > div:hover {
	opacity: 0.7;
	cursor: pointer;
}

/* 
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
} */

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/modal/userAddTimeModal.jsp"%>
	<%@ include file="/WEB-INF/views/user/userMessage.jsp"%>

	<div class="userMain_container">
		<div class="title_text">안녕하세요. ${userSession.user_name}님!</div>
		<div class="title_text">${storeSelectSession.store_name} 방문을 환영합니다:p</div>
		
		<div class="left_area">
			<div class="content_text">자리선택</div>
			<hr>
			<div class="content_text"><span id="useCnt">0</span> / <span id="totalCnt">0</span></div>
			<div id="seatList" class="seat_list"></div>
		</div>

		<div class="center_area">
			<div class="content_text">시간선택</div>
			<hr>
			<table id="timeTable" class="time_table">
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
		var selectedST = {}; // 좌석과 시간을 담을 객체 (동적 생성)
		
		createTable($('#timeTable'), 6, 2); // 시간 테이블 동적 생성
		
		$.ajax({ // 좌석 리스트 불러오기
			url : '${pageContext.request.contextPath}/user/getSeatListAll?storeId=${storeSelectSession.store_id}',
			type : 'get',

			success : function(data) {
				$('#totalCnt').text(data.length);
				
				var str = '';
				for(var i=0; i<data.length; i++){
					str += '<div>'+ (i+1) +'</div>';
				}
				$('#seatList').html(str);
			}
		});
		
	}); // end document.ready
	
	/* 시간 테이블 동적 생성(테이블 객체, 행, 열) */
	function createTable(obj, r, c) {
		var str = '';
		var id = 1;
		var price = 1000;

		for (var i = 0; i < r; i++) {
			str += '<tr>';

			for (var j = 0; j < c; j++) {
				str += '<td id='+ id + '>';
				str += '<div>'+ numberWithCommas(price) +'원</div>';
				price += 1000;
				
				if(id < 10){ str += '<div>0' + id + ':00</div>'; }
				else { str += '<div>' + id + ':00</div>'; }
				str += '</td>';
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

