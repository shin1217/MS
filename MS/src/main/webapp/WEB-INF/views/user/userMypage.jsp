<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MS</title>
<style>
.userMyPage_userInfo {
   margin: 30px 20px;
   position : relative;
}
.userMyPage_userTable th {
   color: black;
   width : 240px;
   height : 80px;
   font-size : 25px;
   padding : 10px 40px;
   border-top : 2px solid darkgray;
   border-bottom : 2px solid darkgray;
   border-right : 2px solid darkgray;
}
.userMyPage_userTable td {
   width : 600px;
   color: black;
   border-top: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   background-color: #white;
}
.userMyPage_userTable input[type=text]{
   width : 400px;
   height : 50px;
   margin-left : 70px;
   border-radius : 7px;
   border : 1px solid ivory;
   background-color : #eee;
   padding-left : 20px;
   font-size : 20px;
}
.userMyPage_title{
   margin-top : 30px;
}
.userMyPage_deleteBtn {
   border : none;
   background-color : #212121;
   width : 130px;
   height : 50px;
   color : white;
   margin-left : 190px;
   font-size : 20px;
   border-radius: 10px;
   background-color : red;
}
.userMyPage_deleteBtn:hover{
   background-color : palevioletred;
   cursor : pointer;
}
.userMyPage_deleteModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
.userMyPage_deleteDiv{
	position : absolute;
	top : 20%;
	left : 35%;
	width : 500px;
	height : 200px;
	background-color : #eee;
	text-align : center;
	border-radius: 10px;
}
.userMyPage_deleteDiv p{
	margin-top : 30px;
	margin-bottom : 30px;
	font-size : 35px;
}
.userMyPage_deleteOkBtn, .userMyPage_deleteCancelBtn{
	background-color : red;
	border : none;
	width : 130px;
	height : 50px;
	color : white;
	margin-left : 30px;
	margin-right : 30px;
	font-size : 18px;
	border-radius: 10px;
}
.userMyPage_deleteCancelBtn{
	background-color : black !important;
}
.userMyPage_deleteOkBtn:hover{
	background-color : palevioletred;
    cursor : pointer;
}
.userMyPage_deleteCancelBtn:hover{
	background-color : #8e8e8e !important;
    cursor : pointer;
}
.edit:hover {
	color : red;
	cursor : pointer;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<div class="container">
      <h1 class = "userMyPage_title">마이 페이지</h1>
      <hr>
      <div class ="userMyPage_userInfo">
         <form action="" id = "userMyPage_myForm">
         <div name = "store_id" value = "${user.store_id}" style = "display : none;"></div>
            <table class ="userMyPage_userTable">
               <tr id = "userMyPage_userIdTr">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "user_id" id = "userMyPage_id" value = "${user.user_id }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "user_name" id = "userMyPage_name" value = "${user.user_name }" readonly>
                  <p id = "edit_name" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick = "edit('name')">수정하기</p></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "user_pw" id = "userMyPage_pw" value = "${user.user_pw }" readonly>
                  <p id = "edit_pw" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('pw')">수정하기</p></td>
               </tr>
               <tr>
                  <th>핸드폰번호</th>
                  <td><input type = "text" name = "user_phone" id = "userMyPage_phone" value = "${user.user_phone }" readonly>
                  <p id = "edit_phone" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('phone')">수정하기</p></td>
               </tr>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "user_birth" id = "userMyPage_birth" value = "${user.user_birth }" readonly>
                  <p id = "edit_birth" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('birth')">수정하기</p></td>
               </tr>
               <tr>
                  <th>회원이메일</th>
                  <td><input type = "text" name = "user_email" id = "userMyPage_email" value = "${user.user_email }" readonly>
                  <p id = "edit_email" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('email')">수정하기</p></td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td class = "userMyPage_btnTd"><input type="button" id="userMyPage_deleteBtn" value="탈퇴" class = "userMyPage_deleteBtn"></td>
               </tr>
            </table>
         </form>


      </div>
      
   <!-- 삭제 모달창 -->
   		<div id = "userMyPage_deleteModal" class = "userMyPage_deleteModal">
   			<div class = "userMyPage_deleteDiv"><p>정말 탈퇴하시겠습니까?</p>
   				<input type = "button" id = "userMyPage_deleteOkBtn" class = "userMyPage_deleteOkBtn" value = "탈퇴하기">
   				<input type = "button" id = "userMyPage_deleteCancelBtn" class = "userMyPage_deleteCancelBtn" value = "취소하기">
   			</div>
   		</div>
   		
</div>  
</body>
<script>
      $(document).ready(function(){
         
         $('#userMyPage_mainModal').hide(); // 시작시 수정모달창을 가림
         $('#userMyPage_deleteModal').hide(); // 시작시 삭제모달창 가림
      });
      
      var user_id = ${userSession.user_id};   
      
      /* $('#edit_name').click(function(){
    	  $('#userMyPage_name').focus();
    	  $('#userMyPage_name').css("border","1px solid red").attr("readonly", false);
    	  $('#edit_name').text("수정완료").attr("id", "edit_nameOk");
    	  	$('#edit_nameOk').click(function(){
    	  		$.ajax({
    	  			url : '${pageContext.request.contextPath}' + '/user/userEditName',
    	  			data : {
    	  				user_name : $('#userMyPage_name').val(),
    	  				user_id : user_id
    	  			},
    	  			success : function(data){
    	  				alert("수정을 완료했습니다.");
    	  				$('#edit_nameOk').text("수정하기").attr("id", "edit_name");
    	  				$('#userMyPage_name').css("border","none").attr("readonly", true);
    	  			}
    	  		});
    	  	});
      }); */
      
	///////////// 수정버튼을 눌렀을 경우 //////////////
      function edit(e){
    	  console.log(e);
    	  $('#userMyPage_' + e + '').focus();
    	  $('#userMyPage_' + e + '').css("border","1px solid red").attr("readonly", false);
    	  $('#edit_' + e + '').text("수정완료").attr("id", "edit_" + e + "Ok");
   	  	$('#edit_' + e + 'Ok').click(function(){
   	  		$.ajax({
   	  			url : '${pageContext.request.contextPath}' + '/user/userEdit' + e + '',
				type : 'post',
				data : $('#userMyPage_myForm').serialize(),
      			success : function(data){
      				location.reload();
      			}
      		});
      	});
      } 
      /* $('#edit_pw').click(function(){
    	  $('#userMyPage_pw').focus();
    	  $('#userMyPage_pw').css("border","1px solid red").attr("readonly", false);
    	  $('#edit_pw').text("수정완료").attr("id", "edit_pwOk");
    	  	$('#edit_pwOk').click(function(){
    	  		$.ajax({
    	  			url : '${pageContext.request.contextPath}' + '/user/userEditPw',
    	  			data : {
    	  				user_pw : $('#userMyPage_pw').val(),
    	  				user_id : user_id
    	  			},
    	  			success : function(data){
    	  				alert("수정을 완료했습니다.");
    	  				$('#edit_pwOk').text("수정하기").attr("id", "edit_pw");
    	  				$('#userMyPage_pw').css("border","none").attr("readonly", true);
    	  			}
    	  		});
    	  	});
      });
      $('#edit_phone').click(function(){
    	  $('#userMyPage_phone').focus();
    	  $('#userMyPage_phone').css("border","1px solid red").attr("readonly", false);
    	  $('#edit_phone').text("수정완료").attr("id", "edit_phoneOk");
    	  	$('#edit_phoneOk').click(function(){
    	  		$.ajax({
    	  			url : '${pageContext.request.contextPath}' + '/user/userEditPhone',
    	  			data : {
    	  				user_phone : $('#userMyPage_phone').val(),
    	  				user_id : user_id
    	  			},
    	  			success : function(data){
    	  				alert("수정을 완료했습니다.");
    	  				$('#edit_phoneOk').text("수정하기").attr("id", "edit_phone");
    	  				$('#userMyPage_phone').css("border","none").attr("readonly", true);
    	  			}
    	  		});
    	  	});
      });
      $('#edit_pw').click(function(){
    	  $('#userMyPage_pw').focus();
    	  $('#userMyPage_pw').css("border","1px solid red").attr("readonly", false);
    	  $('#edit_pw').text("수정완료").attr("id", "edit_pwOk");
    	  	$('#edit_pwOk').click(function(){
    	  		$.ajax({
    	  			url : '${pageContext.request.contextPath}' + '/user/userEditPw',
    	  			data : {
    	  				user_pw : $('#userMyPage_pw').val(),
    	  				user_id : user_id
    	  			},
    	  			success : function(data){
    	  				alert("수정을 완료했습니다.");
    	  				$('#edit_pwOk').text("수정하기").attr("id", "edit_pw");
    	  				$('#userMyPage_pw').css("border","none").attr("readonly", true);
    	  			}
    	  		});
    	  	});
      }); */
      
      
         //삭제버튼 클릭시 삭제확인 모달창이 뜸
         $('#userMyPage_deleteBtn').click(function(){
			
        	 $('#userMyPage_deleteModal').show();
        	 
         });
         
         
         //모달창에서 삭제확인버튼클릭시 로그인페이지로 이동
         $('#userMyPage_deleteOkBtn').click(function(){
        	 $.ajax({
               url : '${pageContext.request.contextPath}' + '/user/userDelete',
               type : 'post',
               data : $('#userMyPage_myForm').serialize(),
               success : function(data){
                  alert("탈퇴처리 되었습니다.");
                  location.href = '<%=request.getContextPath()%>'
               }
            });
            $('#userMyPage_mainModal').hide();
         });
         
         //모달창에서 취소버튼 클릭시 다시 마이페이지이동
         $('#userMyPage_deleteCancelBtn').click(function(){
        	 
        	 $('#userMyPage_deleteModal').hide();
         
         });
         
      	//모달창 밖의 영역을 누르면 띄워져 있는 모달창을 닫음
         $(window).on('click', function() {
            //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
            if (event.target == $('#userMyPage_mainModal').get(0)) {
                $('#userMyPage_mainModal').hide();
             }
         });
         $(window).on('click', function() {
            //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
            if (event.target == $('#userMyPage_deleteModal').get(0)) {
                $('#userMyPage_deleteModal').hide();
             }
         });
      	
         
         //닫기버튼을 누르면 수정모달창 닫음
         $('#userMyPage_close').click(function(){
            $('#userMyPage_mainModal').hide();
         
         });
   </script>
</html>