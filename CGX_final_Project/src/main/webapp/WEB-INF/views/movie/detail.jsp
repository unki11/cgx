<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
 <script src="path/to/chartjs/dist/Chart.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
 
 <head>
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
}
]
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
		    { label: "남자", y: 649291 },
		    { label: "여자", y: 900000 }
	    ]
}]
};
 $("#sex-reserv").CanvasJSChart(options);

 var options = {
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
 $("#age-reserv").CanvasJSChart(options);
 

 }
 </script>


 </head>
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
    	<div id="age-reserv" style="height: 200px; width: 100%;"></div></div>
	</div>
  