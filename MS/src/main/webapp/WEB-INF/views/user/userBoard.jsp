<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MS</title>
<style>
#write {
	float: right;
	margin: 20px;
}
/* 공지사항 게시판 제목 오버 */
.notice-title:hover {
	text-decoration: underline;
}

.table {
	table-layout: fixed;
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
	<div class="container">
		<table class="table">
			<thead>
				<tr class="text-center">
					<th>글번호</th>
					<th style="width: 80%">제목</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test='${userboardlist.userBoardList.isEmpty()}'>
					<tr>
						<td colspan="3"><h3 style="text-align: center;">작성된 게시글이
								없습니다.</h3></td>
					</tr>
				</c:if>
				<c:if test='${!userboardlist.userBoardList.isEmpty()}'>
					<c:forEach var="userBoardVO" items="${userboardlist.userBoardList}">
						<tr>
							<td style="text-align: center;">${userBoardVO.uboard_id}</td>
							<td><a
								href="${pageContext.request.contextPath}/user/userBoard/View/${userBoardVO.uboard_id}">${userBoardVO.uboard_title}</a></td>
							<td style="text-align: center;"><fmt:formatDate
									value="${userBoardVO.uboard_date}" pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>


		<!--Pagination 아레쪽 페이지 이동 -->
		<nav class="d-flex justify-content-center mt-3"
			style="padding-bottom: 20px">
			<ul class="pagination pagination-circle pg-teal mb-0">
				<!--가장맨앞으로-->
				<li class="page-item"><a class="page-link"
					href="userBoard?page=1">First</a></li>

				<!--페이지 한칸뒤로-->
				<c:choose>
					<c:when test="${param.page == 1}">
						<li class="page-item"><a class="page-link"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							aria-label="Previous" href="userBoard?page=${param.page-1}">
								<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
						</a></li>
					</c:otherwise>
				</c:choose>

				<!-- 페이징처리 -->
				<c:forEach var="num" begin="1" end="${userboardlist.pageTotalCount}">
					<c:if test="${param.page == num}">
						<li class="page-item active"><a class="page-link"
							href="userBoard?page=${num}">${num}</a></li>
					</c:if>
					<c:if test="${param.page != num}">
						<li class="page-item"><a class="page-link"
							href="userBoard?page=${num}">${num}</a></li>
					</c:if>
				</c:forEach>

				<!--페이지 한칸앞으로-->
				<c:choose>
					<c:when test="${userboardlist.pageTotalCount == param.page}">
						<li class="page-item"><a class="page-link" aria-label="Next">
								<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" aria-label="Next"
							href="userBoard?page=${param.page+1}"> <span
								aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a></li>
					</c:otherwise>
				</c:choose>

				<!--가장맨앞으로-->
				<li class="page-item"><a class="page-link"
					href="userBoard?page=${userboardlist.pageTotalCount}">Last</a></li>
			</ul>
		</nav>
	</div>

</body>
</html>