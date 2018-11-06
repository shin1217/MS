<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
	
<style>
body, html {
	height: 100%;
}
.view {
	background-image: url("<%=request.getContextPath()%>/images/back.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
}
.buttons {
	text-align: center;
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
}
.links {
	text-align: center;
	position: absolute;
	left: 50%;
	bottom: 20%;
	transform: translate(-50%, -50%);
}
.hr-light {
  border-top: 3px solid #fff;
  width: 130px;
}
</style>

</head>
<body>
	<div class="view" >
		<div class="buttons">
			<h1 class="white-text font-weight-bold mb-4 pt-md-5 pt-5 wow fadeInDown" data-wow-delay="0.3s"><strong>안녕하세요</strong></h1>
			<hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
			<a class="btn btn-secondary btn-lg font-weight-bold wow fadeInDown" data-wow-delay="0.8s"  style="width: 200px" href="member/login">로그인</a>
			<a class="btn btn-default btn-lg font-weight-bold wow fadeInDown" data-wow-delay="0.8s" style="width: 200px" href="member/reg">회원가입</a>
		</div>
		<div class ="links">
			<a class="white-text wow fadeIn" data-wow-delay="0.8s"" href="member/search">아이디 또는 비밀번호가 기억나지 않으세요?</a>
		</div>
	</div>
</body>

<script>

	// Animations init
	new WOW().init();
	
</script>
</html>
