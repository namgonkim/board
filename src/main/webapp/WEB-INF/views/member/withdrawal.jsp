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
							<!-- 회원 프로필 -->
						<div class="col-lg-8">
							<form role="form" method="post">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">회원탈퇴</h1>
								</div>
								<hr>
								<!-- 회원 ID -->
								<div class="form-group">
									<label>ID</label>
									<input type="text" id="userId" name="userId"
										class="form-control form-control-user"
										value="${member.userId}" readonly="readonly">
								</div>
								<p>님 회원탈퇴를 하시려면 비밀번호를 입력해 주세요</p>
								<hr>
								<!-- 비밀번호 입력란 -->
								<div class="form-group">
									<label>Password</label>
									<input type="password" id="userPass" name="userPass"
										class="form-control form-control-user">
								</div>
								<hr>
								<p> 아래의 '탈퇴하기' 버튼을 누르시면 탈퇴가 정상적으로 진행됩니다.</p>
								<p> 한번 탈퇴한 회원은 복구할 수 없습니다. <b>신중하게 결정해 주세요.</b> </p>
								<div class="form-group">
									<button class="btn btn-secondary" type="submit">탈퇴하기 </button>
									<a class="btn btn-secondary" href="/member/mypage">돌아가기 </a>
								</div>
								<hr>
								<c:if test="${msg == false}">
									<p><b>비밀번호를 잘 못 입력하셨습니다!</b></p>
								</c:if>
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