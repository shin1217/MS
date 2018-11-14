<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.container{
	overflow: hidden;
}
.messageModal, .writeMessageModal{
	position : fixed;
	width : 100%;
	height : 100%;
	left : 0px;
    top : 0px;
    z-index : 1;
    background-color : rgba(0, 0, 0, 0.4);
    display : none;
}
.messageWrap, .messageWriteWrap{
	position : absolute;
	top : 10%;
	left : 50%;
	width : 700px;
	background-color : white;
	text-align : center;
	border-radius: 10px;
	margin-left : -350px;
}
.messageListTitle{
	margin-top : 30px;
}
#writeMessage{
	position : absolute;
	right : 20px;
	top : 30px;
	border : none;
	font-weight : bold;
	font-size : 15px;
}
.post {
	padding: 0 1.5%;
}
.comment-form .form-control {
	border: 0px;
	background: #eee;
	min-height: 50px;
}
.comment-form>.row {
	margin: 0 -1.5%;
}
.comment-form [class*="col-"] {
	padding: 0 1.5%
}
.form-group {
	margin-bottom: 40px !important;
}
.messageTitle {
	margin-top: 20%;
	font-size : 35px;
	font-weight : bold;
}
hr{
	margin-bottom : 50px !important;
}
#userId {
	background-color : darkgray;
	font-weight : bold;
	font-size : 20px;
}
@media ( min-width :992px) {
	.post {
		width: 50%;
		max-width: 500px;
		margin: 0 auto;
		background-color : white;
		border-radius : 10px;
		height : 710px;
	}
	.comment-form label {
		position: absolute;
		width: 200px;
	}
	.comment-form .name, .comment-form .email, .comment-form .message {
		top: -27px;
		font-weight: bold;
	}
}
@media ( min-width :1200px) {
	.post {
		max-width: 525px;
	}
}
#submit {
	font-size : 15px;
}
.messageTitle p {
	text-align : center;
	padding-top : 20px;
}
.receiveWrap{
	width : 100%;
}
.messageUl{
	background-color: #eee;
	padding: 15px 10px;
	text-align: center;
	width: 250px;
	height: 250px;
	border-right : 3px solid #8e8e8e;
	border-bottom : 3px solid #8e8e8e;
	margin-left: 65px;
	list-style: none;
	margin-bottom: 30px;
	border-radius: 10px;
	position : relative;
}
.messageUlWrap{
	float: left;
}
.messageUl textarea {
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 2px;
	height: 120px;
	border-radius: 5px;
}
.messageReply, .messageDetail{
	margin: 0px 6px;
	font-size: 15px;
	color: white;
	background-color: black;
	text-decoration: none;
	padding: 4px;
	border-radius: 5px;
	width : 70px;
}
.deleteMessage{
	position : absolute;
	right : 10px;
	top : 10px;
}
.deleteMessage:hover {
	cursor : pointer;
}
.storeList{
	position : absolute;
	left : 25px;
	top : 100px;
	height : 30px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>관리자 메인페이지입니다.</h1>
	
		<input type = "button" id = "messageBtn" class = "messageBtn" value = "쪽지함">

<!-- ///////////메시지 모달창/////////// -->
		<div class = "messageModal" id = "messageModal">
			<div class="messageWrap">
				<h1 class="messageListTitle">메시지 리스트</h1>
				<div id = "adminStoreList" class = "adminStoreList"></div>
				<input type = "button" class = "btn btn-outline-elegant waves-effect" id = "writeMessage" value = "쪽지쓰기">
				<hr>
				<div id = "messageList"></div>
			</div>
		</div>
	
<!--///////////////// 쪽지쓰기 모달창/////////////////// -->
		<div class = "writeMessageModal" id = "writeMessageModal">
		<div class="post">
			<div class="contact">
				<div class="messageTitle">
					<p>메시지 남기기</p>
				</div>
				<hr>
				<form class="comment-form">
					<div class="row">
						<div class="col-md-12 form-group">
							<label class="name">보내는 사람</label> <input type="text"
								class="form-control" name="send_id"
								value = "관리자" id = "send_id" style = "background-color : darkgrey;" readonly/>
						</div>
						<div class="col-md-12 form-group">
							<label class="name">받는 사람</label>
							<div class = "receiveWrap">
							<input type = "text" id = "receiveReply" class = "form-control" style = "display : none; background-color : darkgrey;" readonly >
							<div id = "sendWrap" style = "width : 40%; float : left;"></div>
							<div id = "selectStore" style = "width : 55%; float : right;"></div>
							</div>
						</div>
						<div class="col-md-12 form-group">
							<label class="email">메시지 제목</label> <input type="text"
								class="form-control" placeholder="message Title"
								name="message_title" id = "message_title" required />
						</div>
						<div class="clearfix"></div>
						<div class="col-md-12 form-group">
							<label class="message">메시지 내용</label>
							<textarea class="form-control" cols="47" rows="7"
								placeholder="Message" name="message_con" id = "message_con" required></textarea>
						</div>
						<div class="col-md-12 form-group">
							<input type="button" class="btn btn-block btn-lg btn-success"
								value="메시지 남기기" id = "sendBtn">
							<input type="button" class="btn btn-block btn-lg btn-success"
								value="메시지 남기기" id = "replyBtn" style = "display : none;">
						</div>
					</div>
				</form>
			</div>
		</div>
		</div>
   	</div>
</body>
<script>
	var send_id = "";
	$(document).ready(function(){
		$('#messageModal').hide(); //페이지 시작시 메세지 모달창 가림
		$('#writeMessageModal').hide(); // 페이지 시작시 쪽지쓰기 모달창 가림
		$('#sendBtn').css("display","block"); //윈도우 시작하면 보내기버튼이 나옴
		$('#replyBtn').css("display","none"); //윈도우 시작하면 답장에서 보내기버튼이 사라짐
	
		$('#messageBtn').click(function(){
			$('#messageModal').show(); //쪽지함을 클릭하면 모달창 뜸
			$.ajax({ //사용자가 갖고있는 매장목록 select
				url : '${pageContext.request.contextPath}' + '/admin/storeList',
				type : 'get',
				success : function(data){
					var storeList = '<select id = "storeList" class = "storeList"><option>매장을 선택하세요</option>';
					for(var j = 0; j < data.length; j++){
						storeList += '<option>' + data[j].store_name + '</option>';
					} //리스트 반복문 끝
					storeList += '</select>';
					$('#adminStoreList').html(storeList);
					
					$('#adminStoreList').change(function(){
						//console.log(selectedStore);
						//console.log($('#send_id').val());
						
						//setInterval(function(){ // 데이터베이스에서 실시간으로 초단위로 데이터를 가져옴
						function getAllList(){
							
						}
						var str = '';
						var selectedStore = $('#adminStoreList option:selected').val();
							$.ajax({
							url : '${pageContext.request.contextPath}' + '/admin/message',
							type : 'post',
							data : {
								receive_id : $('#send_id').val(),
								store_name : selectedStore
							},
							success : function(data){
							//console.log(data);
							if(data.length > 0){
							//console.log(data[1].message_con);
							$('#messageList').html("");
							for(var i = 0; i < data.length; i++){
								str = '<div id="messageUlWrap" class = "messageUlWrap">';
								str += '<ul id="messageUl" class = "messageUl">';
								str += '<img src = ${pageContext.request.contextPath}/images/delete2.png style = "width : 17px; height : 20px;"class = "deleteMessage" id = "' + data[i].message_id + '">'
								str += '	<li id = "li_message_id">메시지 번호 : ' + data[i].message_id + '</li>';
								str += '	<li id = "li_send_id" class = "li_send_id">보내는 사람 : ' + data[i].send_id + '</li>';
								str += '	<li><textarea readonly cols="20" id = "li_message_con">' + data[i].message_con + '</textarea></li>';
								str += '	<input type = "button" id = "' + data[i].send_id + '/' + data[i].store_id + '" class = "messageReply" value = "답장">';
								str += '	<input type = "button" id = "messageDetail" class = "messageDetail" value = "상세">';
								str += '</ul></div>';
								$('#messageList').append(str);
							} str = '';
							adminStoreList = '';
							} else{
							$('#messageList').html("<p style = 'color : red; margin-bottom : 20px; font-size : 15px;'>※ 도착한 메시지가 없습니다.</p>");
							}
						/////////////쪽지 삭제 이벤트/////////////
							$('.deleteMessage').click(function(){
								var message_id = $(this).attr("id");
								$.ajax({
									url : '${pageContext.request.contextPath}' + '/member/deleteMessage/' + message_id,
									success : function(data){
										alert("메시지 삭제 성공");
									}
								});//삭제 ajax 끝
							}); //삭제 클릭 이벤트 끝
					
					 /////////////쪽지 답장 이벤트//////////////
							$('.messageReply').click(function(){
								$('#sendBtn').css("display","none");
								$('#replyBtn').css("display","block");
								var totalId = $(this).attr("id");
								var index = totalId.indexOf("/"); //불러온 아이디 값을 / 기준으로 짜름
								var receive_id = totalId.substr(0,index); // 불러온 아이디 앞부분
								var store_id = totalId.substr(index+1); // 불러온 아이디 뒷부분
								//console.log(receive_id + ":" + store_id);
								$('#writeMessageModal').show();
								$('#send_id').val("관리자");
								$('#receiveReply').css("display","block");
								$('#sendWrap, #selectStore').css("display","none");
								$('#receiveReply').val(receive_id);
					
					/////////////// 답장 모달창에서 보내기 이벤트//////////
								$('#replyBtn').click(function(){
								$.ajax({
									url : '${pageContext.request.contextPath}' + '/member/writeMessage',
									type : 'post',
									data : {
										send_id : $('#send_id').val(),
										receive_id :receive_id,
										store_id : store_id,
										message_title : $('#message_title').val(),
										message_con : $('#message_con').val()
									},
									success : function(data){
										alert("답장을 완료했습니다.");
										$('#sendBtn').css("display","block");
										$('#replyBtn').css("display","none");
										$('#writeMessageModal').hide();
									} //성공 끝
								}); // 답장 ajax 끝
								}); //모달창에서 보내기 이벤트 끝
							}); //쪽지 답장 이벤트 끝
						} // 성공 끝
					}); //쪽지함클릭 ajax끝
					//},500); // interval끝
					}); //관리자 매장변경 이벤트 끝
				} //성공 끝
			}); //매장목록 가져오기 ajax 끝
		});
		
		///////////// 쪽지쓰기버튼 이벤트///////////////
		$('#writeMessage').click(function(){
			$('#writeMessageModal').show(); //쪽지쓰기를 클릭하면 모달창 뜸
			$('#receiveReply').css("display","none");
			$('#sendWrap, #selectStore').css("display","block");
			$.ajax({
				url : '${pageContext.request.contextPath}' + '/member/sendList',
				type : 'get',
				success : function(data){
					list = "<select class = 'sendList' id = 'sendList' style = 'width : 100%; height : 40px; padding : 3px;'><option>사용자를 선택하세요</option>";
					for(var i = 0; i < data.length; i++){
						list += "<option name = 'send_id' id = '"+ data[i].store_id +"'>" + data[i].user_id + "</option>";
					}
					list += "</select>";
					$('#sendWrap').html(list);
					
					$('#sendList').change(function(){ //받는사람 리스트 변경 이벤트
						send_id = $('#sendList option:selected').val(); //선택된 아이디값을 가져옴
						//console.log(store_id);
						var store_name = "<select class = 'store_name' id = 'store_name' style = 'width : 100%; height : 40px; padding : 3px;'><option>사용자의 매장을 선택하세요</option>";
						$.ajax({
							url : '${pageContext.request.contextPath}' + '/member/sendStore/' + send_id,
							success : function(data2){
								//console.log(data);
								for(var j = 0; j < data2.length; j++){
									store_name += "<option>" + data2[j].store_name + "</option>";
								}
							store_name += "</select>";
							$('#selectStore').html(store_name);
							} //매장이름 가져오기 성공 끝
						}); // 보내는아이디에 해당하는 매장번호 구하는 ajax 끝
					});
				} //성공 끝
			}); //ajax 끝
		}); //쪽지쓰기 이벤트 끝
		
		///////////////// 보내기버튼 이벤트//////////////////
		$('#sendBtn').click(function(){
			console.log($('#sendList option:selected').attr("id"));
			$.ajax({
				url : '${pageContext.request.contextPath}' + '/member/writeMessage',
				type : 'post',
				data : { //보내는사람, 받는사람, 받는사람의 매장아이디, 제목, 내용
					send_id : $('#send_id').val(),
					receive_id : send_id,
					store_id : $('#sendList option:selected').attr("id"),
					message_title : $('#message_title').val(),
					message_con : $('#message_con').val()
				},
				success : function(data){
					alert("메시지를 성공적으로 보냈습니다.");
					$('#writeMessageModal').hide(); //쪽지쓰기 모달창 끔
					$('#messageModal').show(); // 리스트 모달창 뜸
				}// 성공 끝
				
			}); // ajax 끝
		}); //메시지 보내기 이벤트 끝
		
		//모달창 밖의 영역을 누르면 띄워져 있는 모달창을 닫음
        $(window).on('click', function() {
           //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
           if (event.target == $('#messageModal').get(0)) {
        	   $('#messageModal').hide();
           } else if (event.target == $('#writeMessageModal').get(0)){
        	   $('#writeMessageModal').hide();
        	   $('#sendBtn').css("display","block");
			   $('#replyBtn').css("display","none");
           }
        });
		
	});
</script>
</html>