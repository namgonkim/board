<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- 게시글 수정 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h3 class="m-2 font-weight-bold text-dark">게시글</h3>
		</div>
		<div class="card-body">
			<div align="right" class="mb-4">
				<a href="/board/listPage?num=1" class="btn btn-dark btn-icon-split"> <span
					class="icon text-gray-600"> <i class="fas fa-arrow-right"></i>
				</span> <span class="text">목록</span>
				</a>
			</div>

			<form method="post">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">글
							수정 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>제목</th>
							<td>
							<input type="text" class="form-control" placeholder="글 제목"
							name="title" maxlength="50" value="${view.title}" >
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
							<input type="text" class="form-control" placeholder="작성자"
							name="writer" maxlength="50" value="${view.writer}" >
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
							<textarea class="form-control" placeholder="글 내용" 
							name="content" maxlength="2048" style="height: 350px;">${view.content}</textarea></td>
						</tr>
					</tbody>
				</table>
				<div align="right" class="mb-2">
					<button type="submit" class="btn btn-primary">수정하기</button>
				</div>
			</form>
		</div>
	</div>
<!-- 푸터 복붙 -->
</div>

<%@ include file="../includes/footer.jsp"%>