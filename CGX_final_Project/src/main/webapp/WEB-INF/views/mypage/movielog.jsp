<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp"></jsp:include>
<head>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	/* $(function(){
	 $(".wish").click(function(e){
	 var value = (this).value;
	 console.log(value);
	 $.ajax({
	 url:"deletewish?movie_no="+value,
	 type:"get",
	 dataType :"json",
	 success:function(data){
	 alert(data.message);
	 }
	 });
	 });
	 }); */
</script>
<title>나의 위시리스트</title>
</head>
<!-- 헤더시작 -->


<h1>위시리스트</h1>
<%-- <div>${likemovie }</div> --%>

<c:forEach var="loglist" items="${likemovie}">
	<div>
		<p class="no">${loglist.movie_no}</p>
		<p>${loglist.movie_title}</p>
		
	<a href="${pageContext.request.contextPath}/mypage/movielogdelete?movie_no=${loglist.movie_no}">
	
	<button class="delete" value="${loglist.movie_no}">삭제</button>
	</a>
	</div>

</c:forEach>




<!-- 푸터시작 -->
<footer>
	<jsp:include page="../footer.jsp"></jsp:include>
</footer>