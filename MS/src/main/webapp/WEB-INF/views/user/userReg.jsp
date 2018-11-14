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

.birt_form{
}

.email_form{
	display:inline;
    width: 80%;
    height: 40px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
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
					class="form-control" id="user_id" name="user_id"
					placeholder="ID" required>
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
				<label for="user_birth">생년월일</label>
					<div class="">
						<select id="year" name="user_year" required>
							<option>년</option>
						</select>
						<select id="month" name="user_month" required>
							<option>월</option>
						</select>
						<select id="day" name="user_day" required>
							<option>일</option>
						</select>
					</div>
				<div class="check_font"></div>
			</div>
			<!-- 본인확인 이메일 -->
			<label for="user_email">이메일</label>
			<div class="form-inline">
				<input type="text" class="email_form" name="user_email" id="user_email" placeholder="E-mail" required>
					<button type="button" class="btn btn-outline-info waves-effect px-3 inI">
						<i class="fa fa-envelope"></i>&nbsp;인증
					</button>
				<div class="check_font" id="email_check"></div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="user_phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label> <input
					type="text" class="form-control" id="user_phone" name="user_phone"
					placeholder="Phone Number" required>
				<div class="check_font" id="phone_check"></div>
			</div>

			<div>
				<span>가입하실 매장을 선택해주세요.</span> <select name="store_id">
					<option value="1">MS 스터디카페</option>
					<option value="2">MS PC방</option>
					<option value="3">MS 코인노래방</option>
				</select>
			</div>
			<div class="reg_button">
				<button type="submit" class="btn btn-primary px-3" id="reg_submit">
					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
				</button>&emsp;&emsp;
				<a class="btn btn-danger px-3"
					href="${pageContext.request.contextPath}"> <i
					class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a>
			</div>
		</form>
	</div>
</body>
<script>

	// 날짜 스크립트
	// 1900년 ~ 현재 연도까지 추가
	for(var i = 1900; i<2018; i++){
		var option='<option value='+i+'>'+i+'년</option>';
		$('#year').append(option)
	}
	// 1월부터 12월까지 추가
	for(var i = 1; i <= 12; i++){
		var option='<option value='+i+'>'+i+'월</option>';
		$('#month').append(option);
	}
	// 1일부터 조건에 따른 말일까지
	for(var i = 1; i <= 31; i++){
		var option='<option value='+i+'>'+i+'일</option>';
		$('#day').append(option);
	}
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#user_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#user_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idCheck?userId='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	// 비밀번호 유효성 검사
	// 1-1 정규식 체크
	$('#user_pw').blur(function() {
		if (pwJ.test($('#user_pw').val())) {
			console.log('true');
			$('#pw_check').text('');
		} else {
			console.log('false');
			$('#pw_check').text('숫자 or 문자로만 4~12자리 입력');
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
		if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
		} else {
			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', 'red');
		}
	});
	
	// 이메일
	$('#user_email').blur(function(){
		if(mailJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$("#email_check").text('');
		} else {
			$('#email_check').text('이메일을 확인해주세요 :)');
			$('#email_check').css('color', 'red');
		}
	});
		
	// 휴대전화
	$('#user_phone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$("#phone_check").text('');
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
			$('#phone_check').css('color', 'red');
		}
	});

	// 가입하기 실행 버튼 유효성 검사!
	var inval_Arr = new Array(4).fill(false);
	$('#reg_submit').click(function(){
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#user_pw').val() == ($('#user_pw2').val()))
				&& pwJ.test($('#user_pw').val())) {
			inval_Arr[0] = true;
		} else {
			console.log('비밀번호를 확인해주세요 :)');
			inval_Arr[0] = false;
		}
		// 이름 정규식
		if (nameJ.test($('#user_name').val())) {
			inval_Arr[1] = true;	
		} else {
			console.log('이름을 확인해주세요 :)');
			inval_Arr[1] = false;
		}
		// 이메일 정규식
		if (mailJ.test($('#user_email').val())){
			console.log(phoneJ.test($('#user_email').val()));
			inval_Arr[2] = true;
		} else {
			alert('이메일을 확인해주세요 :)');
			inval_Arr[2] = false;
		}
		// 휴대폰번호 정규식
		if (phoneJ.test($('#user_phone').val())) {
			console.log(phoneJ.test($('#user_phone').val()));
			inval_Arr[3] = true;
		} else {
			alert('휴대폰번호를 확인해주세요 :)');
			inval_Arr[3] = false;
		}
		
		var validAll = true;
		for(var i = 0; i<inval_Arr.length; i++){
			
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		
		if(validAll){ // 유효성 모두 통과
			alert('갓민수 월드에 오신 걸 환영합니다 :p');
			return true;
		} else{
			return false;
		}
		
	});
		
</script>

</html>