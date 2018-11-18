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

.orderMain_container {
	text-align: center;
	padding: 30px;
	height: 100%;
}

.title_text {
	font-size: 40px;
	margin-bottom: 20px;
}

.left_area {
	float: left;
	width: 30%;
	background-color: red;
}

.right_area {
	right: 70%;
	background-color: blue;
}

/* 웹에 접근한 기기가 screen일 때 가로 길이가 1024px 미만(max-width:100px) 일 때 */
@media screen and (max-width:1024px) {
	.left_area {
		width: 100%;
	}
	.right_area {
		right: 100%;
	}
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="orderMain_container">
		<div class="title_text">[${storeSelectSession.store_name}] - 음식 주문</div>
		<div class="left_area">
			
		</div>
		<div class="right_area">오</div>
	</div>
</body>
</html>