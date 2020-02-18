<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form action="mycgv" method="post">

	<div class="row-right">
	</div> 
	
<main>
	<div class="sect-finder" align="center">
		<label class="hidden">이름</label>
		<h3>${search.member_name}</h3>
		<a href="">포인트</a>
		<br>
		
		
		<a href="">쿠폰</a>
		<br><br><br><br>
	</div>
</main>
	
<article class="w-40">
	<div class="sect-finder" align="center">
		<a href="http://localhost:8080/com.kh.cgx/mypage/reserve">예매 내역</a>
		<a href="http://localhost:8080/com.kh.cgx/mypage/movielog">위시리스트</a>
		<%-- <a href="http://localhost:8080/com.kh.cgx/mypage/movielog/watched?member_no='${search.no}'">내가 본 영화</a> --%>
		<a href="http://localhost:8080/com.kh.cgx/mypage/movielog/watched?member_no=1">내가 본 영화</a>
		<a href="">1:1 문의</a>
		<a href="">my정보관리</a>
	</div>
	
<%-- 	<c:forEach var="ist" items="${list}">
<h5>${ist}</h5>
</c:forEach> --%>

	<h5>${search}</h5>
	

</article>

</form>



