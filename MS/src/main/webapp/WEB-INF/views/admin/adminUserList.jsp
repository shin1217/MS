<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
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
	<%@ include file="/WEB-INF/views/common/adminHeader.jsp"%>

	<div class="container">
		<h1>회원목록</h1>
		<table id="userListTable" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>회원아이디</th>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>회원이름</th>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>비밀번호</th>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>핸드폰번호</th>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>생년월일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${userlist}">
					<tr>
						<td>${list.user_id}</td>
						<td>${list.user_name}</td>
						<td>${list.user_pw}</td>
						<td>${list.user_phone}</td>
						<td>${list.user_birth}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
	$(document).ready(function() {
	    $('#userListTable').DataTable();
	} );
</script>
</html>