<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="styleSheet" href="../css/css_loginForm.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<style>
#failColar {
	color: red;
}
</style>


</head>
<body>

	<form id="loginForm" method="post">
		<div class="imgcontainer">
			<img src="../images/img_avatar2.png" alt="Avatar" class="avatar">
		</div>

		<div class="container">
			<label for="userId"><b>UserId</b></label> <input type="text"
				placeholder="Enter UserId" value="${cookie.check.value}"
				name="userId" required> <label for="userPw"><b>Password</b></label>
			<input type="password" placeholder="Enter Password" name="userPw"
				required>
			<!-- 로그인 폼 체크 -->
			<div id="loginChk">
				<c:if test="${param.loginfail}">
					<span id="failColar">로그인에 실패했습니다!<br>
					ID와 PASSWORD를 확인해주세요.
					</span>
				</c:if>
			</div>
			<button id="loginBtn" type="submit">Login</button>
			<label> <input type="checkbox" checked="checked"
				name="remember"> Remember me
			</label>
		</div>

		<div class="container" style="background-color: #f1f1f1">
			<button type="button" class="cancelbtn" onclick="location.href='../'">Cancel</button>
		</div>
	</form>

</body>
</html>
