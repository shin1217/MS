<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="styleSheet" href="../css/css_searchForm.css">

<style>
.btn {
	color: white;
	background-color: green;
}

.mainModal {
	display: none;
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
	position: fixed;
}

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 15px;
	border: 1px solid #888;
	width: 60%;
	text-align: center;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	font-size: 28px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.strong{
color: red
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<h2 style="text-align: center">Id or Password Search</h2>
			<div class="vl">
				<span class="vl-innertext">or</span>
			</div>

			<div class="col">
				<form id="idSeachForm" method="post">
					<input type="hidden" name="search" value="id" /> <input
						id="idSeachForm_in_phone" type="text" name="userPhone"
						placeholder="UserPhone" required> <input
						id="idSeachForm_in_name" type="text" name="userName"
						placeholder="UserName" required> <input id="searchid"
						type="button" class="btn" value="Search Id">
				</form>
			</div>

			<div class="col">
				<div class="hide-md-lg">
					<p>Or sign in manually:</p>
				</div>
				<form id="pwSearchForm" method="post">
					<input type="hidden" name="search" value="pw" /> <input
						id="pwSeachForm_in_id" type="text" name="userId" placeholder="Id"
						required> <input id="pwSeachForm_in_name" type="text"
						name="userName" placeholder="UserName" required> <input
						id="searchpw" type="button" class="btn" value="Search Password">
				</form>
			</div>

			<div class="cancle">
				<button type="button" class="cancelbtn"
					onclick="location.href='../'">Cancel</button>
			</div>
		</div>
	</div>

	<div id="showModal" class="mainModal">
		<span class="close">&times;</span>
		<div id="window_search" class="modal-content">정보를 찾고 있습니다.......</div>
	</div>

	<script>
		
		//searchId 클릭 시		
		$("#searchid").on('click', function() {
								
				$.ajax({
				//url주소 조심하세요 자동정렬할때
				url: '<%=request.getContextPath()%>/member/search',
				type : 'post',
				data : $('#idSeachForm').serialize(),

				success : function(data) {
					console.log(data);	
					
					//정보 오류시
					if((data.userId) == ""){
						$('#window_search').html("<h3 class='strong'>회원님의 정보를 확인해주세요.</h3>");
					} else {
						$('#window_search').html("회원님의 아이디는 <h3 class='strong'>" + data.userId + "</h3> 입니다.");
					}
					
				} /* end success */
			}); /* end ajax */
		$('#showModal').show();
		});
		
		//엔터키 처리
		$('#idSeachForm_in_phone, #idSeachForm_in_name').keydown(function(key) {
			if (key.keyCode == 13){ 
				$('#searchid').trigger('click');}
		});
		
		// ID값이 searchpw인 input type="button"에 script를 이용한 클릭 기능 구현  
		$('#searchpw').on('click', function(){
			
				$.ajax({
				// 자동정렬하면 url 주소 깨짐
				url: '<%=request.getContextPath()%>/member/search',
						type : 'post',
						data : $('#pwSearchForm').serialize(),

						success : function(data) {
							// 콘솔로 데이터가 잘 들어왔는지 확인
							console.log(data);

							//정보 오류시
							if ((data.userPw) == "") {
								$('#window_search').html("<h3 class='strong'>회원님의 정보를 확인해주세요.</h3>");
							} else {
								$('#window_search').html("회원님의 비밀번호는 <h3 class='strong'>" + data.userPw + "</h3> 입니다.");
							}

						}/* end success */
					}); /* end ajax */
					$('#showModal').show();
				}); /* end button function */

		//엔터키 처리
		$('#pwSeachForm_in_name, #pwSeachForm_in_id').keydown(function(key) {
			if (key.keyCode == 13) {
				$('#searchpw').trigger('click');
			}
		});

		// 경원 공부
		// data: 에는 form 안에 id 값을 넣어주면 된다.
		// JSON(JavaScript Object Notation)이란 클라이언트 브라우저 및
		// AJAX 사용 웹 서비스 간에 소량의 데이터를 신속하게 교환할 수 있는
		// 효율적인 데이터 인코딩 형식이다.
		// serialize()는 입력된 모든 Element를 문자열의 데이터에 serialize 한다. 
		// form 안에 각 요소를 param 값으로 저장 시키지 않고 한번에 담아줌

		// 로드 시 최초 1회만 실행


		// 아이디,비밀번호 modal 창 닫기 버튼 클릭
		$('.close').on('click', function() {
			$('#showModal').hide();

		});

		// modal 창 외 윈도우 클릭
		$(window).on('click', function() {
			//jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
			if (event.target == $('#showModal').get(0)) {
				$('#showModal').hide();
			}
		});

	</script>


</body>
</html>
