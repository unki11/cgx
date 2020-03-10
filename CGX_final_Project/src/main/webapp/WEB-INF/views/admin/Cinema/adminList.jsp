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
					window.location.reload(true);
				}
			})
		})
	});

</script>

<html>
<body>
    <div class="container">
      <div class="row">
        <div class="col">
          <h2>극장 목록</h2>
          <a class="underlineHover" href="/com.kh.cgx/admin/adminList">
             <input class="btn btn-info" value="관리자메인화면가기">
          </a>
          <ul class="list-group">
          <c:forEach var="cinemaDto" items="${list}">
	          <div>
	          	<ul type="square">
		            <li class="no list-group-item-danger active">${cinemaDto.cinema_no}</li>
		            <li class="list-group-item">${cinemaDto.files_no}</li>
		            <li>${cinemaDto.cinema_area}</li>
		            <li>${cinemaDto.cinema_phone}</li>
		            <li>${cinemaDto.cinema_addr}</li>
		            <button class="delete btn btn-danger">삭제</button>
		         </ul>   
	           </div>
           </c:forEach>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>