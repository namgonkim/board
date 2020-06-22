<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- 댓글 수정 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h3 class="m-2 font-weight-bold text-dark">댓글</h3>
		</div>
		<div class="card-body">
			
			<form role="form" method="post" autocomplete="off">
			
				<input type="hidden" id="bno" name="bno" value="${readReply.bno}" readonly="readonly" />
   				<input type="hidden" id="rno" name="rno" value="${readReply.rno}" readonly="readonly" /> 
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">
							댓글 수정 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>작성자</th>
							<td>
							<input type="text" class="form-control" placeholder="작성자"
							id="writer" name="writer" maxlength="50" value="${readReply.writer}" >
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
							<textarea class="form-control" placeholder="댓글 내용" 
							id="content" name="content" maxlength="2048"
							style="height: 350px;">${readReply.content}</textarea></td>
						</tr>
					</tbody>
				</table>
				<div align="right" class="mb-2">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" id="cancel_btn" class="btn btn-outline-secondary">취소</button>
				</div>
			</form>
		</div>
	</div>
<!-- 푸터 복붙 -->
</div>

<%@ include file="../includes/footer.jsp"%>
<!-- 푸터 끝 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script>
    // 폼을 변수에 저장
    var formObj = $("form[role='form']"); 
      
	// 취소 버튼 클릭
	$("#cancel_btn").click(function() {
		self.location = "/board/view?bno=${readReply.bno}";
	});
</script>