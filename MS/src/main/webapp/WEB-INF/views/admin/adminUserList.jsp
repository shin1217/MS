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
					<th class="th-sm"><i class="fa fa-sort float-right" id="userIdTh" onclick="sorting('user_id', 'desc')" aria-hidden="true"></i>회원아이디</th>
					<th class="th-sm"><i class="fa fa-sort float-right" id="userNameTh" onclick="sorting('user_name', 'desc')" aria-hidden="true"></i>회원이름</th>
					<th class="th-sm"><i class="fa fa-sort float-right" id="userPhoneTh" onclick="sorting('user_phone', 'desc')" aria-hidden="true"></i>핸드폰번호</th>
					<th class="th-sm"><i class="fa fa-sort float-right" id="userBirthTh" onclick="sorting('user_birth', 'desc')" aria-hidden="true"></i>생년월일</th>
				</tr>
			</thead>
			<tbody id="userListBody">
<%-- 				<c:forEach var="list" items="${userlist}">
					<tr>
						<td>${list.user_id}</td>
						<td>${list.user_name}</td>
						<td>${list.user_phone}</td>
						<td>${list.user_birth}</td>
					</tr>
				</c:forEach> --%>
			</tbody>
		</table>
	</div>
</body>
<script>
	$(document).ready(function(){
		getAllList();
	});
	
	var list = '';
	var store_id = ${adminSession.store_id};
		
	function getAllList(){
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/admin/userList/all/' + store_id,
			success : function(data){
				$(data).each(function(index, item) {
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
	
	function sorting(sortName, orderBy){
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/admin/userList/sort',
			data : {
				sortName : sortName,
				orderBy : orderBy,
				store_id : store_id
			},
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
				
				if($('#userIdTh').attr('onclick') == "sorting('user_id', 'desc')"){
					$('#userIdTh').attr('onclick', "sorting('user_id', 'asc')");
				} else {
					$('#userIdTh').attr('onclick', "sorting('user_id', 'desc')");
				}
				
				if($('#userNameTh').attr('onclick') == "sorting('user_Name', 'desc')"){
					$('#userNameTh').attr('onclick', "sorting('user_Name', 'asc')");
				} else {
					$('#userNameTh').attr('onclick', "sorting('user_Name', 'desc')");
				}
				
				if($('#userPhoneTh').attr('onclick') == "sorting('user_Phone', 'desc')"){
					$('#userPhoneTh').attr('onclick', "sorting('user_Phone', 'asc')");
				} else {
					$('#userPhoneTh').attr('onclick', "sorting('user_Phone', 'desc')");
				}
				
				if($('#userBirthTh').attr('onclick') == "sorting('user_Birth', 'desc')"){
					$('#userBirthTh').attr('onclick', "sorting('user_Birth', 'asc')");
				} else {
					$('#userBirthTh').attr('onclick', "sorting('user_Birth', 'desc')");
				}
			}
		});
	};
</script>
</html>