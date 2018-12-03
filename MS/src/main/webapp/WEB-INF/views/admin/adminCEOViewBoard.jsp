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
<div class="container">	
	<div class="buttonsRight">
			<c:if test="${sessionScope.adminSession.admin_id == CEOBoard_view.writer_cid}">
				<button type="button" class="btn btn-dark" data-toggle="modal"	data-target="#CEOBoardDelete">삭제</button>
				<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/admin/CEOBoard/modify/${CEOBoard_view.cboard_id}'">수정</button>
			</c:if>
			<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/admin/CEOBoard'">목록</button>
	</div>
</div>
<!-- 게시글 삭제확인 모달 -->
<div class="modal fade" id="CEOBoardDelete" tabindex="-1"	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">
					정말 <span style="color: red">삭제</span>하시나요?
				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-footer d-flex justify-content-center">
				<a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/CEOBoardView/delete/${CEOBoard_view.cboard_id}">삭제</a>
				<a class="btn btn-dark" data-dismiss="modal">취소</a>
			</div>
		</div>
	</div>
</div>
<!-- 게시글 삭제확인 모달 끝 -->
</body>
</html>