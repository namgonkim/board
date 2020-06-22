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
									<h1 class="h4 text-gray-900 mb-4">회원정보 변경</h1>
								</div>
								<hr>
								<!-- 회원 이름 -->
								<div class="form-group">
									<label>회원</label>
									<input type="text" id="userName" name="userName"
										class="form-control form-control-user"
										placeholder="${member.userName}" >
								</div>
								<hr>
								<!-- 회원 ID -->
								<div class="form-group">
									<label>ID</label>
									<input type="text" id="userId" name="userId"
										class="form-control form-control-user"
										value="${member.userId}" readonly="readonly">
								</div>
								<hr>

								<!-- 활동 로그 -->
								<div class="form-group">
									<label>활동 로그</label>
								</div>
								<hr>
								<div class="form-group">
									<button class="btn btn-outline-primary" type="submit">회원정보 변경 </button>
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