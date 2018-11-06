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
</style>
</head>
<body>
	<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
		<li class="nav-item"><a class="nav-link active" id="home-tab"
			data-toggle="tab" href="#home" role="tab" aria-controls="home"
			aria-selected="true"><i class="fa fa-home" aria-hidden="true"></i></a></li>
		<li class="nav-item"><a class="nav-link" id="profile-tab"
			data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
			aria-selected="false">내정보</a></li>
		<li class="nav-item"><a class="nav-link" id="contact-tab"
			data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
			aria-selected="false">음식주문</a></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab">1</div>
		<div class="tab-pane fade" id="profile" role="tabpanel"
			aria-labelledby="profile-tab">2</div>
		<div class="tab-pane fade" id="contact" role="tabpanel"
			aria-labelledby="contact-tab">3</div>
	</div>
	<div class="container"></div>
</body>
</html>