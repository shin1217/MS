<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<style>

</style>
<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

	<!-- 메인화면으로 이동 -->
	<c:if test="${isAdmin}">
		<a class="navbar-brand font-weight-bold"
			href="<%=request.getContextPath()%>/member/main?isAdmin=${isAdmin}">PMS</a>
	</c:if>
	<c:if test="${!isAdmin}">
		<a class="navbar-brand font-weight-bold"
			href="<%=request.getContextPath()%>/member/main?isAdmin=${isAdmin}">PMS</a>
	</c:if>

	<!-- Collapse button -->
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#basicExampleNav" aria-controls="basicExampleNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<!-- Collapsible content -->
	<div class="collapse navbar-collapse" id="basicExampleNav">
		<!-- Links -->
		<ul class="navbar-nav mr-auto">
			<c:if test="${isAdmin}">
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/admin/userList"><i
						class="fa fa-users" aria-hidden="true"></i>회원목록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/member/notice?page=1"><i
						class="fa fa-bullhorn " aria-hidden="true"></i>공지사항</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/admin/message"><i
						class="fa fa-envelope-open-o" aria-hidden="true"></i>쪽지함</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/member/logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
			</c:if>
			<c:if test="${!isAdmin}">
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/user/myPage"><i
						class="fa fa-address-card-o" aria-hidden="true"></i>내정보</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/member/notice?page=1"><i
						class="fa fa-bullhorn" aria-hidden="true"></i>공지사항</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/user/message"><i
						class="fa fa-send-o" aria-hidden="true"></i>쪽지전송</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/member/logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
			</c:if>
		</ul>
	</div>
	<!-- Collapsible content -->

</nav>
<!--/.Navbar-->