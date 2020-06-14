<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- 게시글  -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h3 class="m-2 font-weight-bold text-dark">게시글 </h3>
		</div>
		<div class="card-body">
			<div align="right" class="mb-4">
				<a href="/listPage?num=1" class="btn btn-dark btn-icon-split">
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
				onclick="location.href ='/modify?bno=${view.bno}'">게시물 수정</button>
				<button type="submit" class="btn btn-primary"
				onclick="del_button()">게시물 삭제</button>
			</div>
		</div>
	</div>

<!-- 푸터 복붙 -->
</div>

<%@ include file="includes/footer.jsp"%>
<!-- 삭제버튼 클릭시 경고 창 -->
<script type="text/javascript">
	function del_button() {
		if (confirm("삭제할까요?") == true) { //확인
			location.href ='/delete?bno=${view.bno}';
		} else { //취소
			return;
		}
	}
</script>