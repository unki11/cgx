<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
window.onload = function() {
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	animationEnabled: true,
	title: {
		text: "Letter Frequency of Vowels in English"
	},
	axisX: {
		labelFontSize: 18
	},
	axisY: {
		title: "Frequency",
		suffix: "%"
	},
	data: [{
		type: "column",
		indexLabel: "{y}",
		indexLabelFontSize: 18,
		yValueFormatString: "#,##0.0#\"%\""
	}]
});
 
function addData(data) {
	chart.options.data[0].dataPoints = data;
	chart.render();
}
 
$.getJSON("/CanvasJS_Spring_MVC_Charts/restfull-service/letter-frequency-of-vowels-in-english.json", addData);
 
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

       
   
    
        
        


  