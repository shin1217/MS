<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
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

.container * {
	font-size: 17px;
}

.hypertext_none {
	color: #181818;
	text-decoration: none;
}

/* 검색창 */
.CEOBoard_searchbar {
	position: absolute;
	bottom: 0px;
	width: 400px;
}

input { /* This styles the actual input box */
	font-size: 20px;
	padding: 10px;
	width: 100%;
}

label { /* This styles the label before interaction */
	font-size: 20px;
	font-weight: normal;
	position: absolute;
	left: 20px;
	top: 20px;
	pointer-events: none;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

input:focus ~ label, input:valid ~ label, form:focus ~ label {
	/* This styles the label after interaction */
	top: -20px;
	font-size: 14px;
}

/* 검색창 */
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="overflow: hidden; position: relative;">
		<br> <a class="nav-link, hypertext_none" href="#">
			<b style="font-size: 30px;">CEO게시판</b>
		</a><br><br> <a id="write" class="btn btn-outline-elegant waves-effect" href="#">글쓰기</a>

		<div class="CEOBoard_searchbar">
			<form method="get">
				<table>
					<tr>
						<td ><input name="page" type="hidden" value="1" />
						<input name="keyword" type="text" value="" required><label>검색(제목+내용) + ENTER!!</label></td>
						<td><input type="submit" value="검색" class="btn btn-outline-elegant waves-effect" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<div class="container">
		<table class="table">
			<thead>
				<tr class="text-center" style="background: #E6E6F2;">
					<th style="width: 10%">글번호</th>
					<th style="width: 55%">제목</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 15%">작성시간</th>
				</tr>
			</thead>
			<%-- <tbody>
				<c:forEach var="userBoardVO" items="${userboardnotice}">
					<tr style="background: #F2FCF6;">
						<td style="text-align: center;">[공지]</td>
						<td><a href="${pageContext.request.contextPath}/user/userBoard/view/${userBoardVO.uboard_id}?page=${pageNum}&keyword=${param.keyword}">${userBoardVO.uboard_title}</a></td>
						<td style="text-align: center;">${userBoardVO.writer_id}[관리자]</td>
						<td style="text-align: center;"><fmt:formatDate	value="${userBoardVO.uboard_date}" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
				</c:forEach>
				<c:if test='${userboardlist.userBoardList.isEmpty()}'>
					<tr>
						<td colspan="4"><h3 style="text-align: center;">작성된 게시글이 없습니다.</h3></td>
					</tr>
				</c:if>
				<c:if test='${!userboardlist.userBoardList.isEmpty()}'>
					<c:forEach var="userBoardVO" items="${userboardlist.userBoardList}">
						<tr>
							<td style="text-align: center;">${userBoardVO.uboard_id}</td>
							<td><a href="${pageContext.request.contextPath}/user/userBoard/view/${userBoardVO.uboard_id}?page=${pageNum}&keyword=${param.keyword}">${userBoardVO.uboard_title}</a></td>
							<td style="text-align: center;">${userBoardVO.writer_id}<c:if test='${storeSelectSession.admin_id == userBoardVO.writer_id}'>[관리자] </c:if></td>
							<td style="text-align: center;"><fmt:formatDate
									value="${userBoardVO.uboard_date}" pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody> --%>
		</table>
	</div>
	
</body>
</html>