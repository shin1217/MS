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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container">
		<h1>좌석 관리</h1>
		<br>
		<table id="seatListTable" class="table table-striped table-bordered">
			<!-- 좌석등록 폼 -->
			<thead>
				<tr>
					<td style="color: white; background-color: #101010;" colspan="4"><h4>좌석 추가</h4></td>
				</tr>
				<tr>
					<th class="th-sm">좌석이름</th>
					<th class="th-sm">비용</th>
					<th class="th-sm">QR코드</th>
					<th class="th-sm">관리</th>
				</tr>
			</thead>
			<tbody>
				<form>
					<tr>
						<td style="text-align: center;"><input type="hidden"
							id="store_id" name="store_id"
							value="${storeSelectSession.store_id}" /> <input type="text"
							id="seat_name" name="seat_name"></td>
						<td style="text-align: center;"><input type="text"
							id="seat_pay" name="seat_pay" style="width: 70%;" /> 원 / 시간</td>
						<td><input type="file" name="seat_qr" id="seat_qr" /></td>
						<td style="text-align: center;"><button id="addseat_btn" type="button">등록</button><button id="reset" type="reset">취소</button></td>
					</tr>
				</form>
				<tr>
					<td style="color: white; background-color: #101010;" colspan="4"><h4>좌석 리스트</h4></td>
				</tr>
			</tbody>
			<!-- 좌석등록 폼 -->
			<!-- 좌석리스트 -->
			<thead>
				<tr>
					<th class="th-sm"><i class="fa fa-sort float-right"
						aria-hidden="true"></i>좌석이름</th>
					<th class="th-sm"><i class="fa fa-sort float-right"
						aria-hidden="true"></i>비용</th>
					<th class="th-sm"><i class="fa fa-sort float-right"
						aria-hidden="true"></i>QR코드</th>
					<th class="th-sm"><i class="fa fa-sort float-right"
						aria-hidden="true"></i>관리</th>
				</tr>
			</thead>
			<tbody id="seatlist_tbody">
				<%-- 	<c:forEach var="list" items="${seatlist}">
					<tr>
						<td>${list.seat_name}</td>
						<td style="text-align: right;">${list.seat_pay}</td>
						<td style="text-align: center;">${list.seat_qr}</td>
						<td style="text-align: center;"><button id="seat_modify"
								type="button">수정</button>
							<button id="seat_delete" type="button">삭제</button></td>
					</tr>
				</c:forEach> --%>
			</tbody>
			<!-- 좌석리스트 -->
		</table>
	</div>
</body>
<script>
	$(document).ready(function() {
		getSeatList()
	});

	var seat_t = '';
	var session_store_id = '${storeSelectSession.store_id}';

	function getSeatList() { // 좌석 리스트 출력
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/admin/seat/list',
			
			data : {
				store_id : session_store_id
			},

			success : function(data) {
				console.log(data);
				$('#seatlist_tbody').html('');
				$(data).each(
						function(index, item) {
							seat_t += '<tr><td style="text-align: right;">'
									+ item.seat_name
									+ '</td><td style="text-align: right;">'
									+ item.seat_pay + '</td>'
									+ '<td style="text-align: center;">'
									+ item.seat_qr
									+ '</td><td style="text-align: center;">'
									+ '<button id="seat_modify_btn'
									+ item.seat_id + '" onclick="seat_modify('
									+ item.seat_id
									+ ')" type="button">수정</button>'
									+ '<button id="seat_delete_btn'
									+ item.seat_id + '" onclick="seat_delete('
									+ item.seat_id
									+ ')" type="button">삭제</button></td></tr>';
							$('#seatlist_tbody').html(seat_t);
						});
				seat_t = '';
			}
		});
	}

	$('#addseat_btn').click(function() {//좌석 추가
		var seat_name = $('#seat_name').val();
		var seat_pay = $('#seat_pay').val();
		var seat_qr = $('#seat_qr').val();
		var store_id = $('#store_id').val();

		if (seat_pay) {
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/admin/seat',
				dataType : 'text',
				data : {
					seat_name : seat_name,
					seat_pay : seat_pay,
					seat_qr : seat_qr,
					store_id : store_id
				},

				success : function(data) {
					console.log('좌석등록완료');
					getSeatList();
					$('#seat_name').val('');
					$('#seat_pay').val('');
					$('#seat_qr').val('');
				}
			});
		} else {
			alert("좌석정보를 입력해주세요 XD");
		}
	});

	function seat_delete(seat_id) { // 좌석삭제
		$.ajax({
			type : 'delete',
			url : '${pageContext.request.contextPath}/admin/seat/' + seat_id,
			success : function(data) {
				console.log('삭제확인');
				getSeatList();
			}
		});
	};
</script>
</html>