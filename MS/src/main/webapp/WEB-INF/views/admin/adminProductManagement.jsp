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
	padding-right: 5px;
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
					<td style="width: 14%">이름</td>
					<td style="width: 16%">가격</td>
					<td style="width: 15%">재고</td>
					<td style="width: 20%">사진</td>
					<td style="width: 20%">관리</td>
				</tr>
				<tr>
					<form id="addProductForm" enctype="multipart/form-data">
						<td><input type="text" name="food_type" placeholder="ex) dessert"/></td>
						<td><input type="text" name="food_name" placeholder="ex) 콜라"/></td>
						<td><input type="text" name="food_price" placeholder="ex) 3000" style="width: 80%; margin-right: 5px"/>원</td>
						<td><input type="text" name="food_stock" placeholder="ex) 50" style="width: 80%; margin-right: 5px"/>개</td>
						<td><input type="file" name="food_photo"/></td>
						<input type="hidden" name="store_id" value="${storeSelectSession.store_id }"/>
					</form>
					<td>
						<button id="registerBtn">등록</button>
						<button id="resetBtn">초기화</button>
					</td>
				</tr>
			</tbody>
		</table>
		
		<table id="listTable" class="table table-bordered table-hover table-striped table_font">
			<thead class="thead-dark">
				<tr>
					<th scope="col" colspan="6" style="font-size: 20px">상품 리스트</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function() {
			getFoodList();
			
			/* 초기화 버튼 */
			// 동적 생성이 아닌 기존에 작성되어있기에 DOM 트리 생성 후 실행하는 함수인 document.ready 안에 들어오는것이 적절.
			$('#resetBtn').on('click', function () {
				$('input[type=text]').val(''); // 입력 값 초기화
			});
			
			/* 등록 버튼 */
			$('#registerBtn').on('click', function () {
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/insertFood',
					type: 'get',
					data: $('#addProductForm').serialize(),
						
					success:function(){
						getFoodList();
					}
				}); // end ajax
			});
		}); // end document.ready
		
		/* 삭제 버튼 */
		function deleteFood(id){
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/deleteFood?storeId=${storeSelectSession.store_id}&foodId='+id,
				type: 'get',
					
				success:function(){
					getFoodList();
				}
			}); // end ajax
		}
		
		/* 음식 리스트 전부 가져오기 */
		function getFoodList(){
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/getFoodInfoAll?storeId=${storeSelectSession.store_id}',
				type: 'get',
					
				success:function(data){
					var str = '<tr><td>#</td><td>타입</td><td>이름</td><td>가격</td><td>재고</td><td>관리</td></tr>';
					for(var i=0; i<data.length; i++){
						str += '<tr>';
						str += '<td>'+ data[i].food_id +'</td>';
						str += '<td>'+ data[i].food_type +'</td>';
						str += '<td>'+ data[i].food_name +'</td>';
						str += '<td>'+ data[i].food_price +'</td>';
						str += '<td>'+ data[i].food_stock +'</td>';
						str += '<td><button onclick=deleteFood('+ data[i].food_id +')>삭제</button></td>';
						str += '</tr>';
						
						$('#listTable > tbody').html(str); // tbody의 마지막에 행 추가
					}
				}
			});
		}
 	</script>
</body>
</html>