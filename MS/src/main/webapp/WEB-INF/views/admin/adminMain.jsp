<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.main-container {
	height: 100%;
	margin-top: 1%;
}

.comDiv {
	float: left;
	width: 50%;
	height: 100%;
	padding: 20px;
	overflow-y: scroll;
	text-align: center;
}

.foodDiv {
	float: right;
	width: 50%;
	height: 100%;
	padding: 20px;
	overflow-y: scroll;
	text-align: center;
}

#comTable {
	margin: 0 auto;
	border-spacing: 20px;
	border-collapse: separate;
}

#comTable td {
	background: gray;
	width: 180px;
	height: 180px;
	padding-left: 10px;
	font-size: 20px;
	color: white;
	text-align: left;
	border-radius: 10px;
	opacity: 0.5;
	cursor: pointer;
}

#foodTable {
	margin: 0 auto;
	text-align: center;
	width: 450px;
	margin-top: 25px;
}

#foodTable td {
	padding: 10px;

}

#close {
	color: red;
}

.mainModal {
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

.modal-contents {
	background-color: #fefefe;
	margin: auto;
	padding: 15px;
	border: 1px solid #888;
	border-radius: 20px;
	width: 50%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	font-size: 28px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
	border-right-width: 
}

.mainTitleText{
	background:#1AAB8A;
 	color:#fff;
  	border:none;
  	border-radius: 10px;
  	width:490px;
  	height:60px;
  	padding: 10px;
  	font-size:1.8em;
  	margin: auto;
 }
 
.orderProcessBtn {
	width: 100px;
	height: 30px;
	background-color: #f8585b;
	border: none;
	border-radius: 10px;
	color: #fff;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
}

.adminMainBtn {
	width: 150px;
	background-color: #f8585b;
	border: none;
	border-radius: 10px;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
}
 
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="main-container">
		<div class="comDiv">
			<div id="pcTitle" class="mainTitleText"><!-- jquery 동적 추가   --></div>
			<table id="comTable">
				<tr>
					<td></td>
					<td></td>
					<td></td>

				</tr>

				<tr>
					<td>
						<!-- <div class="comNum">4</div>
						<div class="userId">zzan123</div>
						<div class="reMaining-time">00:35</div>
						<div class="comManagement">
							<a href="">시간 추가</a><br> <a href="" id="close">강제 종료</a>
						</div> -->
					</td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td>
						<!-- <div class="comNum">7</div>
						<div class="userId">bba557</div>
						<div class="reMaining-time">02:19</div>
						<div class="comManagement">
							<a href="">시간 추가</a><br> <a href="" id="close">강제 종료</a>
						</div> -->
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>

				</tr>
			</table>
		</div>
		<div class="foodDiv">
			<div class="mainTitleText" style="width: 530px;">◆ 주문 대기 중인 음식 ◆</div>
			<table border="1" id="foodTable">
				<!-- 리스트 동적 추가 -->
			</table>

			<!-- 시간 추가 modal -->
			<div id="addTimeModal" class="mainModal">
				<div class="modal-contents">
					<h3>
						※ 충전하실 시간을 선택하세요.<span class="close">&times;</span>
					</h3>

					<!-- ajax serialize 사용을 위해  -->
					<form id="addTimeForm">
						<input type="hidden" id="inputComId" name="comId"> <select
							name="addTime" id="selectAddTime">
							<option value="0">select Time</option>
						</select>
					</form>

					<button id="addTimeBtn" class="adminMainBtn">충전하기</button>
				</div>
			</div>

		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
	<script>
	
		$(document).ready(function() {
			
			/* 시간처리(정기) */
			var comCnt = 0;
			
			// 시간 충전, 주문내역  modal 창 닫기 버튼 클릭
			$('.close').on('click', function() {
				$('#addTimeModal').hide();
			});

			// modal 창 외 윈도우 클릭
			$(window).on('click', function() {
				//jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
				if (event.target == $('#addTimeModal').get(0)) {
					$('#addTimeModal').hide();
				}
			});
			
			// 시간 select box 초기화 
			for (var i = 1; i <= 12; i++) {
				var option = '<option value='+ i + '>' + i + ' 시간</option>';
				$('#selectAddTime').append(option);
			}

			// 각 자리 초기화
			$('#comTable td').each(function(index) {
				var str = '<div><b>' + (index + 1) + '</b></div>'; // comId (1~12 )
				str += '<div></div>'; // userId
				str += '<div></div>'; // time
				$(str).appendTo(this);

				$(this).attr('comId', index + 1);
			});

			// 각 컴퓨터 선택 분기 처리
			$('#comTable td').on('click', function() {
				var comId = $(this).attr('comId'); // 선택한 컴퓨터의 위치 값 가져오기

				$('#inputComId').val(comId); //comId input 창에 값 저장
/* 				$('#addTimeModal').show(); // modal창 보이기 */

			});
			
			function test(){
				// 각 테이블 정보 입력
				$.ajax({
					url: '<%=request.getContextPath()%>/member/maintimetable', 
					type: 'post',
					data: $('#addTimeForm').serialize(), // 선택한 자리 번호와 충전한 시간 전송
				
					success:function(data){
						console.log(data);
					
						// 선택된 자리에 정보 표시 
						$('#comTable td').each(function(index) {						
							
							if ((index + 1) == data[index].comId) {
								// 남은시간이 없으면 안나옴
								if(data[index].userTime != 0 && data[index].userTime != null){
									comCnt++; // 사용 중인 컴퓨터 수 검사
									
									$(this).css('opacity', 1); // 선택된 컴퓨터의 투명도 설정
									$(this).children().eq(1).text(data[index].userId); // 선택된 컴퓨터의 첫 번째 줄에 아이디 표시
									$(this).children().eq(2).text(Math.floor(data[index].userTime/60)+'시간 ' +(data[index].userTime%60)+'분'); //두번째 줄에 남은 시간 표시
									$(this).children().eq(1).css({
										'color': 'black',
										'font-weight' : 'bold'
									}); // 시간 글씨색 변경
									$(this).children().eq(2).css({
										'color': 'black',
										'font-weight' : 'bold'
									}); // 시간 글씨색 변경
									
									
									//로그인한 아이디 표시 (관리자는 표시 할 필요 없음)
									/* var userVO = "${sessionScope.userVO.userId}";
									console.log(userVO);									
									if(data[index].userId==userVO){
										$(this).css('opacity', 1); // 선택된 컴퓨터의 투명도 설정
										isUse[index] = true; // 자리 상태
									} */
											
								}
								
								
							}
						});
						$('#pcTitle').html('◆ 현재 사용 중인 컴퓨터 : ' + comCnt + '대 ◆');
					} /* end success */
					
				}); /* end ajax */
			}			
			
			test();
			
			
			
			////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////
			
			/* 음식처리(민수) */
			
			$.ajax({ // 주문 리스트 보여주기
				url: '<%=request.getContextPath()%>/admin/order', 
				type: 'post',
				contentType: 'application/json',
				
				success:function(data){
					console.log("데이타" + data);
					
					
					if(data == ''){
						$('.foodDiv').append('<h3 style="color:red">※고객이 주문하신 음식이 없습니다.</h3>');
						return;
					}
					
					var str='';
					var prevComId = '';
					for(var i=0; i<data.length; i++){
						
						if(prevComId != data[i].comId){
							str += '<tr><td colspan="4" style="background : lightgray"><b>주문번호 '+ data[i].orderId +'</b></td></tr>'
							str += '<tr><td colspan="3">컴퓨터 번호<span style="color:red"> '+ data[i].comId +'</span></td><td colspan="1"><button class="orderProcessBtn" id='+ data[i].comId + '>처리하기</button></td></tr>';
							str += '<tr><td>음식 번호</td><td>음식 이름</td><td>총 가격</td><td>수량</td></tr>';
						}
						str += '<tr><td style="margin-bottom:20">'+ data[i].foodId +'</td><td>'+ data[i].foodName +'</td><td>'+ (data[i].totalPrice*data[i].foodCnt) +'</td><td>'+ data[i].foodCnt +'</td></tr>';
						
						prevComId = data[i].comId; 
					}
					
					$('#foodTable').append(str);
					
					
					// 처리하기 클릭 시 (자바스크립트 실행 순서 고려)
					// 자바스크립트는 위에서 아래로 순서대로 실행되므로 처리속도가 빠르다
					// 하지만 실행 처리 완료를 고려하지 않고 계속 아래로 내려가므로 순서 고려하여 프로그래밍할 것
					
					$('.orderProcessBtn').on('click', function() {
						var comId = $(this).attr('id');
						
						$.ajax({ // 주문 처리하기 
							url: '<%=request.getContextPath()%>/admin/orderProcess/'+comId,
							type: 'get',
							
							success:function(data){
								console.log(data);
							} /* end 처리하기 success */
						}); /* end 처리하기  ajax */
						
						location.reload(); // 새로 고침으로 리스트 삭제
					}); /* end orderProcessBtn */
				
				} /* end 처리하기 success */
			}); /* end 주문리스트 ajax */
		});
	</script>
</body>
</html>