<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="overflow: hidden; position: relative;">
		<br> <a class="nav-link, hypertext_none"
			href="${pageContext.request.contextPath}/member/photoBoard?page=1">
			<b style="font-size: 30px;">[${storeSelectSession.store_name}] -
				Photo게시판</b>
		</a>
	</div>
	<div class="container">
		<form class="text-center p-5" method="post" enctype = "multipart/form-data">
			<input type = "hidden" name = "store_id" value = "${storeSelectSession.store_id}">
			<input type="text" class="form-control" placeholder="제목"
				name="photo_title" value = "${viewData.photo_title}" required>
			<!-- name값과 메서드의 매개변수가 이름이 같으면 알아서 넣어줌 -->
			<textarea class="form-control" rows="20" placeholder="내용"
				name="photo_con" value = "${viewData.photo_con}" required></textarea>
			<input type = "file" name = "photoFile" style = "float : left;">
			<button class="btn btn-info btn-block">작성하기</button>
		</form>
	</div>
</body>
</html>