<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.photoUl{
		list-style: none;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container"><br>
		<div class = "photoHeader" style = "position : relative">
		<b style = "font-size : 30px; margin-top : 10px;">[${storeSelectSession.store_name}] - Photo게시판</b>
		<hr>
		 <a id="write" class="btn btn-outline-elegant waves-effect"
			href="${pageContext.request.contextPath}/member/photoBoard/write" style = "right : 0px; top : 0px;position : absolute;">글쓰기</a></div>
		<c:if test="${!empty photoData.photoBoardList}">
			<c:forEach items = "${photoData.photoBoardList}" var = "photoData">
			<div><a href = "${pageContext.request.contextPath}/member/photoView/${photoData.photo_id}">
				<ul class = "photoUl" style = "float : left; margin : 0px Auto 10px;">
					<li><img src = "${pageContext.request.contextPath}/images/photoboard/${photoData.photo_file}" style = "width : 250px; height : 250px;"></li>
					<li>Title : ${photoData.photo_title}</li>
					<li>작성시간 : <fmt:parseDate value="${photoData.photo_date}" pattern="yyyy-MM-dd HH:mm" var = "date" />
						  <fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" /></li>
					<li>작성자 : ${photoData.photo_upid}</li>
				</ul>
			</a></div>
			</c:forEach>
		</c:if>
		<c:if test="${empty photoData.photoBoardList}">
			<h1>등록된 사진이 없습니다.</h1>
		</c:if>
	</div>	<br>
	<div style = "text-align : center;">	
		<c:if test="${!empty photoData}">
			<nav class="d-flex justify-content-center mt-3"	style="padding-bottom: 20px; clear : both;">
				<ul class="pagination pagination-circle pg-teal mb-0">

					<!--가장맨앞으로-->
					<li class="page-item"><a class="page-link" href="photoBoard?page=1">First</a></li>
					
					<c:forEach var = "num" begin = "1" end = "${photoData.pageTotalCount}">
						<c:if test="${param.page == num}">
							<li class="page-item active"><a class="page-link" href="photoBoard?page=${num}">${num}</a></li>
						</c:if>
						<c:if test="${param.page != num}">
							<li class="page-item"><a class="page-link" href="photoBoard?page=${num}">${num}</a></li>
						</c:if>
					</c:forEach>
					
					<!-- 가장 맨 뒤로 -->
					<li class="page-item"><a class="page-link" href="photoBoard?page=${photoData.pageTotalCount}">End</a></li>
				</ul>
			</nav>
		</c:if>	
	</div>
</body>
</html>