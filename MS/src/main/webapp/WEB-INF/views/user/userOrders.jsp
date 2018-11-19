<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MS</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
}

.orderMain_container {
	text-align: center;
	padding: 30px;
	height: 100%;
}

.title_text {
	font-size: 40px;
	margin-bottom: 20px;
}

.left_area, .right_area {
	height: 100%;
	padding: 15px;
	border: 1px solid black;
	border-radius: 15px;
	margin-bottom: 10px;
}

.left_area {
	float: left;
	width: 35%;
}

.right_area {
	float: right;
	width: 63%;
}

/* 웹에 접근한 기기가 screen일 때 가로 길이가 1024px 미만(max-width:100px) 일 때 */
@media screen and (max-width:1024px) {
	.left_area {
		width: 100%;
		
	}
	.right_area {
		width: 100%;
	}
}

/* 웹에 접근한 기기가 screen일 때 세로 길이가 700px 미만일 때 */
@media screen and (max-height:700px) {
	.left_area {
		overflow-y: scroll;
		border-top-right-radius: 0;
		border-bottom-right-radius: 0;
		
	}
}

.order_table_wrap {
	background-color: white;
	overflow-y: scroll;
	margin-bottom: 15px;
	height: 71%;
}

.order_table {
	width: 100%;
}

.order_table td {
	height: 50px;
	font-size: 24px;
}

.cancle_btn, .pay_btn {
	width: 46%;
	height: 85px;
	border: none;
	border-radius: 10px;
	color: white;
	cursor: pointer;
	font-size: 26px;
}

.cancle_btn:hover, .pay_btn:hover {
	opacity: 0.7;
}

.cancle_btn {
	background-color: #1C2331;
}

.pay_btn {
	background-color: #CC0000;
}

.total_price_wrap {
	background-color: lightgray;
	border-radius: 10px;
	width: 50%; 
	float:left; 
	text-align: left;
	padding: 5px 10px 5px 10px;
	font-size: 25px;
}

.order_btn_wrap {
	width: 50%; 
	float:right;
	text-align: right;
}

/* 웹에 접근한 기기가 screen일 때 가로 길이가 1024px 이상 1480px 미만일 때 */
@media screen and (max-width:1480px) and (min-width:1024px) {
	.total_price_wrap {
		width: 100%;
		margin-bottom: 10px;
	}
	
	.order_btn_wrap{
		width: 100%;
		text-align: center;
	}
	
	.cancle_btn, .pay_btn {
		width: 110px;
	}
	
	.left_area {
		overflow-y: scroll;
		border-top-right-radius: 0;
		border-bottom-right-radius: 0;
	}
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="orderMain_container">
		<div class="title_text">[${storeSelectSession.store_name}] - 음식 주문</div>
		<div class="left_area">
			<div style="font-size: 35px">주문 리스트</div>
			<hr>
			<div class="order_table_wrap">
				<table border="1" class="order_table">
					<tr style="background-color: lightgray">
						<td>메뉴</td>
						<td>수량</td>
						<td>가격</td>
					</tr>
					<!-- 예시 -->
					<tr>
						<td>햄버거</td>
						<td>1</td>
						<td>5,000</td>
					</tr>
				</table>
			</div>
			<div>
				<div class="total_price_wrap">
					<div>주문 수량<span style="float: right">7</span></div>
					<div>총 가격<span style="float: right">10000</span></div>
			 	</div>
				<div class="order_btn_wrap">
					<button class="cancle_btn">전체취소</button>
					<button class="pay_btn">결제하기</button>
				</div>
			</div>
		</div>
		<div class="right_area">
			<div style="font-size: 35px">음식 리스트</div>
			<hr>
		</div>
	</div>
</body>
</html>