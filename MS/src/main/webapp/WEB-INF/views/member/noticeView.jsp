<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.row {
	margin-top: 50px;
	color: #666;
}

.buttonsLeft {
	float: left;
	display: block;
}

.buttonsRight {
	float: right;
	display: block;
}

.comments {
	padding-top: 40px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<h4 style="color: #1e1e1e;"><strong>${view.noticeTitle}</strong></h4>
				<fmt:parseDate value="${view.noticeDate}" pattern="yyyy-MM-dd HH:mm"
					var="date" />
				<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
			</div>
			<div class="col-sm-9" style="height: 400px">
				<p></p>
				${view.noticeCon}
			</div>
		</div>
		<hr />
		<div class="buttonsLeft">
			<button type="button" class="btn btn-outline-elegant waves-effect" onclick="location.href='${pageContext.request.contextPath}/member/notice/${view.noticeId-1}'">이전</button>
			<button type="button" class="btn btn-outline-elegant waves-effect" onclick="location.href='${pageContext.request.contextPath}/member/notice/${view.noticeId+1}'">다음</button>
		</div>
		<div class="buttonsRight">
			<button type="button" class="btn btn-dark" data-toggle="modal"
				data-target="#modalNoticeDeleteForm">삭제</button>
			<button type="button" class="btn btn-dark"
				onclick="location.href='${pageContext.request.contextPath}/admin/notice/modify/${view.noticeId}'">수정</button>
			<button type="button" class="btn btn-dark"
				onclick="location.href='${pageContext.request.contextPath}/member/notice?page=1'">
				<i class="fa fa-th-list pr-2" aria-hidden="true"></i>목록
			</button>
		</div>

		<!--Section: Comments-->
		<section class="comments my-5">
			<!-- 코멘트 총개수 -->
			<div id="commentsNum" class="card-header font-weight-bold"></div>

			<div id="replyAllBody"></div>
		</section>
		<!--Section: Comments-->

		<!-- 댓글 입력란 -->
		<div class="md-form mt-4">
			<label for="replyFormComment">댓글 입력</label>
			<textarea class="form-control md-textarea" id="replyFormComment"
				rows="1"></textarea>
			<div class="text-center my-4">
				<button id="commentSubmit"
					class="btn btn-default btn-sm btn-rounded">댓글 입력</button>
				<c:if test="${adminVO.adminId != null}">
					<!-- 세션에 userId가 존재하면 hidden에 넣어줌(댓글이름에 사용) -->
					<input id="nick" type="hidden" value="${adminVO.adminId}" />
				</c:if>
				<c:if test="${userVO.userId != null}">
					<!-- 세션에 userI가 존재하면 hidden에 넣어줌(댓글이름에 사용) -->
					<input id="nick" type="hidden" value="${userVO.userId}" />
				</c:if>
			</div>
		</div>
	</div>

</body>
<!-- 게시글 삭제확인 모달 -->
<div class="modal fade" id="modalNoticeDeleteForm" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
				<a class="btn btn-danger"
					href="${pageContext.request.contextPath}/admin/notice/delete/${view.noticeId}">삭제</a>
				<a class="btn btn-dark" data-dismiss="modal">취소</a>
			</div>
		</div>
	</div>
</div>
<!-- 게시글 삭제확인 모달 끝 -->

<!-- 댓글 삭제확인 모달 -->
<div class="modal fade right" id="modalReplyDeleteForm" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div
		class="modal-dialog modal-side modal-bottom-right modal-dialog-centered"
		role="document">
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
				<a class="btn btn-danger"
					href="${pageContext.request.contextPath}/admin/notice/delete/${view.noticeId}">삭제</a>
				<a class="btn btn-dark" data-dismiss="modal">취소</a>
			</div>
		</div>
	</div>
</div>
<!-- 댓글 삭제확인 모달 끝-->

<script>
	$(document).ready(function() {
		getAllList();
	});

	var noid = '${view.noticeId}';
	var reply = '';

	function getAllList() {
		$
				.ajax({
					type : 'get',
					url : '${pageContext.request.contextPath}' + '/reply/all/'
							+ noid,
					dataType : 'json',
					success : function(data) {
						$('#commentsNum').html(data.length + ' comments');
						$('#replyAllBody').html('');
						$(data)
								.each(
										function(index, item) {
											$('#commentsNum').html(
													data.length + ' comments');
											reply += '<div class="media d-block d-md-flex mt-4">';
											reply += '<img class="card-img-64 rounded-circle z-depth-1 d-flex mx-auto mb-3" src="https://post-phinf.pstatic.net/MjAxODAzMjJfMjY4/MDAxNTIxNzAxODU2MTQy.V91kaps6gaHaHS6JhzoHGT98PuoEv8kSz3zjgWT4kOAg.ffqd0efJQR_23lCWLTjDfjS3Hd-jfqEjSxNLCilQMScg.JPEG/%EC%88%98%EB%A7%8C%EA%B0%80%EC%A7%80%ED%91%9C%EC%A0%95%EC%9D%98%EB%A0%89%EC%8B%9C%EA%B3%A0%EC%96%91%EC%9D%B4_02.jpg?type=w1200">';
											reply += '<div class="media-body text-center text-md-left ml-md-3 ml-0">';
											reply += '<h5 class="font-weight-bold mt-0">';
											/* reply += '<button id="replyDeleteBtn' + item.replyId +'" data-toggle="modal" data-target="#modalReplyDeleteForm" type="button" class="btn btn-danger px-3 float-right"><i class="fa fa-trash" aria-hidden="true"></i></button>'; */
											reply += '<button id="replyDeleteBtn'
													+ item.replyId
													+ '" onclick="replyDelete('
													+ item.replyId
													+ ')" type="button" class="btn btn-danger px-3 float-right"><i class="fa fa-trash" aria-hidden="true"></i></button>';
											reply += '<button id="replyEditBtn'
													+ item.replyId
													+ '" onclick="replyEdit('
													+ item.replyId
													+ ')" type="button" class="btn btn-primary px-3 float-right"><i class="fa fa-paint-brush" aria-hidden="true"></i></button>';
											reply += '<a class="text-default">'
													+ item.nickName
													+ '</a></h5>';
											reply += '<input id="replyInput' + item.replyId +'" class="form-control w-75" value="'+ item.replyCon +'" style="border: 0px; background: white;" readonly="true"></input><hr /></div></div>';
											$('#replyAllBody').html(reply);
										});
						reply = '';
					}
				});
	}

	$('#commentSubmit').click(function() {
		var replyText = $('#replyFormComment').val();
		var nick = $('#nick').val();

		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}' + '/reply',
			dataType : 'text',
			data : {
				noId : noid,
				nickName : nick,
				replyCon : replyText
			},
			success : function(data) {
				console.log('댓글작성완료');
				getAllList();
				$('#replyFormComment').val('');
			}
		});
	});

	function replyDelete(replyId) {
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}' + '/reply/delete/'
					+ replyId,
			success : function(data) {
				console.log('삭제확인');
				getAllList();
			}
		});
	};

	function replyModify(reid) { //댓글 수정확인 누를시
		var replyText = $('#replyInput' + reid).val();

		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}' + '/reply/modify',
			dataType : 'text',
			data : {
				replyId : reid,
				replyCon : replyText
			},
			success : function(data) {
				console.log('수정확인');
				getAllList();
			}
		});
	};

	function replyEdit(reid) { //댓글수정 클릭시

		$('#replyInput' + reid).attr("readonly", false);
		$('#replyEditBtn' + reid).find('i').attr("class", "fa fa-check"); //댓글 수정클릭시 모양바뀜
		$('#replyInput' + reid).focus();
		$('#replyEditBtn' + reid).attr("onclick", 'replyModify(' + reid + ')');
	};
</script>
</html>