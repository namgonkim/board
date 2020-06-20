<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- 게시글  -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h3 class="m-2 font-weight-bold text-dark">게시글 </h3>
		</div>
		<div class="card-body">
			<div align="right" class="mb-4">
				<a href="/board/listPage?num=1" class="btn btn-dark btn-icon-split">
				<span
					class="icon text-gray-600"> <i class="fas fa-arrow-right"></i>
				</span> <span class="text">목록</span>
				</a>
			</div>
			<table class="table table-bordered">
				<tr>
					<th>저자</th>
					<td>${view.writer}</td>
					<th>조회수</th>
					<td>${view.viewCnt}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${view.title}</td>
					<th>날짜</th>
					<td>${view.regDate}</td>
				</tr>
			</table>
			<textarea style="background-color:transparent; border:0;"
			class="form-control" id="exampleFormControlTextarea1"
				rows="15" readonly> ${view.content}</textarea> <br>
			<div align="right" class="mb-2">
				<button type="submit" class="btn btn-primary"
				onclick="location.href ='/board/modify?bno=${view.bno}'">게시물 수정</button>
				<button type="submit" class="btn btn-outline-secondary"
				onclick="del_button()">게시물 삭제</button>
			</div>
		</div>
	</div>
	<div class="card shadow mb-2">
		<div class="card-header py-4">
			<h4 class="m-0 font-weight-bold text-dark">댓글 </h4>
		</div>
		<div align="center" class="card shadow mb-1 col-xl-15">
			<div class="card-header py-2">
				<h6 class="m-0 font-weight-bold text-dark">댓글 작성</h6>
			</div>
			<div class="card-body">
				<form name="replyForm" method="post">
					<input type="hidden" id="bno" name="bno" value="${view.bno}" />
					<table class="table table">
						<tbody>
							<tr>
								<th>댓글 작성자</th>
								<td><input type="text" id="writer" name="writer"
									class="form-control" maxlength="20"></td>
							</tr>
							<tr>
								<th>댓글 내용</th>
								<td><textarea class="form-control" placeholder="내용을 입력하세요."
										name="content" id="content" maxlength="1024"
										style="height: 100px;"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div align="right" class="mb-2">
						<button type="button" class="replyWriteBtn btn btn-outline-primary">작성</button>
					</div>
				</form>
			</div>
		</div>
		<div align="center" class="card-header py-2">
			<h6 class="m-0 font-weight-bold text-dark">댓글 목록 </h6>
		</div>
		<div class="card-body">
			<ol class="replyList">
				<table class="table">
				<c:forEach items="${replyList}" var="replyList">
				<tr>
					<th>작성자</th>
					<td>${replyList.writer}</td>
				</tr>
				<tr>
					<th>작성 날짜</th>
					<td><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><p>${replyList.content}</p></td>
				</tr>
				<tr>
					<th></th>
					<td>
					<div align="right">
						<button type="button" class="replyUpdate btn btn-outline-primary" data-rno="${replyList.rno}">수정</button>
 						<button type="button" class="replyDelete btn btn-outline-primary" data-rno="${replyList.rno}">삭제</button>
					</div>
					</td>
				</tr>
				</c:forEach>
				</table>
			</ol>
		</div>
	</div>
	

<!-- 푸터 복붙 -->
</div>

<%@ include file="../includes/footer.jsp"%>
<!-- 삭제버튼 클릭시 경고 창 -->
<script type="text/javascript">
	function del_button() {
		if (confirm("삭제할까요?") == true) { //확인
			location.href ='/board/delete?bno=${view.bno}';
		} else { //취소
			return;
		}
	}
	
	$(".replyWriteBtn").on("click", function(){
		  var formObj = $("form[name='replyForm']");
		  formObj.attr("action", "/board/replyWrite");
		  formObj.submit();
	});

	$(".replyUpdate").click(
			function() {
				self.location = "/board/replyUpdate?bno=${view.bno}"
						+ "&rno="
						+ $(this).attr("data-rno");
			});

	$(".replyDelete").click(
			function() {
				self.location = "/board/replyDelete?bno=${view.bno}"
						+ "&rno="
						+ $(this).attr("data-rno");
			});
</script>