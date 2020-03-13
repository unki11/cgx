<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<style>
	.container{
		text-align: center;
		width: 300px;
	}
	
	body{
		background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
		
	}
	
	.list-group-item{
		background-color: #efe4b0;
	}
</style>

<title>예매내역</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>
		<!-- 헤더시작 -->
	
	

<body>
<!-- <h1 style="text-align: center;">예약확인 페이지입니다</h1> -->

	
<%--   	 <c:forEach var="ticketVO" items="${ticketlist}">
	  	<div>
		 	<span>예매번호${ticketVO.ticket_no}</span><br>
		     <span>예매날짜</span><br> 
		     <span>사진  <img src="${pageContext.request.contextPath}/resources/img/${files_no}" alt="..."></span><br>
		     <span>제목${ticketVO.movie_title}</span><br>
		     <span>극장${ticketVO.screen_name}</span><br>
		     <span>영화의 시작시간${ticketVO.movietime_time}</span><br>
		     <span>관람좌석${ticketVO.movie_title}</span><br>
		     <span>인원수${ticketVO.ticket_total_person}</span><br>
     	</div>
      </c:forEach> --%>
      <div class="container" style="text-align: center;">
    	<h2 style="text-align: center;">예매 내역입니다.</h2>
    		<c:forEach var="ticketVO" items="${ticketlist}">
    			<div class="card" style="width: 500px;display: initial;">
        		<img class="card-img-top" src="${pageContext.request.contextPath}/download/img?files_no=${ticketVO.files_no}" style="width: 400px;height: 570px;">
        		<div class="card-body">
	            	<h4 class="card-title">예매번호: ${ticketVO.ticket_no}</h4>
	            	<p class="card-text">예매날짜</p>
	            	<p class="card-text">제목: ${ticketVO.movie_title}</p>
	            	<p class="card-text">극장: ${ticketVO.screen_name}</p>
	            	<p class="card-text">영화시작시간: ${ticketVO.movietime_time}</p>
	            	<p class="card-text">관람좌석: ${ticketVO.movie_title}</p>
	            	<p class="card-text">인원수: ${ticketVO.ticket_total_person}</p>
	            	<p class="card text-white bg-danger mb-3">확인하세요.</p>
	            	<a href="${pageContext.request.contextPath }/movie/review?ticket_no=${ticketVO.ticket_no}"><button class="btn">리뷰쓰기</button></a>
        		</div>
    			</div>
    		</c:forEach>
	</div>

</body>
     <!-- 푸터시작 -->
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
      
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/small-business.css">
      
      

      
      
      
     