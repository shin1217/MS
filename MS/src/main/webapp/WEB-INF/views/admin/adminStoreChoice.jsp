<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
html, body {
	height: 100%;
}

body {
	margin: 0;
}

.container {
	min-height: 100%;
	position: relative;
}

.full {
	background-image:
		url("<%=request.getContextPath()%>/images/login-back.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
}

.area_inputs {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	width: 30%;
	height: 30%;
}
</style>
</head>
<body>
	<div class="full">
		<div class="container">
			<div class="area_inputs">
				<div class="input-group">	
					<c:if test="${!empty store}">
					<select class="custom-select">
						<option selected>매장을 선택해주세요.</option>
					<c:forEach items="${store}" var="store">
						<option value="${store.store_id}">${store.store_name}</option>
					</c:forEach>
					</select>
					<div class="input-group-append">
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/main">접속하기</a>
					</div>
					</c:if>
				</div>
				<div class="form-group">
					<div>
						<button id="storeBtn" type="submit"	class="btn btn-danger btn-block">+매장등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>

</script>
</html>