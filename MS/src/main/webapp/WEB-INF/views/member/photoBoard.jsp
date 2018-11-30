<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container">
		<h1>[${storeSelectSession.store_name}] - Photo게시판</h1>
		<hr>
		 <a id="write" class="btn btn-outline-elegant waves-effect"
			href="${pageContext.request.contextPath}/member/photoBoard/write">글쓰기</a>
		<c:if test="${!empty photoData.photoBoardList}">
			<c:forEach items = "${photoData.photoBoardList}" var = "photoData">
			<div>
				<ul>
					<li><img src = "${pageContext.request.contextPath}/images/photoboard/${photoData.photo_file}"></li>
					<li>${photoData.photo_title}</li>
					<li>${photoData.photo_date}</li>
					<li>${photoData.photo_upid}</li>
				</ul>
			</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty photoData.photoBoardList}">
			<h1>등록된 사진이 없습니다.</h1>
		</c:if>
	</div>
</body>
</html>