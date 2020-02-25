<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
    
     <style>
        * {
            box-sizing: border-box;
        }

        .area-list {
            list-style: none;
            margin: 0;
            padding: 0;
            display: inline-block;
            width: 150px;
        }

        .area-list>li {
            background-color: black;
            color: white;
            padding: 15px;
            cursor: pointer;
        }

        .area-list li:hover {
            background-color: gray;
            color: black;
        }

        /*        2차이상의 메뉴 스타일*/
        .area-list ul {
            list-style: none;
            margin: 0;
            padding: 0;
            position: absolute;
            margin-left: 135px;
            margin-top: -36px;
            /*            2차 이상의 메뉴는 처음에 숨김*/
            display: none;
        }

        .area-list ul>li {
            background-color: black;
            color: white;
            padding: 15px;
            width: 150px;
        }

        /*        메뉴를 표시하는 방법*/
        /*        1. hover
            2. checked    
        */
        .area-list li:hover>ul {
            display: block;
        }


        /*        
        overflow 설정 (넘침설정)
        숨김 처리 + 줄바꿈 금지 + 말줄임표 설정
        */
        .custom-list li {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis
        }

    </style>
    
    
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
    
    
    
    
    <!--전체 예매 순서  -->
<div class=steps>

	<!-- 전체 예매중 1단계 (영화,극장,날짜,시간 선택) -->
    <div class="step1">
    
    <!--영화 선택 구간  -->
    	<div class="section movie-section">
    	<!-- col-head -->
    		<div class="col-head">
    			<h3>영화</h3>
    		</div>
    	<!-- col-body -->	
    		<div class="col-body"></div>
    			<div class="movie-select">
    				<ul>
    				<c:forEach var="titleList" items="${titleList }">
  	  					<li>${titleList.movie_title }</li>
  	  				</c:forEach>
   					</ul>
    			</div>
   		</div>
   		
   	<!--극장 선택 구간  -->
   		<div class="section theater-section">
   		<!-- col-head -->
    		<div class="col-head">
    			<h3>극장</h3>
    		</div>
    	<!-- col-body -->
    		
    		<div class="col-body">
    			<div class="theater-select">
    				<div class="theater-list">
    					<div	class="theater-area-list">
    						<ul class="area-list">
    							<c:forEach  var="areaList" items="${areaList}">
    							<li>
    								${areaList.name }
    								<ul>
    								<c:forEach  var="cinemaDto" items="${areaList.list}">
    									<li>${cinemaDto.cinema_area }</li>
    								</c:forEach>
    								</ul>
    							</li>	
    							</c:forEach>
    						</ul>
    					</div>		
    				</div>
    			</div>
    		</div>
    		
   		</div>
   		
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
    							
    							<span class="count">199석</span>
    						</li>
    					</ul>
    				</div>
    			</c:forEach>
    			</div>
    		</div>
   		</div>
   		
   </div>
</div>