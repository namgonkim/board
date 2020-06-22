<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">


	<!-- 게시글 작성 -->
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
			
			<c:if test="${member == null }">
				<h5> 로그인 후에 글을 작성하실 수 있습니다. </h5>
				<a type="button" href="/member/login" class="btn btn-primary"> 로그인 </a>
			</c:if>
			<c:if test="${member != null }">
			<form method="post">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">글
							작성 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>제목</th>
							<td>
							<input type="text" class="form-control" placeholder="제목을 입력하세요."
							name="title" maxlength="50">
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
							<input type="text" class="form-control" placeholder="작성자를 입력하세요."
							name="writer" maxlength="50"
							<c:if test="${member !=null}"> value="${member.userName}" readonly="readonly"</c:if> >
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
							<textarea class="form-control" placeholder="내용을 입력하세요." 
							name="content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div align="right" class="mb-2">
					<button type="submit" class="btn btn-primary"
					onclick="check_null()">작성하기</button>
				</div>
			</form>
			</c:if>
		</div>
	</div>

<!-- 푸터 복붙 -->
</div>
<%@ include file="../includes/footer.jsp"%>