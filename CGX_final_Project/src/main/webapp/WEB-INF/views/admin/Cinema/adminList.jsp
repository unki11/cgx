<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$(".delete").click(function(){
			var cinemano = $(this).parent().find(".no").text();
			
			$.ajax({
				url:"adminDelete?no="+cinemano,
				type:"get",
				success:function(resp){
					console.log("성공")
				}
			})
		})
	});

</script>

<h1>극장 리스트 페이지</h1>

<c:forEach var="cinemaDto" items="${list}">
	<div>
		<p class="no">${cinemaDto.cinema_no}</p>
		<%-- <p>${cinemaDto.files_no}</p> --%>
		<img src="${pageContext.request.contextPath}/admin/download?files_no=${cinemaDto.files_no}">
		<p>${cinemaDto.cinema_area}</p>
		<p>${cinemaDto.cinema_phone}</p>
		<p>${cinemaDto.cinema_addr}</p>
		
		<button class="delete">삭제</button>
	</div>

</c:forEach>