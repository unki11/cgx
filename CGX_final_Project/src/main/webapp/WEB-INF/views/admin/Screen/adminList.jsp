<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$(".delete").click(function(){
			var screenno = $(this).parent().find(".no").text();
			
			$.ajax({
				url:"adminDelete?no="+screenno,
				type:"get",
				success:function(resp){
					consloe.log("성공")
				}
			})
		})
	});
</script>
<h1>상영관 조회 페이지</h1>

<c:forEach var="screenDto" items="${list}">
	<div>
		<p class="no">${screenDto.screen_no}</p>
		<P>${screenDto.cinema_no}</P>
		<p>${screenDto.screen_all_seat}</p>
		<p>${screenDto.screen_type}</p>
		<p>${screenDto.screen_name}</p>
		<p>${screenDto.screen_rowsize}</p>
		<p>${screenDto.screen_colsize}</p>
		
		<button class="delete">삭제</button>
	</div>
</c:forEach>