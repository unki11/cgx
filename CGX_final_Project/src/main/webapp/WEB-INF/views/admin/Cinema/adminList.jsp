<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
<style>
		body{
			background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
			text-align: center;
		}
		.row {
      		margin-bottom: 10px;
    	}
</style>
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
<%-- <h1>극장 리스트 페이지</h1>

<c:forEach var="cinemaDto" items="${list}">
	<div>
		<p class="no">${cinemaDto.cinema_no}</p>
		<p>${cinemaDto.files_no}</p>
		<img src="${pageContext.request.contextPath}/admin/download?files_no=${cinemaDto.files_no}">
		<p>${cinemaDto.cinema_area}</p>
		<p>${cinemaDto.cinema_phone}</p>
		<p>${cinemaDto.cinema_addr}</p>
		
		<button class="delete">삭제</button>
	</div>

</c:forEach> --%>

<html>
<body>
    <div class="container">
      <div class="row">
        <div class="col">
          <h1>극장 목록</h1>
          <ul class="list-group">
          <c:forEach var="cinemaDto" items="${list}">
	          <div>
	          	<ul type="square">
		            <li class="no list-group-item-danger active">${cinemaDto.cinema_no}</li>
		            <li class="list-group-item">${cinemaDto.files_no}</li>
		            <li>${cinemaDto.cinema_area}</li>
		            <li>${cinemaDto.cinema_phone}</li>
		            <li>${cinemaDto.cinema_addr}</li>
		            <button class="delete">삭제</button>
		         </ul>   
	           </div>
           </c:forEach>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>