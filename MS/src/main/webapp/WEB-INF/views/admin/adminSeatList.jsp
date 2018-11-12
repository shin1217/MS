<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<style>
.container {
	margin-top: 20px;
}
</style>
<title>MS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container">
		<h1>좌석 목록</h1>
		<table id="seatListTable" class="table table-striped table-bordered">
			<!-- 좌석등록 폼 -->
			<thead>
				<tr>
					<th class="th-sm">좌석 추가</th>
					<th class="th-sm">비용</th>
					<th class="th-sm">QR코드</th>
					<th class="th-sm">관리</th>
				</tr>
			</thead>
			<tbody>
				<form action="">
					<tr>
						<td></td>
						<td style="text-align: center;"><input type="text"
							name="seat_pay" style="width: 80%;" /> 원 / 시간</td>
						<td><input type="file" name="seat_qr" /></td>
						<td style="text-align: center;"><button id="addseat"
								type="button">등록</button>
							<button id="reset" type="reset">취소</button></td>
					</tr>
				</form>
				<tr>
					<td colspan="4"></td>
				</tr>
			</tbody>
			<!-- 좌석등록 폼 -->
			<!-- 좌석리스트 -->
			<thead>
				<tr>
					<th class="th-sm"><i class="fa fa-sort float-right"
						aria-hidden="true"></i>좌석번호</th>
					<th class="th-sm"><i class="fa fa-sort float-right"
						aria-hidden="true"></i>비용</th>
					<th class="th-sm"><i class="fa fa-sort float-right"
						aria-hidden="true"></i>QR코드</th>
					<th class="th-sm"><i class="fa fa-sort float-right"
						aria-hidden="true"></i>관리</th>
				</tr>
			</thead>
			<tbody id="listbody">
				<c:forEach var="list" items="${seatlist}">
					<tr>
						<td>${list.seat_id}</td>
						<td style="text-align: right;">${list.seat_pay}</td>
						<td style="text-align: center;">${list.seat_qr}</td>
						<td style="text-align: center;"><button id="seat_modify"
								type="button">수정</button>
							<button id="seat_delete" type="button">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
			<!-- 좌석리스트 -->
		</table>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#seatListTable').DataTable();
	});
</script>
</html>