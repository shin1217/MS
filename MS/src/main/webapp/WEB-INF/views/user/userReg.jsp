<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
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
</style>
</head>
<body>

	<div class="container">
	<h1>동진이</h1>
		<form action="">
			<!-- 아이디 -->
			<div class="form-group">
				<label for="reg_id">아이디</label> <input type="text"
					class="form-control" id="reg_id" placeholder="ID">
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="reg_pw">비밀번호</label> <input type="text"
					class="form-control" id="reg_pw" placeholder="PASSWORD">
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="reg_pw2">비밀번호 재확인</label> <input type="text"
					class="form-control" id="reg_pw2" placeholder="Confirm Password">
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="reg_name">이름</label> <input type="text"
					class="form-control" id="reg_name" placeholder="Name">
			</div>
			<!-- 생년월일 -->
			<div class="form-group">
				<label for="reg_birth">생년월일</label> <input type="text"
					class="form-control" id="reg_birth" placeholder="Birth">
			</div>
			<!-- 본인확인 이메일 -->
			<div class="form-group">
				<label for="reg_email">이메일</label> <input type="text"
					class="form-control" id="reg_email" placeholder="E-Mail">
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="reg_birth">휴대전화</label> <input type="text"
					class="form-control" id="reg_birth" placeholder="Phone Number">
			</div>
		</form>
	</div>
</body>
</html>