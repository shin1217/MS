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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/userHeader.jsp"%>
	<h1 class=>유저게시판</h1>
	<div class="container">
		<a id="write" class="btn btn-outline-elegant waves-effect"
			href="${pageContext.request.contextPath}/user/userBoardWrite">글쓰기</a>
		<table class="table">
			<thead>
				<tr class="text-center">
					<th style="width: 85%">제목</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test='${userboardlist.userBoardList.isEmpty()}'>
					<tr>
						<td colspan="2"><h3 style="text-align: center;">작성된 게시글이
								없습니다.</h3></td>
					</tr>
				</c:if>
				<c:if test='${!userboardlist.userBoardList.isEmpty()}'>
					<c:forEach var="userBoardVO" items="${userboardlist.userBoardList}">
						<tr>
							<td>${userBoardVO.uboard_title}</td>
							<td style="text-align: center;"><fmt:formatDate
									value="${userBoardVO.uboard_date}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:if>


			</tbody>
		</table>

	</div>

</body>
</html>