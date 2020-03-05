<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp"></jsp:include> 
 <head>
 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
<!--     <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script> 이거키면 동영상 안켜짐 -->  
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    <script src="path/to/chartjs/dist/Chart.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
 
 </head>

 <style>
 
 .videos{
 padding-left: 43%;
 }
 
 	#allchart{
 	display: inline-flex;
 	height:200px;
 	width: 600px;
 	}
 	
 	.videos img{
        width: 100%;
        height: auto;
    }

a.video{
    float: left;
    position: relative;
}

a.video span{
    width: 100%;
    height: 100%;
    position: absolute;
    background:url("https://t1.daumcdn.net/cfile/tistory/272B024E567617E839") no-repeat;
    background-position: 50% 50%;
    background-size: 20%;
}


 	    



@media screen and {
    a.video span{
        background-size: 20%;
 }
 

.container{
    background-color: #fdfcf0;
}
 
 </style>

 
 <script>


 window.onload = function () {

//동영상 모달 이벤트
	 $(document).on('click', '[data-toggle="lightbox"]', function(event) {
	     event.preventDefault();
	     $(this).ekkoLightbox();
	 });
	 
	 
	 //매력 포인트 그래프 
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


//성별 예매 분포 그래프
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

 
 //연령별 예매 분포
 var optionss = {
     animationEnabled: true,
     title: {
         text: "연령별 예매 분포"
     },
//      axisY: {
         
//          suffix: "%",
//          includeZero: false
//      },
     axisX: {
         title: "연령"
     },
     data: [{
    	 type: "doughnut",
 	    innerRadius: "40%",
 	    showInLegend: true,
 	    legendText: "{label}",
 	    indexLabel: "{label}: #percent%",
         
        
         dataPoints: [
        	
             { label:"10대", y:${age10  == null? 0 : age10 } },
             { label: "20대", y: ${age20  == null? 0 : age20 }},	
             { label: "30대", y:${age30  == null? 0 : age30 } },
             { label: "40대", y:${age40  == null? 0 : age40 } },	
             { label: "50대", y:${age50  == null? 0 : age50 } }
             
          
         ]
     }]
 };
 $("#age-reserv").CanvasJSChart(optionss);
 


 
 }
 

 </script>


 <div class="container" align="center">
    <h1>영화상세</h1>
    <br><br>
    <div class="movie-info">
    	<a href="detail?movie_no=${movieActorVO.movie_no}"><img src="download?files_no=${movieActorVO.files_no }"></a>
        <h3>영화 제목 : ${movieActorVO.movie_title}</h3>
        <h5>${movieActorVO.movie_status}</h5>
        <h5>예매율 ${movieActorVO.movie_ticket_rate}%</h5>
        <h5>감독 : ${movieActorVO.movie_director} / 배우 : ${movieActorVO.actorList} </h5>
        <h5>장르 :  ${movieActorVO.movie_genre} / 기본 :${movieActorVO.movie_grade}, ${movieActorVO.movie_runtime}분, ${movieActorVO.movie_country} </h5>
        <h5>개봉 :  ${movieActorVO.movie_startdate}</h5>
        
        <button class="btn btn-danger">예매</button>
        
        <h2>${movieActorVO.movie_content}</h2>
        
     </div>
     
  
  
  
  
  
  

     <div id="allchart">
		<div id="charm-point" style="height: 200px; width: 100%;"></div>
    	<div id="sex-reserv" style="height: 200px; width: 100%;"></div>
    	<div id="age-reserv" style="height: 200px; width: 100%;"></div>
    	</div>
	<br><br><br>
	
	<!-- 무비 트레일러 시작 -->

	<h1>무비 트레일러</h1>
	
<c:forEach var="info_trailer" items="${info_trailer }">
 <div class="videos">
    <a href=" ${info_trailer.video_link}" data-toggle="lightbox" class="video">
        <span>&nbsp;</span>
         <img src="http://img.youtube.com/vi/${info_trailer.video_id }/maxresdefault.jpg" style="width:240px; height: 135px;">
        </a>
      
    </div>

    </c:forEach>
	<br><br><br><br><br><br>
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
	<c:forEach items="${reviewlist}" var="review">
		${review}
	</c:forEach>
</div>

 

	

 
	<jsp:include page="../footer.jsp"></jsp:include> 


  
