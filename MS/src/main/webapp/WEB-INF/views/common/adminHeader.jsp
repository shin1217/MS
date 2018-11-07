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

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/main">MS :p</a>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/amdin/adminMypage">내정보</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/notice?page=1">공지사항</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/userList">회원리스트</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> 관리하기 </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="#">매출기록</a> 
					<a class="dropdown-item" href="#">상품관리</a> 
					<a class="dropdown-item" href="#">좌석관리</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/user/userBoard">유저게시판</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin">로그아웃</a></li>
		</ul>
	</div>
</nav>