<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
.container {
	margin-top: 20px;
}
</style>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container">
		<h1>회원목록</h1>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>회원아이디</th>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>회원이름</th>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>비밀번호</th>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>핸드폰번호</th>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>생년월일</th>
					<th class="th-sm"><i class="fa fa-sort float-right" aria-hidden="true"></i>남은시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${userlist}">
					<tr>
						<td>${list.userId}</td>
						<td>${list.userName}</td>
						<td>${list.userPw}</td>
						<td>${list.userPhone}</td>
						<td>${list.userBirth}</td>
						<td>${list.userTime}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>