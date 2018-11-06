<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.post {
	padding: 0 1.5%;
}
.comment-form .form-control {
	border: 0px;
	background: #eee;
	min-height: 50px;
}

.comment-form>.row {
	margin: 0 -1.5%;
}

.comment-form [class*="col-"] {
	padding: 0 1.5%
}

.form-group {
	margin-bottom: 40px !important;
	
}

.messageTitle {
	margin-top: 20px;
	font-size : 35px;
	font-weight : bold;
}
hr{
	margin-bottom : 50px !important;
}
#userId {
	background-color : darkgray;
	font-weight : bold;
	font-size : 20px;
}

@media ( min-width :992px) {
	.post {
		width: 50%;
		max-width: 500px;
		margin: 0 auto;
	}
	.comment-form label {
		position: absolute;
		width: 200px;
	}
	.comment-form .name, .comment-form .email, .comment-form .message {
		top: -27px;
		font-weight: bold;
		
	}
}

@media ( min-width :1200px) {
	.post {
		max-width: 525px;
	}
}
#submit {
	font-size : 15px;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="post">
			<div class="contact">
				<div class="messageTitle">
					<p>메시지 남기기</p>
				</div>
				<hr>
				<form class="comment-form" method="post">
					<div class="row">
						<div class="col-md-12 form-group">
							<label class="name">보내는 사람</label> <input type="text"
								class="form-control" placeholder="user Id" name="userId"
								value = "${userVO.userId }" id = "userId" readonly/>
						</div>
						<div class="col-md-12 form-group">
							<label class="email">메시지 제목</label> <input type="text"
								class="form-control" placeholder="message Title"
								name="messageTitle" id = "messageTitle" required />
						</div>
						<div class="clearfix"></div>
						<div class="col-md-12 form-group">
							<label class="message">메시지 내용</label>
							<textarea class="form-control" cols="47" rows="7"
								placeholder="Message" name="messageCon" id = "messageCon" required></textarea>
						</div>
						<div class="col-md-12 form-group">
							<input type="submit" class="btn btn-block btn-lg btn-success"
								value="메시지 남기기" id = "submit">
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		$('#submit').click(function(){
			var messageTitle = $('#messageTitle').val();
			var messageCon = $('#messageCon').val();
			if(messageTitle != null && messageCon != null && messageTitle != "" && messageCon != ""){
				alert("메시지를 남겼습니다.");
			} else {
				alert("메시지 제목 혹은 메시지 내용을 입력하세요");
			}
		});
	});
</script>

</html>