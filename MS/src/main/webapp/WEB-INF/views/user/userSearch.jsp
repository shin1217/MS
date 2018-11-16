<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>

<style>
*{
	font-size: 20px;
	font-family: 'BMHANNAPro';
}

input{
	font-family: sans-serif;
}

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

.sub_title {
	padding-bottom: 2px;
	margin-bottom: 15px;
	font-size: 23px;
	border-bottom: 1px solid #cecece;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/modal/userIdSearchModal.jsp" %>
	<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3>아이디/비밀번호 찾기</h3>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_1" name="inputEmail_1" placeholder="ex) 갓민수">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="inputPhone_1" name="inputPhone_1" placeholder="ex) 010-7777-9999">
						</div>
					</div>
					<%-- <div class="form-group">
						<c:if test="${!empty search_store }">
							<select name="store_id" required>
								<option disabled selected>매장을 선택해주세요</option>
								<c:forEach var="search_store" items="${search_store }">
									<option id="store_id" value="${search_store.store_id }">${search_store.store_name }</option>
								</c:forEach>
							</select>
						<</c:if>
					</div> --%>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputId_2">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId_2"
								name="inputId_2" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<%-- <div class="form-group">
						<c:if test="${!empty search_store }">
							<select name="store_id" required>
								<option disabled selected>매장을 선택해주세요</option>
								<c:forEach var="search_store" items="${search_store }">
									<option id="store_id" value="${search_store.store_id }">${search_store.store_name }</option>
								</c:forEach>
							</select>
						</c:if>
					</div> --%>
					<div class="form-group">
						<button id="searchBtn" type="button" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
			
			
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
			
			
		}
	}

	$(document).ready(function() {
		/////////모///달///기///능///////////
		// 1. 모달창 히든 불러오기
		$('#searchBtn').click(function() {
			console.log("modal1");
			$('#background_modal').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			console.log("modal2");
			$('#background_modal').hide();
		});
		// 3. 모달창 위도우 클릭 시 닫기
		$(window).on('click', function() {
			console.log("modal3");
			if (event.target == $('#background_modal').get(0)) {
	            $('#background_modal').hide();
	         }
		});
	});

	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		console.log($('#inputEmail_1').val());
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/userSearch?inputName_1="+$('#inputName_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
			
			success:function(data){
				console.log(data);
				
				if(data == 0){
					$('#id_value').text("다시 확인해주세요");
					
				} else {
					$('#id_value').text(data);
				}
			}
		});
	}
	
	/* // 바꾸는 기능
	function find_PWcheck(){
		document.getElementById("findPop find form").style.display="";
		document.getElementById("findPop IDfind").style.display="none";
		document.getElementById("findPop PWfind").style.display="";
		document.getElementById("findPop IDok").style.display="none";
		$("#radioFindPW").attr("checked", true);
		$("#mbName").val("");
		$("#mbIDPhone1").val("");
		$("#mbIDPhone2").val("");
		$("#mbIDPhone3").val("");
	} */
</script>
</html>