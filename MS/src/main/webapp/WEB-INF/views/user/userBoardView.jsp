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

.userBoard_header {
	overflow: hidden;
	width: 1140px;
	margin: 0 auto;
}

.hypertext_none {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="userBoard_header">
		<br> <a class="nav-link"
			href="${pageContext.request.contextPath}/user/userBoard?page=1"><h1
				class="hypertext_none">유저게시판</h1></a> <a id="write"
			class="btn btn-outline-elegant waves-effect"
			href="${pageContext.request.contextPath}/user/userBoard/Write">글쓰기</a>
	</div>
	<table class="container">
		<thead>
			<tr class="row">
				<th colspan="3" style="width: 800px;">
					<h3 style="color: #1e1e1e; width: 80%;">
						<strong style="width: 100%;">${userboardvo.uboard_title}</strong>
					</h3>
				</th>
			</tr>
			<tr>
				<th style="padding-left: 20px;">${userboardvo.uboard_id}</th>
				<th style="width: 40%; text-align: center;">${userboardvo.user_id}</th>

				<th style="width: 50%; text-align: right;"><fmt:formatDate
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
	<div class="userBoard_header">
		<div class="buttonsLeft">
			<c:choose>
				<c:when test="${previousnum==0}">
					<!-- <button type="button" class="btn btn-outline-elegant waves-effect">없음</button> -->
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-outline-elegant waves-effect"
						onclick="location.href='${pageContext.request.contextPath}/user/userBoard/View/${previousnum}?page=${param.page}'">이전</button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${nextnum==0}">
					<!-- <button type="button" class="btn btn-outline-elegant waves-effect">없음</button> -->
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-outline-elegant waves-effect"
						onclick="location.href='${pageContext.request.contextPath}/user/userBoard/View/${nextnum}?page=${param.page}'">다음</button>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="buttonsRight">

			<c:if
				test="${sessionScope.userSession.user_id == userboardvo.user_id || sessionScope.adminSession != null}">
				<button type="button" class="btn btn-dark" data-toggle="modal"
					data-target="#modalUserBoardDeleteForm">삭제</button>
				<button type="button" class="btn btn-dark"
					onclick="location.href='${pageContext.request.contextPath}/user/userBoard/modify/${userboardvo.uboard_id}?page=${param.page}'">수정</button>
			</c:if>


			<button type="button" class="btn btn-dark"
				onclick="location.href='${pageContext.request.contextPath}/user/userBoard?page=${param.page}'">
				<i class="fa fa-th-list pr-2" aria-hidden="true"></i>목록
			</button>
		</div>

	</div>
</body>

<!-- 게시글 삭제확인 모달 -->
<div class="modal fade" id="modalUserBoardDeleteForm" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">
					정말 <span style="color: red">삭제</span>하시나요?
				</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-footer d-flex justify-content-center">
				<a class="btn btn-danger"
					href="${pageContext.request.contextPath}/user/userBoard/Delete/${userboardvo.uboard_id}">삭제</a>
				<a class="btn btn-dark" data-dismiss="modal">취소</a>
			</div>
		</div>
	</div>
</div>
<!-- 게시글 삭제확인 모달 끝 -->
</html>