<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MS</title>
<style>
.title_text {
	font-size: 40px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.table tbody tr td {
	font-size: 18px;
	text-align: center;
}

.table tbody tr td input[type=text] {
	width: 100%;
	padding-left: 5px;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="title_text">[${storeSelectSession.store_name}] - 상품 관리</div>
		<table class="table table-bordered table-hover table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col" colspan="6" style="font-size: 20px">상품 추가
						<button style="float: right">Tip</button>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 15%">타입</td>
					<td style="width: 15%">이름</td>
					<td style="width: 15%">가격</td>
					<td style="width: 15%">재고</td>
					<td style="width: 20%">사진</td>
					<td style="width: 20%">관리</td>
				</tr>
				<tr>
					<td><input type="text" placeholder="ex) dessert"/></td>
					<td><input type="text" placeholder="ex) 콜라"/></td>
					<td><input type="text" placeholder="ex) 3000" style="width: 80%; margin-right: 5px"/>원</td>
					<td><input type="text" placeholder="ex) 50" style="width: 80%; margin-right: 5px"/>개</td>
					<td>coke.png</td>
					<td>등록 / 초기화</td>
				</tr>
			</tbody>
		</table>
		
		<table class="table table-bordered table-hover table-striped table_font">
			<thead class="thead-dark">
				<tr>
					<th scope="col" colspan="6" style="font-size: 20px">상품 리스트</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row">#</td>
					<td>타입</td>
					<td>이름</td>
					<td>가격</td>
					<td>재고</td>
					<td>관리</td>
				</tr>
				<tr>
					<td scope="row">1</td>
					<td>dessert</td>
					<td>콜라</td>
					<td>3000</td>
					<td>+ 50 -</td>
					<td>삭제</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>