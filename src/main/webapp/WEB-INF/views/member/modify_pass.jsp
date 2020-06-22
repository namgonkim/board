<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ include file="../includes/header.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Outer Row -->
	<div class="row justify-content-center">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-4 d-none d-lg-block bg-login-image"></div>
						<!-- 회원 정보 수정-->
						
						<div class="col-lg-8">
							<form role="form" method="post">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">비밀번호 변경</h1>
								</div>
								<hr>
								<!-- 히든 -->
								<input type="hidden" id="userId" name="userId" value="${member.userId}">
								<!-- 새 비밀번호 -->
								<div class="form-group">
									<label>새 비밀번호 입력</label>
									<input type="password" id="userPass" name="userPass"
										class="form-control">
								</div>
								<hr>
								<div class="form-group">
									<button class="btn btn-outline-primary" type="submit">비밀번호 변경 </button>
									<a class="btn btn-secondary" href="/member/mypage">돌아가기 </a>
								</div>
								<hr>
							</div>
							</form>
						</div>
						
					</div>
				</div>
			</div>

		</div>

	</div>


</div>
<%@ include file="../includes/footer.jsp" %>