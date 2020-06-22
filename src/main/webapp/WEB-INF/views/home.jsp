<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
</head>
<c:if test="${member == null}">
	<a href="/board/main">로그인하지 않고 웹 보드 메인으로 바로가기</a><br />
</c:if>
<c:if test="${member != null}">
	<a href="/board/main">웹 보드 메인으로 바로가기</a><br />
</c:if>
<body>
	<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div>
				<label for="userId"></label>
				<input type="text" id="userId" name="userId">
			</div>
			<div>
				<label for="userPass"></label>
				<input type="password" id="userPass" name="userPass">
			</div>
			<div>
				<button type="submit">로그인</button>
				<a href="/member/register">회원가입</a>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userName}님 환영 합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			// 로그아웃 버튼
			$("#logoutBtn").on("click", function() {
				location.href = "member/logout";
			});
			// 로그인 버튼
			$("#submit").on("click", function() {
				if ($("#userId").val() == null) {
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if ($("#userPass").val() == null) {
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
			});
		});
	</script>
</body>
</html>