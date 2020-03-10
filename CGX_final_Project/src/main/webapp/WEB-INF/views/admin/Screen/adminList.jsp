<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
<script>
	$(document).ready(function(){
		$(".delete").click(function(){
			var screenno = $(this).parent().find(".no").text();
			
			$.ajax({
				url:"adminDelete?no="+screenno,
				type:"get",
				success:function(resp){
					consloe.log("성공")
					window.location.reload(true);
				}
			})
		})
	});
</script>
<style>
	body{
		background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
		text-align: center;
	}
	.row {
      margin-bottom: 10px;
    }
</style>
<%-- <h1>상영관 조회 페이지</h1>

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
</c:forEach> --%>

<html>
<body>
	
    <div class="container">
       <div class="row">
        <!-- <div class="col-12"> -->
          <div class="col">
          <h2>상영관 목록 페이지</h2>
          <a class="underlineHover" href="/com.kh.cgx/admin/adminList">
             <input class="btn btn-info" value="관리자메인화면가기">
          </a>
          <ul class="list-group">
          <c:forEach var="screenDto" items="${list}">
	          <div>
	          	<ul type="square">
		            <li class="no list-group-item-danger active">${screenDto.screen_no}</li>
		            <li class="list-group">극장: ${screenDto.cinema_no}</li>
		            <li>전체좌석 :${screenDto.screen_all_seat}</li>
		            <li>상영관 종류 :${screenDto.screen_type}</li>
		            <li>상영관 이름 :${screenDto.screen_name}</li>
		            <li>상영관 줄 :${screenDto.screen_rowsize}</li>
		            <li>상영관 칸 :${screenDto.screen_colsize}</li>
		            <button class="delete btn btn-danger">삭제</button>
		        </ul>    
		            <br>
	           </div>
           </c:forEach>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>
