<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../includes/header.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Home</h1>
		<a href="https://github.com/namgonkim/board"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fa fa-github" aria-hidden="true"></i> Github</a>
	</div>

	<!-- Home header img -->
	<div class="card shadow mb-4">
		<div style="position: relative;">
			<img src="/resources/img/home-header.jpg"/>
			<div style="left: 100px; width: 450px; bottom: 140px; font-size: 1.8em; font-weight: bold; position: absolute;">
			Welcome! ${member.userID}!</div>
		</div>
	</div>

	<!-- Illustrations -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">실행 환경</h6>
		</div>
		<div class="card-body">
			<p>	Idle : Eclipse <br>
				Language : JSP <br>
				Framework : Spring <br>
				Server : Apache-Tomcat 9.0 <br>
				DataBase : MySQL 8.0.2x <br>
			</p>
		</div>
	</div>

	<!-- Approach -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Development
				Approach</h6>
		</div>
		<div class="card-body">
			<p>
			광운대학교 컴퓨터정보공학부 <br>
			<a href="https://github.com/namgonkim">Github 홈페이지<br> </a>
			</p>
		</div>
	</div>

</div>

<%@ include file="../includes/footer.jsp" %>