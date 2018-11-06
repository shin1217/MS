<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#main-container {
	margin-left: -20px;
	min-width: 800px !important;
	overflow: hidden;
	max-width: 100% !important;
}

#messageTitle {
	font-weight: bold;
	margin-top: 30px;
	margin-left: 50px;
	margin-bottom: 10px;
}

#wrap {
	position: relative;
	margin-left: 50px;
	margin-right: 50px;
}

#messageUlWrap {
	float: left;
}

#messageUl {
	background-color: #eee;
	padding: 15px 10px;
	text-align: center;
	width: 250px;
	height: 250px;
	border-right: 3px solid #8e8e8e;
	border-bottom: 3px solid #8e8e8e;
	margin-left: 40px;
	list-style: none;
	margin-bottom: 30px;
	border-radius: 10px;
}

#messageUl textarea {
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 8px;
	height: 120px;
	border-radius: 5px;
	font-weight: bold;
}

#messageUl li {
	font-size: 17px;
	font-weight: bold;
}

#messageBtn {
	margin: 0px 10px;
	font-size: 15px;
	color: white;
	background-color: black;
	text-decoration: none;
	padding: 10px;
	border-radius: 5px;
}

.messageBtnClass {
	background-color: red !important;
}

#messageBtn:hover {
	background-color: #8e8e8e;
	cursor: pointer;
}

.messageBtnClass:hover {
	background-color: palevioletred !important;
}

#detailDiv {
	width: 450px;
	height: 550px;
	background-color: #eee;
	position: absolute;
	border: 1px solid black;
	right: 500px;
	top: 100px;
	border-radius: 10px;
}

#detailUl {
	list-style: none;
	padding: 20px 20px;
	text-align: center;
}

#detailUl h3 {
	font-weight: bold;
	margin-bottom: 20px;
}

#detailUl li {
	font-weight: bold;
}

#detailUl input[type=text] {
	margin-left: 5px;
	margin-bottom: 15px;
	width: 250px;
	height: 33px;
	border: none;
	padding: 6px 12px 6px 12px;
	font-weight: bold;
	border-radius: 7px;
}

#detailUl textarea {
	margin-top: 5px;
	height: 200px;
	font-size: 20px;
	padding: 15px;
	border-radius: 7px;
	font-weight: bold;
}

#detailFoot {
	margin-top: 20px;
	text-align: center;
}

#detailDel, #detailClose {
	color: white;
	border: none;
	background-color: black;
	text-decoration: none;
	border-radius: 7px;
	padding: 13px;
	font-size: 17px;
}

#detailClose {
	padding: 13px 28px !important;
	margin-left: 50px;
}

#detailDel {
	background-color: red;
}

#detailDel:hover {
	background-color: palevioletred;
}

#detailClose:hover {
	background-color: #8e8e8e;
	cursor: pointer;
}

#mainModal {
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	z-index: 1;
	background-color: rgba(0, 0, 0, 0.4);
}

hr {
	margin-left: 40px;
	border: 0;
	border-top: 1px solid rgba(0, 0, 0, .1)
}

#nomessage {
	margin-left: 50px;
	font-size: 30px;
	color: red;
	font-weight: bold;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" id="main-container">
		<h1 id="messageTitle">메시지 리스트</h1>
		<hr>
		<c:if test="${empty list}">
			<!-- jstl 에서 null값인지 확인할때는 empty를 넣어줘야함 -->
			<div id="noMessage">※ 메세지가 없습니다.</div>
		</c:if>

		<c:if test="${list != null}">
			<div id="wrap">
				<c:forEach var="message" items="${list}" varStatus="status">
					<div id="messageUlWrap">
						<ul id="messageUl">
							<li>메시지 번호 : ${message.messageId}</li>
							<li>아이디 : ${message.userId}</li>
							<li><textarea readonly cols="20">${message.messageCon}</textarea></li>
							<a href="message?messageId=${message.messageId}" id="messageBtn">상세보기</a>
							<a href="delete?messageId=${message.messageId}" id="messageBtn" class="messageBtnClass">삭제하기</a>
						</ul>
					</div>
				</c:forEach>
			</div>
		</c:if>

		<!-- 상세보기가 나오는 창 -->
		<c:if test="${detail.messageId !=null}">
			<div id="mainModal">
				<div id="detailDiv">
					<ul id="detailUl">
						<h3>메시지 상세보기</h3>
						<li>메시지 번호 : <input type="text" value="${detail.messageId}"
							readonly></li>
						<li>보낸 아이디 : <input type="text" value="${detail.userId}"
							readonly></li>
						<li>메시지 날짜 : <input type="text" value="${detail.messageDate}"
							pattern="yyyy-MM-dd HH:mm" readonly></li>
						<li>메시지 제목 : <input type="text"
							value="${detail.messageTitle}" readonly></li>
						<li><textarea readonly cols="31"> ${detail.messageCon}</textarea></li>
						<div id="detailFoot">
							<a href="delete?messageId=${detail.messageId}" id="detailDel">삭제하기</a>
							<a id="detailClose">닫 기 </a>
						</div>
					</ul>
				</div>
			</div>
		</c:if>
	</div>

</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
	$(document).ready(function() {
		$('#detailClose').click(function() {
			$('#mainModal').hide();
		});
	});

	$(window).on('click', function() {
		//jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
		if (event.target == $('#mainModal').get(0)) {
			$('#mainModal').hide();
		}
	});
</script>
</html>