<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1>goods페이지입니다</h1>

<div class="sect-finder" align="center">
		<a href="">패키지</a>
		<a href="">콤보</a>
		<a href="">팝콘</a>
		<a href="">음료</a>
		<br><br><br><br>
	</div>
	<c:forEach var="ist" items="${list}">
<h5>${ist}</h5>
</c:forEach>

