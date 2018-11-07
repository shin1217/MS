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
</style>
</head>
<body>

	<div class="container">
		<div class="titleStyle">
			<h1>MS :p</h1>
		</div>
		<form method="POST">
			<!-- 아이디 -->
			<div class="form-group">
				<label for="user_id">아이디</label> <input type="text"
					class="form-control" id="user_id" name="user_id" placeholder="ID">
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="user_pw">비밀번호</label> <input type="text"
					class="form-control" id="user_pw"" name="user_pw"
					placeholder="PASSWORD">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="user_pw2">비밀번호 재확인</label> <input type="text"
					class="form-control" id="user_pw2" name="user_pw2"
					placeholder="Confirm Password">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="user_name">이름</label> <input type="text"
					class="form-control" id="user_name" name="user_name"
					placeholder="Name">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 생년월일 -->
			<div class="form-group">
				<label for="user_birth">생년월일</label> <input type="text"
					class="form-control" id="user_birth" name="user_birth"
					placeholder="Birth">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 본인확인 이메일 -->
			<label for="user_email1">이메일</label>
			<div class="form-inline">
				<input type="text" class="form-control mb-2 mr-sm-2" id="user_email1"
					name="user_email1" placeholder="E-mail">
				<!-- Default input -->
				<div class="input-group mb-2 mr-sm-2">
					<div class="input-group-prepend">
						<div class="input-group-text">@</div>
					</div>
					<input type="text" class="form-control py-0" id="user_email2"
						name="user_email2" placeholder="">
				</div>
				<button type="button" class="btn btn-outline-info waves-effect px-3">
					<i class="fa fa-envelope"></i>&nbsp;인증
				</button>
				<div class="check_font">confirm message</div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="user_phone">휴대전화</label> <input type="text"
					class="form-control" id="user_phone" name="user_phone"
					placeholder="Phone Number">
				<div class="check_font">confirm message</div>
			</div>

			<div>
				<span>방문하신 지점은?</span>
				<select name="store_id">
					<option value="1">MS 스터디카페</option>
					<option value="2">MS PC방</option>
					<option value="3">MS 코인노래방</option>
				</select>
			</div>
			<div class="reg_button">
				<button type="button" class="btn btn-danger px-3">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</button>
				&emsp;&emsp;
				<button type="submit" class="btn btn-primary px-3" id="reg_submit">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</button>
			</div>
		</form>
	</div>
</body>
<script>
	// 회원가입 유효성 검사(1 = 중복 / 0 != 중복)
	var idChk = 0;

	$("#user_id")
			.blur(
					function() {

						// id = "id_reg" / name = "userId"
						$
								.ajax({
									url : '${pageContext.request.contextPath}/user/idCheck?userId='
											+ $("#user_id").val(),
									type : 'get',
									success : function(data) {
										console.log("1 = 중복o / 0 = 중복x : "
												+ data);

										if (data == 1) {
											// 1 : 아이디가 중복되는 문구
											$("#id_check")
													.text(
															"아이디가 존재하니 다른 아이디를 사용해주세요 :p");
											$("#id_check").css("color", "red");

										} else {
											// 0 : 아이디 길이 / 문자열 검사
											$("#id_check").text("멋진 아이디네요!");
										}

									},
									error : function() {
										console.log("실패");
									}

								});

					});
</script>

</html>