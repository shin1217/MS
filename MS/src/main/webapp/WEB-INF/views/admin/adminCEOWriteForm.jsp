<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 시간형식  -->
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MS</title>
<style>
.hypertext_none {
	color: #181818;
	text-decoration: none;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="overflow: hidden; position: relative;">
		<br> <a class="nav-link, hypertext_none" href="${pageContext.request.contextPath}/admin/CEOBoard">
			<b style="font-size: 30px;">CEO게시판</b>
		</a>
	</div>

	<div class="container">
		<form class="text-center p-5" method="post">
			<input type="text" class="form-control" placeholder="제목" name="cboard_title" value="" required>
			<!-- name값과 메서드의 매개변수가 이름이 같으면 알아서 넣어줌 -->
			<textarea class="form-control" rows="20" placeholder="내용" name="cboard_con" value="" required></textarea>
			<button type="submit" class="btn btn-info btn-block">작성하기</button>
		</form>
	</div>
</body>
</html>