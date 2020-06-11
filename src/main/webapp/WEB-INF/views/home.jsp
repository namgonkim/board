<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>스프링 웹 페이지 개발</title>
</head>
<body>
<h4>이클립스 - 스프링 프레임워크 </h4>
<h4>아파치 톰캣 9.0</h4>
<h4>MySQL 8.0.2x </h4>

<P>  The time on the server is ${serverTime}. </P>
<P> <a href="/board/list"> * 게시물 목록</a></P>
<P> <a href="/board/listPage?num=1"> * 게시물 목록(페이징)</a></P>

</body>
</html>
