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
<link
	href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext"
	rel="stylesheet">
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

.check_font {
	color: red;
}
</style>
</head>
<body>

	<div class="container">
		<div class="titleStyle">
			<h1>MS :p</h1>
		</div>
		<form action="">
			<!-- 아이디 -->
			<div class="form-group">
				<label for="reg_id">아이디</label> <input type="text"
					class="form-control" id="reg_id" placeholder="ID">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="reg_pw">비밀번호</label> <input type="text"
					class="form-control" id="reg_pw" placeholder="PASSWORD">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="reg_pw2">비밀번호 재확인</label> <input type="text"
					class="form-control" id="reg_pw2" placeholder="Confirm Password">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="reg_name">이름</label> <input type="text"
					class="form-control" id="reg_name" placeholder="Name">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 생년월일 -->
			<div class="form-group">
				<label for="reg_birth">생년월일</label> <input type="text"
					class="form-control" id="reg_birth" placeholder="Birth">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 본인확인 이메일 -->
			<label for="reg_email">이메일</label>
			<div class="form-inline">
				<input type="text" class="form-control mb-2 mr-sm-2" id="reg_email"
					placeholder="E-mail">
				<!-- Default input -->
				<div class="input-group mb-2 mr-sm-2">
					<div class="input-group-prepend">
						<div class="input-group-text">@</div>
					</div>
					<input type="text" class="form-control py-0" id="reg_email2"
						placeholder="">
				</div>
				<button type="button" class="btn btn-outline-info waves-effect px-3">
					<i class="fa fa-envelope"></i>&nbsp;인증
				</button>
				<div class="check_font">confirm message</div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="reg_birth">휴대전화</label> <input type="text"
					class="form-control" id="reg_birth" placeholder="Phone Number">
				<div class="check_font">confirm message</div>
			</div>

			<!--Dropdown primary-->
			<div class="dropdown">
				<!--Trigger-->
				<button class="btn btn-default dropdown-toggle" type="button"
					id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">방문하신 지점은?</button>
				<!--Menu-->
				<div class="dropdown-menu dropdown-primary">
					<a class="dropdown-item" href="#">MS 스터디카페</a> <a
						class="dropdown-item" href="#">MS PC방</a> <a class="dropdown-item"
						href="#">MS 코인노래방</a>
				</div>
			</div>
			<!--/Dropdown primary-->
			<div class="reg_button">
				<button type="button" class="btn btn-danger px-3">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</button>
				&emsp;&emsp;
				<button type="button" class="btn btn-primary px-3">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</button>
			</div>
		</form>
	</div>
</body>
	<script>
	
		function validate(){
			
			var id = 
			
		}
	
	</script>
</html>