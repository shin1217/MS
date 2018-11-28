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
.userBoard_searchbar {
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
	아ㅓ아아
</body>
</html>