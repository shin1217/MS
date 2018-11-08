<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.left_area {
	width: 30%;
	padding-top: 3%;
	padding-left: 4%;
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
	height: 75%;
	border-radius: 15px;
	border: 1px solid black;
	text-align: center; /* 컨텐트 안의 모든 요소 가운데 정렬 */
}

.seatTable {
	margin: 0 auto;
	border-spacing: 40px;
	border-collapse: separate;
}

.seatTable td {
	width: 200px;
	height: 200px;
	border-radius: 15px;
	font-size: 40px;
	color: gray;
	text-align: center;
	background-color: lightgray;
}

.seatTable td:hover {
	opacity: 0.7;
	cursor: pointer;
}

/* 좌석 정보 중 타이틀(동적 생성) */
.seatTable td > div:nth-child(1) {
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	background-color: #33b5e5;
	padding-left: 5px;
	padding-right: 5px;
	text-align: left;
}

/* 쪽지함(부트스트랩) */
.btn-mdb-color {
	position: relative;
	top: 90%;
	border-radius: 10px;
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

	<div class="userMain_container">
		<div class="left_area">
			<div class="left_content">
				<button type="button" class="btn btn-mdb-color"
					id="user_message_btn">쪽지함</button>

			</div>
		</div>
		<div class="right_area">
			<table class="seatTable" id="seatTable">

			</table>
		</div>

		<!-- 시간 추가 modal -->
		<div id="add_time_modal" class="add_time_modal">
			<div class="modal_contents">
				<h3>
					<b>※ 충전하실 시간을 선택하세요.</b><span class="close">&times;</span>
				</h3>

				<select id="select_add_time">
					<option value="0">select Time</option>
				</select>	
				
				<br>
				<button id="add_time_btn" class="add_time_btn">충전하기</button>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function() {

		/* 스크롤따라 움직이는 Div */
		var currentPosition = parseInt($('.left_content').css('top'));

		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$('.left_content').stop().animate({
				'top' : position + currentPosition + 'px'
			}, 1000);
		});

		//////////////////////////////////////////////////////////////////////////////////////////////

		/* 좌석 테이블 동적 생성 */
		var str = '';
		var seatId = 1;

		for (var i = 0; i < 5; i++) {
			str += '<tr>';

			for (var j = 0; j < 4; j++) {
				str += '<td id=' + seatId + '>' + seatId + '</td>';
				seatId++;
			}
			str += '</tr>';
		}
		$('#seatTable').append(str);

		//////////////////////////////////////////////////////////////////////////////////////////////

		/* 좌석 클릭 시 처리 */
		var seatObj = null;

		$('#seatTable td').click(function() {
			seatObj = $(this); // 선택된 좌석의 객체를 변수 comObj에 저장
			$('#add_time_modal').show(); // 시간 충전 modal창 띄우기
		});

		//////////////////////////////////////////////////////////////////////////////////////////////

		/* 시간 충전 select option 초기화  */
		for (var i = 1; i <= 12; i++) {
			var option = '<option value='+ i + '>' + i + ' 시간</option>';
			$('#select_add_time').append(option);
		}

		/* 충전하기 클릭 시 처리 */
		$('#add_time_btn').click(function() {

			if ($('#select_add_time option:selected').val() == 0) {
				alert('충전하실 시간을 선택하세요.');
				return;
			}
			
			var addTime = $('#select_add_time option:selected').val(); // 충전할 시간
			var seatId = $(seatObj).attr('id'); // 좌석 번호
			
			$.ajax({
				// 로그인한 아이디와 남은 시간, 충전 시간을 파라미터로 넘겨줌.
				url: '<%=request.getContextPath()%>/user/addTime?addTime=' + addTime + '&userId=${userSession.user_id}&userTime=${userSession.user_time}', 
				type: 'get',
				
				success:function(data){
					if(data == 1){
						console.log("시간 추가 성공");
					}
					
				} /* end success */
			}); /* end ajax */
			
			
			$(seatObj).css({
				'font-size' : 25,
				'color' : 'white',
				'background-color' : '#0099CC',
				'text-align' : 'right',
				'padding' : 10,
				'padding-bottom' : 80
			});

			str = '<div>';
			str += '<span style="color: black; font-weight: bold">'+ $(seatObj).attr('id') +'</span>';
			str += '<span style="float: right">김민수</span>';
			str += '</div>';
			str += '<div>30:00</div>';
			str += '<div>5000</div>';

			$(seatObj).text(''); // 중앙에 써있던 좌석 번호 지우기
			$(seatObj).append(str); // 좌석 사용 정보 보여주기

			$('#add_time_modal').hide();
		});

		//////////////////////////////////////////////////////////////////////////////////////////////

		/* 시간 충전 modal 창 닫기 버튼 클릭 시 처리 */
		$('.close').on('click', function() {
			$('#add_time_modal').hide();
		});

		/* modal 창 외 윈도우 클릭 시 처리 */
		$(window).on('click', function() {
			if (event.target == $('#add_time_modal').get(0)) {
				$('#add_time_modal').hide();
			}
		});

		//////////////////////////////////////////////////////////////////////////////////////////////

	});
</script>
</html>