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
<title>MS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container">
		<h1>회원목록</h1>
		<table id="userListTable" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th class="th-sm"><i class="fa fa-sort float-right" onclick="sorting('user_id')" aria-hidden="true"></i>회원아이디</th>
					<th class="th-sm"><i class="fa fa-sort float-right" onclick="sorting('user_name')" aria-hidden="true"></i>회원이름</th>
					<th class="th-sm"><i class="fa fa-sort float-right" onclick="sorting('user_phone')" aria-hidden="true"></i>핸드폰번호</th>
					<th class="th-sm"><i class="fa fa-sort float-right" onclick="sorting('user_birth')" aria-hidden="true"></i>생년월일</th>
				</tr>
			</thead>
			<tbody id="userListBody">
				<c:forEach var="list" items="${userlist}">
					<tr>
						<td>${list.user_id}</td>
						<td>${list.user_name}</td>
						<td>${list.user_phone}</td>
						<td>${list.user_birth}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
	var list = '';

	function sorting(sortName){
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/admin/userList/sort/' + sortName,
			success : function(data){
				$(data).each(function(index, item){
					list += '<tr>';
					list += '<td>'+ item.user_id +'</td>';
					list += '<td>'+ item.user_name +'</td>';
					list += '<td>'+ item.user_phone +'</td>';
					list += '<td>'+ item.user_birth +'</td>';
					list += '</tr>';
					$('#userListBody').html(list);
				});
				list = '';
			}
		});
	};
</script>
</html>