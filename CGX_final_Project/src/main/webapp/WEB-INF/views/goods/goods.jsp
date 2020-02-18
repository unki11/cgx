<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<jsp:include page="../header.jsp"></jsp:include>
</head>

<h1>goods페이지입니다</h1>

<div class="sect-finder" align="center">
		<a href="/com.kh.cgx/goods/categorypage?goods_category=패키지">패키지</a>
		<a href="/com.kh.cgx/goods/categorypage?goods_category=콤보">콤보</a>
		<a href="/com.kh.cgx/goods/categorypage?goods_category=팝콘">팝콘</a>
		<a href="/com.kh.cgx/goods/categorypage?goods_category=음료">음료</a>
		<br><br><br><br>
	</div>
	<c:forEach var="ist" items="${list}">
<h5>${ist}</h5>


</c:forEach>
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
