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
				<label for="admin_id">아이디</label> <input type="text"
					class="form-control" id="admin_id" name="admin_id" placeholder="ID">
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="admin_pw">비밀번호</label> <input type="password"
					class="form-control" id="admin_pw" name="admin_pw"
					placeholder="PASSWORD">
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="admin_pw2">비밀번호 재확인</label> <input type="password"
					class="form-control" id="admin_pw2" name="admin_pw2"
					placeholder="Confirm Password">
				<div class="check_font" id="pw_check"></div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="admin_name">이름</label> <input type="text"
					class="form-control" id="admin_name" name="admin_name"
					placeholder="Name">
				<div class="check_font">confirm message</div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="admin_phone">휴대전화</label> <input type="text"
					class="form-control" id="admin_phone" name="admin_phone"
					placeholder="Phone Number">
				<div class="check_font">confirm message</div>
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
	// <회원가입> 중복 유효성 검사(1 = 중복 / 0 != 중복)
	var idChk = 0;

	$("#admin_id").blur(function() {
		// id = "id_reg" / name = "admin_id"
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/idCheck?adminId='+$("#admin_id").val(),
			type : 'get',
			success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);
				if (data == 1) {// 1 : 아이디가 중복되는 경우
					$("#id_check").text("아이디가 존재하니다 :(");
					$("#id_check").css("color", "red");
					$("#admin_id").focus();
					$("#reg_submit").attr("disabled", true);
					
				} else {// 0 : 아이디 길이, 문자열 검사
					$("#id_check").text("성공을 부르는 아이디네요 :p");
					$("#id_check").css("color", "blue");
					$("#reg_submit").attr("disabled", false);
				}
			},
			error : function() {console.log("실패");
			}
		});
	});
	
	// <비밀번호> 일치 검사
	$("#admin_pw2").blur(function(){
		// pw1 & pw2 일치하지 않는다면,
		if($("#admin_pw").val() != $(this).val()){
			$("#pw_check").text("비밀번호가 일치하지 않습니다 :(");
			$("#pw_check").css("color", "red");
			$(this).focus();
			$("#reg_submit").attr("disabled", true);
			
		} else {
			$("#pw_check").text("양식에 맞게 잘 기입하고 계십니다 :p");
			$("#pw_check").css("color", "blue");
			$("#reg_submit").attr("disabled", false);
		}
	});
	
	
</script>

</html>