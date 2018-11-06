<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/* 정기 마이페이지 */
#user_info {
   margin: 30px 20px;
   position : relative;
}
#user_table th {
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
#user_table td {
   width : 600px;
   color: black;
   border-top: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   background-color: #white;
}
#user_table input[type=text]{
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
#myPageTitle{
   margin-top : 30px;
   font-weight : bold;
}
#userBtnTd{
   padding-left : 50px;
}
#editBtn, #deleteBtn {
   border : none;
   background-color : #212121;
   width : 130px;
   height : 50px;
   color : white;
   margin-left : 60px;
   font-size : 20px;
}
#deleteBtn {
	background-color : red;
}
#editBtn:hover {
   background-color : #8e8e8e;
   cursor : pointer;
}
#deleteBtn:hover{
	background-color : palevioletred;
   cursor : pointer;
}

#edit_table{
   width : 500px;
   height : 500px;
   position : absolute;
   top : 150px;
   right : 500px;
}

#edit_table tr, #edit_table td{
}
#edit_table th {
   background-color : #eee;
   color : black;
   padding-left : 20px;
   width : 150px;
   border-top : 2px solid darkgray;
   font-size : 17px;
   font-weight : bold;
}
#editTitle {
   border-top : none !important;
   font-size : 25px !important;
   text-align : center;
   height : 80px;
   position : relative;
   background-color : black !important;
   color : white !important;
   font-weight : bold;
}
#edit_table input[type="text"]{
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
#edit_table td {
   background-color : #eee;
   border : 2px solid darkgray;
}
#editUserId{
	background-color : #eee !important;
}

#editBtnTd{
   text-align : center;
}
#editOkBtn{
   background-color : #212121;
   color : white;
   border : none;
   width : 120px;
   height : 40px;
   font-weight : bold;
   font-size : 18px;
}
#editOkBtn:hover {
   background-color : #8e8e8e;
   cursor : pointer;
}
#mainModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
#close{
   position : absolute;
   right : 10px;
   top : 2px;
   color : darkgray;
}
#close:hover {
   color: white;
   text-decoration: none;
   cursor: pointer;
</style>

</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
   <div class="container">
      <h1 id = "myPageTitle">마이 페이지</h1>
      <hr>
      <div id="user_info">
         <form action="" id = "myForm">
            <table id="user_table">
               <tr id = "userIdTr">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "userId" id = "userId" value = "${user.userId }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "userName" id = "userName" value = "${user.userName }" readonly></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "userPw" id = "userPw" value = "${user.userPw }" readonly></td>
               </tr>
               <tr>
                  <th>핸드폰번호</th>
                  <td><input type = "text" name = "userPhone" id = "userPhone" value = "${user.userPhone }" readonly></td>
               </tr>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "userBirth" id = "userBirth" value = "${user.userBirth }" readonly></td>
               </tr>
               <tr>
                  <th>남은시간</th>
                  <td><input type = "text" name = "userBirth" id = "userBirth" value = "${userVO.userTime }분" readonly></td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td id = "userBtnTd"><input type="button" value='수정' id = "editBtn">
                     <input type="button" id="deleteBtn" value="삭제"></td>
               </tr>
            </table>
         </form>


      </div>
      
   <!-- 수정페이지 누르면 모달창이 뜸 -->
<div id = "mainModal">
   <form action="" id = "editForm">
            <table id="edit_table">
               <tr>
                  <th colspan = "2" id = "editTitle">회 원 수 정<span id = "close">×</span></th>
               </tr>
               <tr id = "">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "userId" id = "editUserId" value = "${user.userId }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "userName" id = "editName" value = "${user.userName }" required></td>
               </tr>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "userPw" id = "editPw" value = "${user.userPw }" required></td>
               </tr>
               <th>핸드폰번호</th>
                  <td><input type = "text" name = "userPhone" id = "editPhone" value = "${user.userPhone }" required></td>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "userBirth" id = "editBirth" value = "${user.userBirth }" ></td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td id = "editBtnTd"><input type="button" id="editOkBtn" value='수정완료' onclick=""></td>
               </tr>
            </table>
         </form>
   </div>
</div>   
</body>
   <script>
      $(document).ready(function(){
         
         $('#mainModal').hide(); // 시작시 모달창을 가림
         
         $('#editBtn').on('click', function(){
         
            $('#mainModal').show(); //수정버튼을 누르면 모달창 띄움
            
         });
         
         //수정페이지에서 수정완료 버튼을 눌렀을때 수정칸이 비워있으면
         //수정이 되지 않음
         $('#editOkBtn').click(function(){
            if($('#editName').val() != "" 
            	&& $('#editPw').val() != ""
            	&& $('#editPhone').val() != ""
            	&& $('#editBirth').val() != ""){
        	 $.ajax({
               url : '${pageContext.request.contextPath}' + '/user/userEdit',
               type : 'post',
               data : $('#editForm').serialize(),
               success : function(data){
                  alert("회원수정을 완료했습니다.");
                  location.href = '<%=request.getContextPath()%>/user/myPage'
               }
            });
            } else{
            	alert("수정할 회원정보를 모두 입력하세요.");
            }
         });
         
         //삭제버튼을 누르면 탈퇴처리되고 로그인페이지로 이동
         $('#deleteBtn').click(function(){
        	 $.ajax({
               url : '${pageContext.request.contextPath}' + '/user/userDelete',
               type : 'post',
               data : $('#myForm').serialize(),
               success : function(data){
                  alert("탈퇴처리 되었습니다.");
                  location.href = '<%=request.getContextPath()%>'
               }
            });
            $('#mainModal').hide();
         });
      
         $(window).on('click', function() {
            //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
            if (event.target == $('#mainModal').get(0)) {
                $('#mainModal').hide();
             }
         });
         
         $('#close').click(function(){
            $('#mainModal').hide();
         
         });
      });
   </script>
</html>