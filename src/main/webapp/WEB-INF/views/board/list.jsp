<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

<!-- 헤더 끝 -->
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">게시글 목록</h6>
		</div>
		<div class="card-body">
			<div align="right">
				<input class="btn btn-primary" type="button" value="작성하기"
				onclick= "location.href ='/board/write'"></input>
			</div><br>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.bno}</td>
								<td><a href="/board/view?bno=${list.bno}"> ${list.title} </a></td>
								<td>${list.regDate}</td>
								<td>${list.writer}</td>
								<td>${list.viewCnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


<!-- 푸터 복붙 -->
</div>

<%@ include file="../includes/footer.jsp"%>