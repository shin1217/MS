<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
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
					class="form-control" id="user_id" name="user_id" placeholder="ID"
					required>
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="user_pw">비밀번호</label> <input type="password"
					class="form-control" id="user_pw" name="user_pw"
					placeholder="PASSWORD" required>
				<div class="check_font" id="pw_check"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="user_pw2">비밀번호 확인</label> <input type="password"
					class="form-control" id="user_pw2" name="user_pw2"
					placeholder="Confirm Password" required>
				<div class="check_font" id="pw2_check"></div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="user_name">이름</label> <input type="text"
					class="form-control" id="user_name" name="user_name"
					placeholder="Name" required>
				<div class="check_font" id="name_check"></div>
			</div>
			<!-- 생년월일 -->
			<div class="form-group">
				<label for="user_birth">생년월일</label> <input type="text"
					class="form-control" id="user_birth" name="user_birth"
					placeholder="Birth" required>
				<div class="check_font" id="birth_check"></div>
			</div>
			<!-- 본인확인 이메일 -->
			<label for="user_email1">이메일</label>
			<div class="form-inline">
				<input type="text" class="form-control mb-2 mr-sm-2"
					name="user_email1" id="user_email1" placeholder="E-mail" required>
				<!-- Default input -->
				<div class="input-group mb-2 mr-sm-2">
					<div class="input-group-prepend">
						<div class="input-group-text">@</div>
					</div>
					<input type="text" class="form-control py-0" name="user_email2"
						id="user_email2" placeholder="" required>
				</div>
					<button type="button"
						class="btn btn-outline-info waves-effect px-1">
						<i class="fa fa-envelope"></i>&nbsp;인증
					</button>
				<div class="check_font" id="email_check"></div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="user_phone">휴대전화 (ex. 010-1111-2222)</label> <input
					type="text" class="form-control" id="user_phone" name="user_phone"
					placeholder="Phone Number" required>
				<div class="check_font">confirm message</div>
			</div>

			<div>
				<span>가입하실 매장을 선택해주세요.</span> <select name="store_id">
					<option value="1">MS 스터디카페</option>
					<option value="2">MS PC방</option>
					<option value="3">MS 코인노래방</option>
				</select>
			</div>
			<div class="reg_button">
				<a class="btn btn-danger px-3"
					href="${pageContext.request.contextPath}"> <i
					class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a> &emsp;&emsp;
				<button type="submit" class="btn btn-primary px-3" id="reg_submit">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</button>
			</div>
		</form>
	</div>
</body>
<script>
	//아이디, 비밀번호 정규식
	var idJ = /^[A-Za-z0-9]{4,8}$/;
	var pwJ = /^[A-Za-z0-9]{6,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	//sadtear.tistory.com/106 [[ Be Happy...]]
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 특수문자 정규식

	// 회원가입 유효성 검사(1 = 중복 / 0 != 중복)
	var idChk = 0;

	$("#user_id").blur(function() {
		// id = "id_reg" / name = "userId"
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idCheck?userId='	+ $("#user_id").val(),
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);
									if (data == 1) {
											// 1 : 아이디가 중복되는 문구
											$("#id_check").text("아이디가 존재하니 다른 아이디를 사용해주세요 :p");
											$("#id_check").css("color", "red");
											$("#reg_submit").click(function() {
												// 1+n번째 실행했을 때 경고문이 너무 많이 뜸
												alert("다른 아이디를 사용해주세요 :)");
												$('#user_id').focus();
												return false;
											});

										} else {
											// 0 : 아이디 길이 / 문자열 검사
											$("#id_check").text("멋진 아이디네요!");
											$("#id_check").css("color", "blue");
											$("#reg_submit").click(function() {
												return true;
											});
										}
									},
									error : function() {
										console.log("실패");
									}

								});
					});

	// 아이디 정규식 체크
	$('#user_id').blur(function(){
		if(idJ.test($('#user_id').val())) {
			console.log(idJ.test($('#user_id').val()));
			$('#id_check').text('');
			$("#reg_submit").click(function() {
				// 1+n번째 실행했을 때 경고문이 너무 많이 뜸
				alert("다른 아이디를 사용해주세요 :)");
				$('#user_id').focus();
				return false;
			});
		} else {
			$('#id_check').text('문자 or 숫자 4~8자리');
			$('#id_check').css('color', 'red');
		}
	});
	
	// 1-1 정규식 체크
	$('#user_pw').blur(function() {
		if (pwJ.test($('#user_pw').val())) {
			console.log('ture');
			$('#pw_check').text('');
		} else {
			console.log('false');
			$('#pw_check').text('숫자 or 문자로 6~12자리 입력');
			$('#pw_check').css('color', 'red');
		}

	});
	// 1-2 패스워드 일치 확인
	$('#user_pw2').blur(function() {
		if ($('#user_pw').val() != $(this).val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
			$('#pw2_check').css('color', 'red');
		} else {
			$('#pw2_check').text('');
		}
	});

	// 이름에 특수문자 들어가지 않도록 설정
	$("#user_name").blur(function() {
		if (nameJ.test($('#user_name').val())) {

			$("#name_check").text('');

		} else {

			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', 'red');
		}

	});

	// 가입하기 실행 버튼 유효성 검사!
	$('#reg_submit').click(function() {
		// 아이디 정규식
		if (idJ.test($('#user_id').val())) {
			return true;
		}else {
			alert('아이디를 확인해주세요 :)');
			return false;
		}
		
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#user_pw').val() == ($('#user_pw2').val()))
		&& pwJ.test($('#user_pw').val())) {
			return true;

		} else {
			alert('비밀번호를 확인해주세요 :)');
			return false;
		}
		
		// 이름 정규식
		if (nameJ.test($('#user_name').val())) {
			return true;
		} else {
			alert('이름을 확인해주세요 :)');
			return false;
		}
	});
	
</script>

</html>