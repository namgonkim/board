<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<%@ include file="includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">
	
	<!-- 댓글 삭제 -->
	<form role="form" method="post" autocomplete="off">
	
	<div class="card shadow mb-4 col-xl-5" >
		<div class="card-header">
			<h6 class="m-0 font-weight-bold text-dark">정말로 삭제하시겠습니까?</h6>
        </div>
		<input type="hidden" id="bno" name="bno" value="${readReply.bno}" readonly="readonly" />
    	<input type="hidden" id="rno" name="rno" value="${readReply.rno}" readonly="readonly" />

		<div class="card-body mb-2">
    	<button type="submit" class="btn btn-success">예, 삭제합니다.</button><br />
		<br>
    	<button type="button" id="cancel_btn" class="btn btn-light">아니오, 삭제하지 않습니다.</button>
    	</div>
    </div>

<script>
    // 폼을 변수에 저장
    var formObj = $("form[role='form']"); 
    
    // 취소 버튼 클릭
    $("#cancel_btn").click(function(){
     self.location = "/view?bno=${readReply.bno}";    
    });
</script>
	</form>
	
<!-- 푸터 복붙 -->
</div>

<%@ include file="includes/footer.jsp"%>
