<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" type="text/css">
<style>
.navbar-nav li {
	margin-left: 20px;
}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="font-family: 'BMHANNAPro' !important;" >
	<c:if test="${!empty adminSession}">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/main"><img src="${pageContext.request.contextPath}/images/ms-logo.png" style="height: 80px; margin-left: 10px;"/></a>
	</c:if>
	<c:if test="${!empty userSession}">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/user/main"><img src="${pageContext.request.contextPath}/images/ms-logo.png" style="height: 80px; margin-left: 10px;"/></a>
	</c:if>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>
	<div class="collapse navbar-collapse" id="navbarNav" style="font-size: 1.8em">
		<ul class="navbar-nav">
  	<c:if test="${!empty adminSession}">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/adminMypage"><i	class="fa fa-address-card-o" aria-hidden="true"></i>내정보</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/notice?page=1"><i class="fa fa-bullhorn" aria-hidden="true"></i>공지사항</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/userList?id=${adminSession.store_id}"><i class="fa fa-users" aria-hidden="true"></i>회원목록</a></li>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 관리하기 </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/salesCalender"><i class="fa fa-pie-chart" aria-hidden="true"></i> 매출기록</a> 
					<a class="dropdown-item" href="#"><i class="fa fa-book" aria-hidden="true"></i> 상품관리</a> 
					<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/seat"><i class="fa fa-eye" aria-hidden="true"></i> 좌석관리</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/user/userBoard?page=1"><i class="fa fa-comments" aria-hidden="true"></i> 유저게시판</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
	</c:if>
	<c:if test="${!empty userSession}">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/userMypage"><i class="fa fa-address-card-o" aria-hidden="true"></i>내정보</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/notice?page=1"><i class="fa fa-bullhorn" aria-hidden="true"></i>공지사항</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/userOrders"><i class="fa fa-cutlery" aria-hidden="true"></i>음식주문</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/userBoard?page=1"><i class="fa fa-comments" aria-hidden="true"></i>유저게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
	</c:if>
		</ul>
	</div>
	<div>
		<select id="storeList" class="custom-select">
			<c:forEach items="${storeSession}" var="store" varStatus="status">
				<option value="${status.index}">${store.store_name}</option>
			</c:forEach>
		</select>
	</div>
</nav>