<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class = "container">
	<div class = "photoHeader">
		<a id="write" class="btn btn-outline-elegant waves-effect"
			href="${pageContext.request.contextPath}/member/photoBoard/write">글쓰기</a>
		<div><h3>${viewData.photo_title}</h3></div><hr>
		<div id = "photo_id" style = "float : left;">글번호 : ${viewData.photo_id}</div>
		<div style = "float : right;">등록시간 : <fmt:parseDate value="${viewData.photo_date}" pattern="yyyy-MM-dd HH:mm" var = "date" />
		<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" /></div>
		<div style = "float : right;">작성자 : ${viewData.photo_upid}</div>
	</div><br><hr>
	<div class = "context">
		<div><img src = "${pageContext.request.contextPath}/images/photoboard/${viewData.photo_file}" style = "width : 350px; height : 350px;"></div><br>
		<div>${viewData.photo_con}</div><hr>
	</div>
	<div id = "btnDiv">
		<c:if test="${userSession.user_id == viewData.photo_upid || adminSession == viewData.photo_upid}">
		<button type="button" class="btn btn-dark" data-toggle="modal"	data-target="#modalPhotoBoardDeleteForm">삭제</button>
		<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/member/photoBoard/modify/${viewData.photo_id}'">수정</button></c:if>
		<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/member/photoBoard?page=1'">목록</button>
	</div>
	<div id = reply>
		<!-- 댓글  -->
		<section class="comments my-5"> <!-- 코멘트 총개수 -->
		<div id="photoBoardCommentsNum" class="card-header font-weight-bold"></div>
		<div id="photoBoardReplyAllBody"></div>
		</section>
		
		<!-- 댓글 입력란 -->
		
			<div class="md-form mt-4">
				<label for="photoBoardReplyFormComment">댓글 입력</label>
				<textarea  class="form-control md-textarea" id="photoBoardReplyFormComment" rows="1" ></textarea>
				<div class="text-center my-4">
					<button id="replySubmit" class="btn btn-default btn-sm btn-rounded">댓글 입력</button>
				</div>
			</div>
	</div>
</div>

<!-- 게시글 삭제확인 모달 -->
<div class="modal fade" id="modalPhotoBoardDeleteForm" tabindex="-1"	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">
					정말 <span style="color: red">삭제</span>하시나요?
				</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-footer d-flex justify-content-center">
				<a class="btn btn-danger" href="${pageContext.request.contextPath}/member/photoBoard/delete/${viewData.photo_id}">삭제</a>
				<a class="btn btn-dark" data-dismiss="modal">취소</a>
			</div>
		</div>
	</div>
</div>
</body>
<script>
	var store_id = ${storeSelectSession.store_id};
	var photo_id = ${viewData.photo_id};

	$(document).ready(function(){
		getReplyList(photo_id);
		countReply(photo_id);
	});
	if ("${userSession}"){
		var writeId = "${userSession.user_id}";
	} else {
		var writeId = "${storeSelectSession.store_name}[관리자]";
		var admin_id = "${adminSession.admin_id}";
	}
	
	$('#replySubmit').click(function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/member/photoView/photoReply',
			type : 'post',
			data : {
				photoreply_con : $('#photoBoardReplyFormComment').val(),
				photoreply_writeid : writeId,
				store_id : store_id,
				photo_id : photo_id
			},
			success : function(data){
				console.log(data);
				getReplyList(photo_id);
				$('#photoBoardReplyFormComment').val("");
			}
		});
	});
	function getReplyList(photo_id){
		var str = "";
		$.ajax({
			url : '${pageContext.request.contextPath}/member/photoView/photoReplyList/' + photo_id,
			success : function(data){
				
				for(var i = 0; i < data.length; i++){
					str += "<div id = 'replyWrap' style = 'position : relative'><div id = 'reply_writeId'>" + data[i].photoreply_writeid + " (" + data[i].photoreply_date + ")</div>";
					str += "<div id = 'reply_con'>" + data[i].photoreply_con + "</div>";

					if(data[i].photoreply_writeid == writeId || data[i].photoreply_writeid == admin_id){
						str += "<div id = 'replyBtnDiv' style = 'position : absolute; right : 0px; top : 0px;'><button id='photoBoardReplyDeleteBtn' onclick='photoBoardReplyDelete(" + data[i].photoreply_id + ")' class='btn btn-danger px-3 float-right'><i class='fa fa-trash' aria-hidden='true'></i></button>";
						str += "<button id='photoBoardReplyEditBtn' onclick='photoBoardReplyEdit(" + data[i].photoreply_id + ")' class='btn btn-primary px-3 float-right'><i class='fa fa-paint-brush' aria-hidden='true'></i></button></div>";
					}
					str += "<hr>";
				}
				str += "</div>";
				$('#photoBoardReplyAllBody').html(str);
			}
		});
	}
	function countReply(photo_id){
		$.ajax({
			url : '${pageContext.request.contextPath}/member/photoView/countReply/' + photo_id,
			success : function(data){
				console.log(data);
				$('#photoBoardCommentsNum').html("<p>" + data +" comments</p>")
			}
		});
	}
	
	
	
	
	
	
</script>
</html>