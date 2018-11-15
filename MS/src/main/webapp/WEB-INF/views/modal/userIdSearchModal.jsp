<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
/* modal창 감싸고 있는 배경 Div */
.background_modal {
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

/* 아이디 출력창(실제 내용) */
.modal_contents {
	background-color: #fefefe;
	margin: auto;
	padding: 15px;
	border: 1px solid #888;
	border-radius: 20px;
	width: 50%;
	text-align: center;
}

/* 확인하기 버튼 */
.confirm_btn {
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
<div id="background_modal" class="background_modal">
	<div class="modal_contents">
		<h3>
			<b>아이디 정도는 기억해라^^;;</b><span class="close">&times;</span>
		</h3>

			<h2>회원님의 아이디는 "짠짠영"입니다 :p</h2>
		<br>
		<button id="confirm_btn" class="confirm_btn">비밀번호 찾기</button>
	</div>
</div>