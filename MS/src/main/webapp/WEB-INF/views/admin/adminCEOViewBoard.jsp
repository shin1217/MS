<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 시간형식  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

.hypertext_none {
	color: #181818;
	text-decoration: none;
	
}
.userBoardView_con *{
	font-size: 17px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/modal/adminCEODelete.jsp"%>
	<div class="container" style="overflow: hidden; position: relative;">
		<br> <a class="nav-link, hypertext_none" href="${pageContext.request.contextPath}/admin/CEOBoard">
			<b style="font-size: 30px;">CEO게시판</b>
		</a><br><br> <a id="write" class="btn btn-outline-elegant waves-effect" href="${pageContext.request.contextPath}/admin/CEOBoardWrite">글쓰기</a>
	</div>

	<!-- 게시글  -->
	<table class="container">
		<thead>
			<tr class="row">
				<th colspan="3" style="width: 600px; padding-left: 15px;">
					<h3 style="color: #1e1e1e; width: 80%; padding-bottom : 15px">
						<strong style="width: 100%;">${CEOBoard_view.cboard_title}</strong>
					</h3>
				</th>
			</tr>
			<tr class="userBoardView_con">
				<th style="padding-left: 20px;">글번호 : ${CEOBoard_view.cboard_id}</th>
				<th style="width: 60%; text-align: center;">작성자 : ${CEOBoard_view.writer_cid }</th>
				<th style="width: 100%; text-align: right; padding-right: 20px;">등록시간 : <fmt:formatDate
						value="${CEOBoard_view.cboard_date}" pattern="yyyy-MM-dd HH:mm" /></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3" class="col-sm-9" >
					<hr> ${CEOBoard_view.cboard_con}
					<hr>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="buttonsRight">
			<c:if test="${sessionScope.adminSession.admin_id == CEOBoard_view.writer_cid}">
				<button type="button" class="btn btn-dark" data-toggle="modal"	data-target="#modalUserBoardDeleteForm">삭제</button>
				<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/user/userBoard/modify/${CEOBoard_view.cboard_id}?page=${param.page}&keyword=${param.keyword}'">수정</button>
			</c:if>
			<button type="button" class="btn btn-dark"
				onclick="location.href='${pageContext.request.contextPath}/admin/CEOBoard'">
				목록</button>
		</div>
</body>
</html>