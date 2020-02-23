<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
 <script src="path/to/chartjs/dist/Chart.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
 </head>

 <style>
 	#allchart{
 	display: inline-flex;
 	height:200px;
 	width: 600px;
 	}
 
 </style>

 
 <script>
 window.onload = function () {
 
     var chart = new CanvasJS.Chart("charm-point",
{
title:{
text: "Adding dataPoints"  
},
data: [
{        
 type: "column",
 dataPoints: [
     { label: "감독연출", y: 89 },	
     { label: "스토리", y: 91 },	
     { label: "영상미", y: 77 },
     { label: "배우연기", y: 85 },	
     { label: "ost", y: 90 }

 ]
}]
});

chart.render();

 var options = {
 animationEnabled: true,
 title: {
	text: "성별 예매 분포도"
 },
 data: [{
	    type: "doughnut",
	    innerRadius: "40%",
	    showInLegend: true,
	    legendText: "{label}",
	    indexLabel: "{label}: #percent%",
	    dataPoints: [
		    { label: "남자", y: ${man}} ,
		    { label: "여자", y: ${woman}}
   ]  
}]
};
 $("#sex-reserv").CanvasJSChart(options);

 var optionss = {
     animationEnabled: true,
     title: {
         text: "연령별 예매 분포"
     },
     axisY: {
         
         suffix: "%",
         includeZero: false
     },
     axisX: {
         title: "연령"
     },
     data: [{
         type: "column",
         indexLabel: "{y}%",
         indexLabelPlacement: "outside",
         indexLabelOrientation: "horizontal",
         yValueFormatString: "###"%"",
        
         dataPoints: [
             { label: "10대", y: 21 },	
             { label: "20대", y: 34 },	
             { label: "30대", y: 32.7 },
             { label: "40대", y: 6.1 },	
             { label: "50대", y: 6.2 }
             
         ]
     }]
 };
 $("#age-reserv").CanvasJSChart(optionss);
 

 
 }
 </script>



 <div id="info-all" align="center">
    <h1>상세정보</h1>
    <br><br>
    <div class="movie-info">
    	<a href="detail?movie_no=${movieActorVO.movie_no}"><img src="download?files_no=${movieActorVO.files_no }"></a>
        <h3>영화 제목 : ${movieActorVO.movie_title}</h3>
        <h5>${movieActorVO.movie_status}</h5>
        <h5>예매율 ${movieActorVO.movie_ticket_rate}%</h5>
        <h5>감독 : ${movieActorVO.movie_director} / 배우 : ${movieActorVO.actorList} </h5>
        <h5>장르 :  ${movieActorVO.movie_genre} / 기본 :${movieActorVO.movie_grade}, ${movieActorVO.movie_runtime}분, ${movieActorVO.movie_country} </h5>
        <h5>개봉 :  ${movieActorVO.movie_startdate}</h5>
        
        <h2>${movieActorVO.movie_content}</h2>
        
     </div>
     
  
  
  
  
  
  

     <div id="allchart">
		<div id="charm-point" style="height: 200px; width: 100%;"></div>
    	<div id="sex-reserv" style="height: 200px; width: 100%;"></div>
    	<div id="age-reserv" style="height: 200px; width: 100%;"></div>
    	</div>
	<br><br><br>
	
	<!-- 무비 트레일러 시작 -->
	<div>
	<h1>무비 트레일러</h1>
	   <c:forEach var="info_trailer" items="${info_trailer }">
  			<h1>${info_trailer.movie_title}</h1>
  <div>
  	
	<iframe height="200" width="200" src="${info_trailer.video_link}" frameborder="0"></iframe>
	
</div>
	</c:forEach>
	</div>
	<!-- 무비 트레일러 끝 -->
	<br><br><br>
	
	<!-- 이미지 슬라이드 시작 -->
	<h1>스틸컷 !!!</h1>
	<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" style="width: 900; height: 450px" >
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		  	<c:forEach var="stillcut" items="${info_stillcut}" varStatus="status">
		  		<c:choose>
		  			<c:when test="${status.first}">
					    <li data-target="#myCarousel" data-slide-to="${status.index}" class="active"></li>
		  			</c:when>
		  			<c:otherwise>
					    <li data-target="#myCarousel" data-slide-to="${status.index}"></li>
		  			</c:otherwise>
		  		</c:choose>
		    </c:forEach>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" style="width: 850px; height: 450px">
		  	<c:forEach var="stillcut" items="${info_stillcut}" varStatus="status">
		  		<c:choose>
		  			<c:when test="${status.first}">
					    <div class="item active" style="width: 800px; height: 450px">
					      <img src="download?files_no=${stillcut.files_no }" alt="stillcutActive" style="width: 320px ; height: 450px;">
					    </div>
		  			</c:when>
		  			<c:otherwise>
					    <div class="item" style="width: 800px; height: 450px">
					      <img src="download?files_no=${stillcut.files_no }" alt="stillcut" style="width: 320px ; height: 450px;">
					    </div>
		  			</c:otherwise>
		  		</c:choose>
			</c:forEach>
		  </div> 
		
		  <!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- 이미지 슬라이드 종료 -->
	
	<br><br><br><br><br><br><br><br><br><br>
</div>
	
	


  
