<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
html, body {
	height: 100%;
}

body {
	margin: 0;
}

.container {
	min-height: 100%;
	width: 28.9%;
}

.titleStyle {
	padding: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
	/* color: #2E64FE; */
	color: black;
}

.container h1 {
	font-family: "Righteous";
	font-size: 80px;
	text-align: center;
}

.reg_button {
	padding: 20px;
	text-align: center;
}
</style>
</head>
<body>

	<div class="container">
		<div class="titleStyle">
			<h1>매장등록</h1>
		</div>
		<form method="POST">
			<!-- 매장이름 -->
			<div class="form-group">
				<label>매장명</label> 
				<input type="text" class="form-control" id="storeName" placeholder="매장명">
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- 주소 -->
			<div class="form-group">
				<label>주소</label> 
				<input type="text" class="form-control" placeholder="우편번호"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				<input type="text" class="form-control" placeholder="주소">
				<input type="text" class="form-control" placeholder="상세주소">
			</div>
			<!-- 전화번호 -->
			<div class="form-group">
				<label>전화번호</label> 
				<input type="text" class="form-control" id="admin_pw" name="admin_pw" placeholder="전화번호">
			</div>
			<div class="reg_button">
				<a class="btn btn-danger px-3" href="${pageContext.request.contextPath}/admin">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a>
				&emsp;&emsp;
				<button type="submit" class="btn btn-primary px-3" id="reg_submit">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</button>
			</div>
		</form>
	</div>
</body>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			}
		}).open();
	}
</script>
</html>