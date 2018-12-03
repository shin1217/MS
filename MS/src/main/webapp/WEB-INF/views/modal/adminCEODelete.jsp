<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>


</style>
<!-- 게시글 삭제확인 모달 -->
<div class="modal fade" id="modalUserBoardDeleteForm" tabindex="-1"	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
					href="${pageContext.request.contextPath}/user/userBoard/delete/${userboardvo.uboard_id}">삭제</a>
				<a class="btn btn-dark" data-dismiss="modal">취소</a>
			</div>
		</div>
	</div>
</div>
<!-- 게시글 삭제확인 모달 끝 -->