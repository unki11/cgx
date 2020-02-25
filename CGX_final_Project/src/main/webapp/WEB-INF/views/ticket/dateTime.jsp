<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <head>
     <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<link rel="stylesheet" href="/css/jquery-ui.min.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
 	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
	<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
    </head>
    
    <script type='text/javascript'>

$(function(){

    $('.input-group.date').datepicker({

        calendarWeeks: false,

        todayHighlight: true,

        autoclose: true,

        format: "yyyy/mm/dd",

        language: "kr"

    });



});


;(function($){
$.fn.datepicker.dates['kr'] = {
    days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
    daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
    daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
    months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
};
}(jQuery));
</script>




 	<!--날짜 선택 구간  -->
   		<div class="section date-section">
   		<!-- col-head -->
    		<div class="col-head">
    			<h3>날짜</h3>
    		</div>
    	<!-- col-body -->	
    		<div class="col-body">
    	<!-- 날짜 선택 -->
    			<div class="input-group date">
    				<input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
    			</div>
    		</div>
   		</div>
   		
   	<!-- 시간 선택 구간 -->
   		<div class="section time-section">
   		<!-- col-head -->
    		<div class="col-head">
    			<h3>시간</h3>
    		</div>
    	<!-- col-body -->	
    		<div class="col-body">
    			<div class="time-list">
    			<c:forEach var="timeList" items="${timeList }">
    				<div class="theater">
    					<span class="screen-type">${timeList.screen_type }</span>
    					<span class="screen-name">${timeList.screen_name }</span>
    					<span class="seat-count">${timeList.screen_all_seat }</span>
    					
    					<ul>
    						<li>
    							<span class="time">
    								<span>${timeList.movie_hour}</span>
    							</span>
    						
    						</li>
    					</ul>
    				</div>
    			</c:forEach>
    			</div>
    		</div>
   		</div>




