<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.adminMypage_adminInfo {
   margin: 30px 20px;
   position : relative;
}
.adminMypage_adminTable th {
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
.adminMypage_adminTable td {
   width : 600px;
   color: black;
   border-top: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   background-color: #white;
}
.adminMypage_adminTable input[type=text]{
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
.adminMypage_title{
   margin-top : 30px;
   font-weight : bold;
}
.adminMypage_editBtn, .adminMypage_deleteBtn {
   border : none;
   background-color : #212121;
   width : 130px;
   height : 50px;
   color : white;
   margin-left : 70px;
   font-size : 20px;
}
.adminMypage_deleteBtn{
	margin-left : 20px !important;
	background-color : red;
}
.adminMypage_editBtn:hover {
   background-color : #8e8e8e;
   cursor : pointer;
}
.adminMypage_deleteBtn:hover{
	background-color : palevioletred;
   cursor : pointer;
}

.adminMypage_edit_table{
   width : 500px;
   height : 500px;
   position : absolute;
   top : 150px;
   right : 500px;
}

.adminMypage_edit_table th {
   background-color : #eee;
   color : black;
   padding-left : 20px;
   width : 150px;
   border-top : 2px solid darkgray;
   font-size : 17px;
   font-weight : bold;
}
.adminMypage_editTitle {
   border-top : none !important;
   font-size : 30px !important;
   text-align : center;
   height : 80px;
   position : relative;
   background-color : black !important;
   color : white !important;
   font-weight : bold;
}
.adminMypage_edit_table input[type="text"]{
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
.adminMypage_edit_table td {
   background-color : #eee;
   border : 2px solid darkgray;
}
.adminMypage_editUserId{
	background-color : #eee !important;
}

.adminMypage_editBtnTd{
   text-align : center;
}
.adminMypage_editOkBtn{
   background-color : #212121;
   color : white;
   border : none;
   width : 120px;
   height : 40px;
   font-weight : bold;
   font-size : 18px;
}
.adminMypage_editOkBtn:hover {
   background-color : #8e8e8e;
   cursor : pointer;
}
.adminMypage_mainModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
.adminMypage_close{
   position : absolute;
   right : 10px;
   top : 2px;
   color : darkgray;
}
.adminMypage_close:hover {
   color: white;
   text-decoration: none;
   cursor: pointer;
}

.adminMypage_deleteModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
.adminMypage_deleteDiv{
	position : absolute;
	top : 20%;
	left : 35%;
	width : 500px;
	height : 200px;
	background-color : #eee;
	text-align : center;
}
.adminMypage_deleteDiv p{
	margin-top : 30px;
	margin-bottom : 30px;
	font-size : 35px;
	font-weight : bold;
}
.adminMypage_deleteOkBtn, .adminMypage_deleteCancelBtn{
	background-color : red;
	border : none;
	width : 130px;
	height : 50px;
	color : white;
	margin-left : 30px;
	margin-right : 30px;
	font-size : 18px;
}
.adminMypage_deleteCancelBtn{
	background-color : black !important;
}
.adminMypage_deleteOkBtn:hover{
	background-color : palevioletred;
    cursor : pointer;
}
.adminMypage_deleteCancelBtn:hover{
	background-color : #8e8e8e !important;
    cursor : pointer;
}
.adminMypage_management{
	padding-left : 70px;
	position : relative;
}
.adminMypage_addStore{
	position : absolute;
	right : 0px;
	top : 1px;
	font-size : 50px;
	color : black;
	font-weight : bold;
	margin-right : 20px;
}
.adminMypage_storeName{
	width : 100px;
	height : 50px;
	border : none;
	font-size : 16px;
	margin-right : 10px;
	font-weight : bold;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/userHeader.jsp"%>
	
	<div class="container">
      <h1 class = "adminMypage_title">마이 페이지</h1>
      <hr>
      <div class ="adminMypage_adminInfo">
         <form action="" id = "adminMypage_myForm">
            <table class ="adminMypage_adminTable">
               <tr id = "adminMypage_adminIdTr">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "admin_id" id = "adminMypage_id" value = "${admin.admin_id }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "admin_name" id = "adminMypage_name" value = "${admin.admin_name }" readonly></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "admin_pw" id = "adminMypage_pw" value = "${admin.admin_pw }" readonly></td>
               </tr>
               <tr>
                  <th>핸드폰번호</th>
                  <td><input type = "text" name = "admin_phone" id = "adminMypage_phone" value = "${admin.admin_phone }" readonly></td>
               </tr>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "admin_birth" id = "adminMypage_birth" value = "${admin.admin_birth }" readonly></td>
               </tr>
               <tr>
               	  <th>매장정보</th>
               	  <td class = "adminMypage_management">
                  	<c:forEach var = "store" items = "${store}">
                  		<input type = "button" class = "adminMypage_storeName" value = "${store.store_name}">
                  	</c:forEach>
                  	<span id = "adminMypage_addStore" class = "adminMypage_addStore">+</span>
                  </td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td class = "adminMypage_btnTd"><input type="button" value='수정' id = "adminMypage_editBtn" class = "adminMypage_editBtn">
                     <input type="button" id="adminMypage_deleteBtn" value="탈퇴" class = "adminMypage_deleteBtn"></td>
               </tr>
            </table>
         </form>


      </div>
      
   <!-- 삭제 모달창 -->
   		<div id = "adminMypage_deleteModal" class = "adminMypage_deleteModal">
   			<div class = "adminMypage_deleteDiv"><p>정말 탈퇴하시겠습니까?</p>
   				<input type = "button" id = "adminMypage_deleteOkBtn" class = "adminMypage_deleteOkBtn" value = "탈퇴하기">
   				<input type = "button" id = "adminMypage_deleteCancelBtn" class = "adminMypage_deleteCancelBtn" value = "취소하기">
   			</div>
   		</div>
   
   <!-- 수정페이지 누르면 모달창이 뜸 -->
<div id = "adminMypage_mainModal" class = "adminMypage_mainModal">
   <form action="" id = "adminMypage_editForm">
            <table class ="adminMypage_edit_table">
               <tr>
                  <th colspan = "2" class = "adminMypage_editTitle">회 원 수 정<span class = "adminMypage_close" id = "adminMypage_close">×</span></th>
               </tr>
               <tr id = "">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "admin_id" id = "adminMypage_editUserId" value = "${admin.admin_id }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "admin_name" id = "adminMypage_editName" value = "${admin.admin_name }" required></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "admin_pw" id = "adminMypage_editPw" value = "${admin.admin_pw }" required></td>
               </tr>
                  <th>핸드폰번호</th>
                  <td><input type = "text" name = "admin_phone" id = "adminMypage_editPhone" value = "${admin.admin_phone }" required></td>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "admin_birth" id = "adminMypage_editBirth" value = "${admin.admin_birth }" ></td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td class = "adminMypage_editBtnTd"><input type="button" id="adminMypage_editOkBtn" class = "adminMypage_editOkBtn" value='수정완료' onclick=""></td>
               </tr>
            </table>
         </form>
   </div>
</div>  
</body>
<script>
      $(document).ready(function(){
         
         $('#adminMypage_mainModal').hide(); // 시작시 수정모달창을 가림
         $('#adminMypage_deleteModal').hide(); // 시작시 삭제모달창 가림
         
         $('#adminMypage_editBtn').on('click', function(){
         
            $('#adminMypage_mainModal').show(); //수정버튼을 누르면 모달창 띄움
            
         });
         
         //수정페이지에서 수정완료 버튼을 눌렀을때 수정칸이 비워있으면
         //수정이 되지 않음
         $('#adminMypage_editOkBtn').click(function(){
            if($('#adminMypage_editName').val() != "" 
            	&& $('#adminMypage_editPw').val() != ""
            	&& $('#adminMypage_editPhone').val() != ""
            	&& $('#adminMypage_editBirth').val() != ""){
        	 $.ajax({
               url : '${pageContext.request.contextPath}' + '/admin/adminEdit',
               type : 'post',
               data : $('#adminMypage_editForm').serialize(),
               success : function(data){
                  alert("회원수정을 완료했습니다.");
                  location.reload();
               }
            });
            } else{
            	alert("수정할 회원정보를 모두 입력하세요.");
            }
         });
         
         //삭제버튼 클릭시 삭제확인 모달창이 뜸
         $('#adminMypage_deleteBtn').click(function(){
			
        	 $('#adminMypage_deleteModal').show();
        	 
         });
         
         $('#')
         //모달창에서 삭제확인버튼클릭시 로그인페이지로 이동
         $('#adminMypage_deleteOkBtn').click(function(){
        	 $.ajax({
               url : '${pageContext.request.contextPath}' + '/admin/adminDelete',
               type : 'post',
               data : $('#adminMypage_myForm').serialize(),
               success : function(data){
                  alert("탈퇴처리 되었습니다.");
                  location.href = '<%=request.getContextPath()%>'
               }
            });
            $('#adminMypage_mainModal').hide();
         });
         
         //모달창에서 취소버튼 클릭시 다시 마이페이지이동
         $('#adminMypage_deleteCancelBtn').click(function(){
        	 
        	 $('#adminMypage_deleteModal').hide();
         
         });
         
      	//모달창 밖의 영역을 누르면 띄워져 있는 모달창을 닫음
         $(window).on('click', function() {
            //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
            if (event.target == $('#adminMypage_mainModal').get(0)) {
                $('#adminMypage_mainModal').hide();
             }
         });
         $(window).on('click', function() {
            //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
            if (event.target == $('#adminMypage_deleteModal').get(0)) {
                $('#adminMypage_deleteModal').hide();
             }
         });
      	
         
         //닫기버튼을 누르면 수정모달창 닫음
         $('#adminMypage_close').click(function(){
            $('#adminMypage_mainModal').hide();
         
         });
      });
   </script>
</html>