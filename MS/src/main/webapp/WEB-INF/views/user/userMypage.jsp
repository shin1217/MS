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
   font-weight : bold;
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
   font-weight : bold;
}
.userMyPage_title{
   margin-top : 30px;
   font-weight : bold;
}
.userMyPage_editBtn, .userMyPage_deleteBtn {
   border : none;
   background-color : #212121;
   width : 130px;
   height : 50px;
   color : white;
   margin-left : 90px;
   font-size : 20px;
   border-radius: 10px;
}
.userMyPage_deleteBtn{
	background-color : red;
}
.userMyPage_editBtn:hover {
   background-color : #8e8e8e;
   cursor : pointer;
}
.userMyPage_deleteBtn:hover{
	background-color : palevioletred;
   cursor : pointer;
}

.userMyPage_edit_table{
   width : 500px;
   height : 500px;
   position : absolute;
   top : 15%;
   right : 30%;
}

.userMyPage_edit_table th {
   background-color : #eee;
   color : black;
   padding-left : 20px;
   width : 150px;
   border-top : 2px solid darkgray;
   font-size : 17px;
   font-weight : bold;
}
.userMyPage_editTitle {
   border-top : none !important;
   font-size : 30px !important;
   text-align : center;
   height : 80px;
   position : relative;
   background-color : black !important;
   color : white !important;
   font-weight : bold;
}
.userMyPage_edit_table input[type="text"]{
   background-color : white;
   border-radius : 5px;
   border : none;
   margin-left : 30px;
   width : 280px;
   height : 40px;
   padding-left : 20px;
   font-size : 18px;
   font-weight : bold;
   
}
.userMyPage_edit_table td {
   background-color : #eee;
   border : 2px solid darkgray;
}
.userMyPage_editUserId{
	background-color : #eee !important;
}

.userMyPage_editBtnTd{
   text-align : center;
}
.userMyPage_editOkBtn{
   background-color : #212121;
   color : white;
   border : none;
   width : 120px;
   height : 40px;
   font-weight : bold;
   font-size : 18px;
}
.userMyPage_editOkBtn:hover {
   background-color : #8e8e8e;
   cursor : pointer;
}
.userMyPage_mainModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
.userMyPage_close{
   position : absolute;
   right : 10px;
   top : 2px;
   color : darkgray;
}
.userMyPage_close:hover {
   color: white;
   text-decoration: none;
   cursor: pointer;
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
	font-weight : bold;
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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<div class="container">
      <h1 class = "userMyPage_title">마이 페이지</h1>
      <hr>
      <div class ="userMyPage_userInfo">
         <form action="" id = "userMyPage_myForm">
            <table class ="userMyPage_userTable">
               <tr id = "userMyPage_userIdTr">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "user_id" id = "userMyPage_id" value = "${user.user_id }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "user_name" id = "userMyPage_name" value = "${user.user_name }" readonly></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "user_pw" id = "userMyPage_pw" value = "${user.user_pw }" readonly></td>
               </tr>
               <tr>
                  <th>핸드폰번호</th>
                  <td><input type = "text" name = "user_phone" id = "userMyPage_phone" value = "${user.user_phone }" readonly></td>
               </tr>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "user_birth" id = "userMyPage_birth" value = "${user.user_birth }" readonly></td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td class = "userMyPage_btnTd"><input type="button" value='수정' id = "userMyPage_editBtn" class = "userMyPage_editBtn">
                     <input type="button" id="userMyPage_deleteBtn" value="탈퇴" class = "userMyPage_deleteBtn"></td>
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
   
   <!-- 수정페이지 누르면 모달창이 뜸 -->
<div id = "userMyPage_mainModal" class = "userMyPage_mainModal">
   <form action="" id = "userMyPage_editForm">
            <table class ="userMyPage_edit_table">
               <tr>
                  <th colspan = "2" class = "userMyPage_editTitle">회 원 수 정<span class = "userMyPage_close" id = "userMyPage_close">×</span></th>
               </tr>
               <tr id = "">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "user_id" id = "userMyPage_editUserId" value = "${user.user_id }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "user_name" id = "userMyPage_editName" value = "${user.user_name }" required></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "user_pw" id = "userMyPage_editPw" value = "${user.user_pw }" required></td>
               </tr>
                  <th>핸드폰번호</th>
                  <td><input type = "text" name = "user_phone" id = "userMyPage_editPhone" value = "${user.user_phone }" required></td>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "user_birth" id = "userMyPage_editBirth" value = "${user.user_birth }" ></td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td class = "userMyPage_editBtnTd"><input type="button" id="userMyPage_editOkBtn" class = "userMyPage_editOkBtn" value='수정완료' onclick=""></td>
               </tr>
            </table>
         </form>
   </div>
</div>  
</body>
<script>
      $(document).ready(function(){
         
         $('#userMyPage_mainModal').hide(); // 시작시 수정모달창을 가림
         $('#userMyPage_deleteModal').hide(); // 시작시 삭제모달창 가림
         
         $('#userMyPage_editBtn').on('click', function(){
         
            $('#userMyPage_mainModal').show(); //수정버튼을 누르면 모달창 띄움
            
         });
         
         //수정페이지에서 수정완료 버튼을 눌렀을때 수정칸이 비워있으면
         //수정이 되지 않음
         $('#userMyPage_editOkBtn').click(function(){
            if($('#userMyPage_editName').val() != "" 
            	&& $('#userMyPage_editPw').val() != ""
            	&& $('#userMyPage_editPhone').val() != ""
            	&& $('#userMyPage_editBirth').val() != ""){
        	 $.ajax({
               url : '${pageContext.request.contextPath}' + '/user/userEdit',
               type : 'post',
               data : $('#userMyPage_editForm').serialize(),
               success : function(data){
                  alert("회원수정을 완료했습니다.");
                  location.href = '<%=request.getContextPath()%>/user/userMypage'
               }
            });
            } else{
            	alert("수정할 회원정보를 모두 입력하세요.");
            }
         });
         
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
      });
   </script>
</html>