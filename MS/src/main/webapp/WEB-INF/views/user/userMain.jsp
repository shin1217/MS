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

/* modal창 감싸고 있는 배경 Div */
.add_time_modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* 시간충전 modal창 내용 */
.modal_contents {
	background-color: #fefefe;
	margin: auto;
	padding: 15px;
	border: 1px solid #888;
	border-radius: 20px;
	width: 50%;
	text-align: center;
}

/* 충전하기 버튼 */
.add_time_btn {
	width: 150px;
	background-color: #f8585b;
	border: none;
	border-radius: 10px;
	color: #fff;
	padding: 15px 0;
	margin-top: 10px;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
}

/* close 버튼 */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	font-size: 28px;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/modal/userAddTimeModal.jsp"%>

	<div class="userMain_container">
		<div class="title_text">안녕하세요. ${userSession.user_name}님!</div>
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
		var selectedST = {}; // 좌석과 시간을 담을 객체 (동적 생성)
		
		createTable('s', $('#seatTable'), 5, 4); // 좌석 테이블 동적 생성	
		createTable('t', $('#timeTable'), 6, 2); // 시간 테이블 동적 생성
		
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		/* 좌석 선택 */
		var sArr = new Array(20).fill(false);
		var sBefore  = null;
		
		$('#seatTable td').on('click', function() {
			seletedProcess($(this), 's', sBefore, sArr); // 좌석 선택 처리 
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		/* 시간 선택 */
		var tArr = new Array(12).fill(false);
		var tBefore  = null;
		
		$('#timeTable td').on('click', function() {
			 seletedProcess($(this), 't', tBefore, tArr); // 시간 선택 처리 
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		/* 시간 충전 modal 창 닫기 버튼 클릭 시 처리 */
		$('.close').on('click', function() {
			selectedReset(); // 선택한 자리와 좌석 초기화
			$('#add_time_modal').hide();
		});

		/* modal 창 외 윈도우 클릭 시 처리 */
		$(window).on('click', function() {
			if (event.target == $('#add_time_modal').get(0)) {
				selectedReset(); // 선택한 자리와 좌석 초기화
				$('#add_time_modal').hide();
			}
		});	
		
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
						str += '<td id=' + ch + id + '>'; // <td cid = "1">
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
						str += '<td id=' + ch + id + '>' + id + '</td>';
					}
					id++;
				}
				str += '</tr>';
			}
			$(obj).append(str);
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		/* 선택한 좌석과 시간 초기화 */
		function selectedReset() {
			sArr[selectedST.seat-1] = false;
			tArr[selectedST.time-1] = false;
			
			$('#s'+selectedST.seat).css('background-color', '');
			$('#t'+selectedST.time).css('background-color', '');
			
			selectedST.seat =  null;
			selectedST.time =  null;
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		/* 자리, 좌석 선택 시 처리(객체, 테이블 구분 문자, 이전 객체, 선택 여부 확인 배열) */
		function seletedProcess(obj, ch, before, arr) {
			var id = $(obj).attr('id').toString().substring(1); // 아이디(숫자만 추출)
			
			if(before != null && before != id){ 
				$('#' + ch + before).css('background-color', ''); 
				arr[before-1] = false; 
			}
			
			if(ch == 's') { sBefore = id; }
			else { tBefore = id; }
			
			if(arr[id-1]){ // 시간이 선택된 상태면...
				$(obj).css('background-color', '');
				arr[id-1] = false;
				
				if(ch == 's') { selectedST.seat = null; } // 좌석 삭제
				else { selectedST.time = null; } // 시간 삭제
			}
			else { // 시간이 선택되지 않은 상태면...
				$(obj).css('background-color', '#3F729B');
				arr[id-1] = true;
				
				if(ch == 's') { selectedST.seat = id; } // 좌석 저장
				else { selectedST.time = id;  } // 시간 저장
			}
			
			/* 좌석과 시간 모두 선택되었을 경우 */
			if(selectedST.seat != null && selectedST.time != null){
				$('#selectedInfo').children().eq(0).text('${userSession.user_name}님');
				$('#selectedInfo').children().eq(1).text(selectedST.seat + '번 자리에');
				$('#selectedInfo').children().eq(2).text(selectedST.time + '시간(' + (selectedST.time*1000) + '원)을 충전하시겠습니까?');
				$('#add_time_modal').show(); // 시간 충전 modal창 띄우기
			}
		}
		
		/* 가격에 콤마 표시 */
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	}); // end $(document).ready(function())}

</script>
</html>

