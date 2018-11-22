<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zipcode.js"></script>
<style>
html, body {
	height: 100%;
}

body {
	margin: 0;
}

.container {
	min-height: 100%;
	width: 30%;
}

.titleStyle {
	padding: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
	color: black;
}

.container h1 {
	font-family: "Righteous";
	font-size: 50px;
	text-align: center;
}

.reg_button {
	padding: 20px;
	text-align: center;
}

#store_zip, #store_address1 {
	background-color: white;
}
</style>
</head>
<body>s
	<div class="container">
		<div class="titleStyle">
			<h1>매장등록</h1>
		</div>
		<form method="POST" onsubmit="return storeCheck()">
			<!-- 저장되있는 세션에서 로그인 아이디를 가져옴 -->
			<input type="hidden" name="admin_id" value="${adminSession.admin_id}">
			<!-- 매장이름 -->
			<div class="form-group">
				<label>매장명</label> 
				<input type="text" class="form-control" id="store_name" name="store_name" placeholder="매장명">
				<label id="store_name_la"></label>
			</div>
			<!-- 주소 -->
			<div class="form-group">
				<label class="d-block">주소</label>
				<div class="input-group">
					<input type="text" class="form-control d-inline" id="store_zip"	name="store_zip" readonly="readonly" placeholder="우편번호">
					<div class="input-group-append">
						<button type="button" class="btn bg-dark text-white" id="find_zip" onclick="execDaumPostcode()">우편번호 찾기</button>
					</div>
				</div>
				<input type="text" class="form-control" id="store_address1"	name="store_address1" readonly="readonly" placeholder="도로명주소">
				<input type="text" class="form-control" id="store_address2"	name="store_address2" placeholder="상세주소">
				<label id="store_add_la"></label>
			</div>
			<!-- 전화번호 -->
			<div class="form-group">
				<label>전화번호</label> 
				<input type="text" class="form-control" id="store_num" name="store_num" placeholder="전화번호">
				<label id="store_num_la"></label>
			</div>
			<div class="reg_button">
				<a class="btn btn-danger px-3" href="${pageContext.request.contextPath}/admin">취소</a>
				<button type="submit" class="btn btn-primary px-3" id="reg_submit">등록</button>
			</div>
		</form>
	</div>
</body>
<script>
	//우편번호 input이나 도로명주소 input을 클릭시 우편번호찾기를 강제적으로 클릭함
	$('#store_zip, #store_address1').click(function() {
		$('#find_zip').trigger('click');
	});
	
	function storeCheck() {

		if($('#store_name').val() == '') {
			$('#store_name_la').text('매장명을 입력해주세요.');
			$('#store_name').focus();
			return false;
		}
		
		if($('#store_zip').val() == '') {
			$('#store_add_la').text('주소를 입력해주세요.');
			return false;
		}
		
		if($('#store_address2').val() == '') {
			$('#store_add_la').text('상세주소를 입력해주세요.');
			$('#store_address2').focus();
			return false;
		}
		
		if($('#store_num').val() == '') {
			$('#store_num_la').text('전화번호를 입력해주세요.');
			$('#store_num').focus();
			return false;
		}
	}
	
	//전화번호 입력할때 공백이나 -입력시 삭제함
	$('#store_num').on('keydown blur', function(){
		var re_num = $('#store_num').val().replace(/[-]|\s/gi, '');
		$('#store_num').val(re_num);
	});
</script>
</html>