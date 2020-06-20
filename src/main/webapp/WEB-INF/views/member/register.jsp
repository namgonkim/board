<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원가입</title>

  <!-- Custom fonts for this template-->
  <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-light">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
              </div>
              <form class="user" action="/member/register" method="post">
                <!-- ID -->
                <div class="form-group">
                  <input class="form-control form-control-user" type="text" id="userId" name="userId" placeholder="ID">
                </div>
                <!-- password -->
                <div class="form-group">
                  <input class="form-control form-control-user" type="password" id="userPass" name="userPass" placeholder="Password">
                </div>
                <!-- 이름 -->
                <div class="form-group">
                  <input class="form-control form-control-user" type="text" id="userName" name="userName" placeholder="Name">
                </div>
                
                <div class="form-group has-feedback">
					<button class="btn btn-primary btn-user btn-block" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-outline-danger btn-user btn-block" type="button">취소</button>
				</div>
				
                <hr>
                <a href="https://google.com" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> 네이버 , 카카오 연동 로그인 추후 업글 예정
                </a>
                <img src=../resources/img/kakao_login.png>
              </form>
              <hr>
              <div class="text-center">
                <p> 비밀번호를 잃어버리셨나요? <a href="forgot-password.html">비밀번호 찾기</a></p>
              </div>
              <div class="text-center">
                	<p>이미 아이디가 있다면? <a href="login.html">로그인하기</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../resources/js/sb-admin-2.min.js"></script>
  
  <!-- 카카오 -->
  <script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>

</body>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "./login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
</html>
