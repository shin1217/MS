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
			<tbody>
				<c:forEach var="list" items="${seatlist}">
					<tr>
						<td>${list.seat_id}</td>
						<td>${list.seat_pay}</td>
						<td>${list.seat_qr}</td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#seatListTable').DataTable();
	});
</script>
</html>