<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>

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

.selectedInfo {
	font-size: 24px;
}

</style>
<!-- 시간 추가 modal -->
<div id="add_time_modal" class="add_time_modal">
	<div class="modal_contents">
		<h3>
			<b>※ 충전 후 바로 사용 가능합니다.</b><span class="close">&times;</span>
		</h3>
		
		<div id="selectedInfo" class="selectedInfo">
			<span style="font-weight: bold"></span>님, <!-- 사용자 이름 -->
			<span style="color: red; font-weight: bold"></span>자리에 <!-- 좌석 번호  -->
			<span style="color: red; font-weight: bold"></span>을 충전하시겠습니까? <!-- 충전 시간(가격) -->
		</div>
		
		<button id="add_time_btn" class="add_time_btn">충전하기</button>
	</div>
</div>