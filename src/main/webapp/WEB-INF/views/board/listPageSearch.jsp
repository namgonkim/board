<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">게시글 목록</h6>
		</div>
		<div class="card-body">
			<div align="right">
				<input class="btn btn-primary" type="button" value="작성하기"
					onclick="location.href ='/board/write'"></input>
			</div>
			<br>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable"
				style="width:100%;border-collapse:collapse;">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><a href="/board/view?bno=${list.bno}"> ${list.title} </a></td>
								<td>${list.writer}</td>
								<td>${list.regDate}</td>
								<td>${list.viewCnt}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row">
			<div class="col-sm-12 col-md-5"> </div>
			<div class="col-sm-12 col-md-7">
				<ul class="pagination">
					<li class="paginate_button page-item previous"
						id="dataTable_previous">
						<!-- 이전 페이지 --> <c:if test="${page.prev}">
							<span>[ <a aria-controls="dataTable" class="page-link"
								href="/board/listPageSearch?num=${page.startPageNum - 1}">이전</a> ]
							</span>
						</c:if>
					</li>
					<!-- 숫자 페이지 -->
					<c:forEach
						begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
						<span><c:if test="${select != num}">
							<li class="paginate_button page-item">
								<a class="page-link" aria-controls="dataTable"
								href="/board/listPageSearch?num=${num}">${num}</a>
							</li>
						</c:if>
						<c:if test="${select == num}">
							<li class="paginate_button page-item active">
								<a class="page-link" aria-controls="dataTable">${num}</a>
							</li>
						</c:if>
						</span>
					</c:forEach>
					<!-- 다음 페이지 -->

					<li class="paginate_button page-item next"><c:if
							test="${page.next}">
							<span>[ <a class="page-link" aria-controls="dataTable"
								href="/board/listPageSearch?num=${page.endPageNum + 1}">다음</a> ]
							</span>
						</c:if></li>
				</ul>
			</div>
			</div>
			<div class="input-group">
				<select name="searchType">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="title_content">제목+내용</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" name="keyword" class="form-control"/>

				<button type="button" id="searchBtn" class="btn btn-outline-primary">검색</button>
			</div>

		</div>
	</div>


</div>
<script>
	document.getElementById("searchBtn").onclick = function() {

		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;

		location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>
<%@ include file="../includes/footer.jsp"%>