<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 시간형식  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MS</title>
<style>
.row {
	margin-top: 50px;
	color: #666;
}

.buttonsLeft {
	float: left;
	display: block;
}

.buttonsRight {
	float: right;
	display: block;
}

.comments {
	padding-top: 40px;
}

#write {
	float: right;
	margin: 20px;
}
/* 공지사항 게시판 제목 오버 */
.notice-title:hover {
	text-decoration: underline;
}

.userBoardView_header {
	overflow: hidden;
	width: 1140px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/userHeader.jsp"%>
	<div class="userBoardView_header">
		<br>
		<h1>유저게시판</h1>
		<a id="write" class="btn btn-outline-elegant waves-effect"
			href="${pageContext.request.contextPath}/user/userBoardWrite">글쓰기</a>
	</div>
	<table class="container">

		<thead>

			<tr class="row">

				<th class="col-sm-3" colspan="3">
					<h3 style="color: #1e1e1e;">
						<strong>${userboardvo.uboard_title}</strong>
					</h3>
				</th>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">${userboardvo.user_id}</th>
				<th></th>
				<th style="width: 30%; text-align: right;"><fmt:formatDate
						value="${userboardvo.uboard_date}" pattern="yyyy-MM-dd HH:mm" /></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3" class="col-sm-9">
					<hr> ${userboardvo.uboard_con}
					<hr>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>