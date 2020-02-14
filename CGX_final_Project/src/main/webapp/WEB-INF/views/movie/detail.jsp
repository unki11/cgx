<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script>
window.onload = function () {

var options = {
	animationEnabled: true,
	title: {
		text: "GDP Growth Rate - 2016"
	},
	axisY: {
		title: "Growth Rate (in %)",
		suffix: "%",
		includeZero: false
	},
	axisX: {
		title: "Countries"
	},
	data: [{
		type: "column",
		yValueFormatString: "#,##0.0#"%"",
		dataPoints: [
			{ label: "Iraq", y: 10.09 },	
			{ label: "Turks & Caicos Islands", y: 9.40 },	
			{ label: "Nauru", y: 8.50 },
			{ label: "Ethiopia", y: 7.96 },	
			{ label: "Uzbekistan", y: 7.80 },
			{ label: "Nepal", y: 7.56 },
			{ label: "Iceland", y: 7.20 },
			{ label: "India", y: 7.1 }
			
		]
	}]
};
$("#chartContainer").CanvasJSChart(options);

}
</script>


    <h1>상세정보</h1>
    <br><br>
    	<a href="detail?movie_no=${movieActorVO.movie_no}"><img src="download?files_no=${movieActorVO.files_no }"></a>
        <h3>영화 제목 : ${movieActorVO.movie_title}</h3>
        <h5>${movieActorVO.movie_status}</h5>
        <h5>예매율 ${movieActorVO.movie_ticket_rate}%</h5>
        <h5>감독 : ${movieActorVO.movie_director} / 배우 : ${movieActorVO.actorList} </h5>
        <h5>장르 :  ${movieActorVO.movie_genre} / 기본 :${movieActorVO.movie_grade}, ${movieActorVO.movie_runtime}분, ${movieActorVO.movie_country} </h5>
        <h5>개봉 :  ${movieActorVO.movie_startdate}</h5>
        
        <h2>${movieActorVO.movie_content}</h2>
     
		<div id="chartContainer" style="height: 370px; width: 100%;"></div>
       
   
    
        
        


  