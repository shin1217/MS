<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<div><a href = "${pageContext.request.contextPath}/member/photoView/${photoData.photo_id}">
				<ul>
					<li><img src = "${pageContext.request.contextPath}/images/photoboard/${photoData.photo_file}" style = "width : 200px;"></li>
					<li>${photoData.photo_title}</li>
					<li><fmt:parseDate value="${photoData.photo_date}" pattern="yyyy-MM-dd HH:mm" var = "date" />
						  <fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" /></li>
					<li>${photoData.photo_upid}</li>
				</ul>
			</a></div>
			</c:forEach>
		</c:if>
		<c:if test="${empty photoData.photoBoardList}">
			<h1>등록된 사진이 없습니다.</h1>
		</c:if>
	</div>
</body>
</html>