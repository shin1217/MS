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

.full {
	background-image:
		url("<%=request.getContextPath()%>/images/main_back.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
}

.area_inputs {
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<div class="full">
		<div class="container">
			<div style="text-align: right;">
				<a href="admin"> <img
					src="${pageContext.request.contextPath}/images/admin_setting.png"
					alt="관리자페이지" style="height: 50px; margin-top: 30px;" />
				</a>
			</div>
			<div class="area_inputs">
				<form action="${pageContext.request.contextPath}/user/main"
					method="get">
					<div class="form-group">
						<label for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId"
								placeholder="아이디">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword">비밀번호</label>
						<div>
							<input type="password" class="form-control" id="inputPassword"
								placeholder="비밀번호">
						</div>
					</div>
					<div class="form-group">
						<div>
							<button type="submit" class="btn btn-primary btn-block">로그인</button>
						</div>
					</div>
				</form>
				<div class="col-sm-10">
					<a class="btn btn-primary"
						href="${pageContext.request.contextPath}/user/reg">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>