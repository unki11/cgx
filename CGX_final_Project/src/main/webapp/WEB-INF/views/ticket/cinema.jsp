<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
   <jsp:include page="../header.jsp"></jsp:include> 
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
        
        
         
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
.list-group-item:first-child {
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    background-color: #F2F0E5;
    color: black;
}

.list-group-item:last-child {
    margin-bottom: 0;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
    background-color: #F2F0E5;
    color: black;
}
body{
background-color: #fcfcf0;
}
 .steps {
    position: relative;
    width: 996px;
    background-color: #F2F0E4;
}
body, input, select, textarea, header, footer {
    color: #333;
    font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
    font-size: 12px;
    font-weight: normal;
}
.section-theater {
   width: 498px;
    height: 528px;
    position: relative;
    float: left;
    height: 100%;
    margin-left: 2px;
    background-color: #f2f0e5;
    overflow: hidden;
    display: inline-block;
}
.section-theater >.col-head {
    background-position: 50% -25px;
    background-image: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/titles.png);
    background-repeat: no-repeat;
    position: relative;
    height: 33px;
    line-height: 33px;
    text-align: center;
    background-color: #333333;
}
.sreader {
    display: block;
    position: absolute;
    left: -10000px;
}
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, button, select {
    margin: 0;
    padding: 0;
    border: 0;
}
h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.section-theater>.col-body {
    width: 100%;
    position: relative;
    overflow: hidden;
    height: 560px;
    
}
.theater-select {
    float: left;
    width: 235px;
    height: 364px;
    margin-left: 20px;
    margin-top: 8px;
    height: 429px;
}
#container {
    position: relative;
    margin: 0 auto;
    width: 996px;
    z-index: 1;
    padding: 0 140px;
   
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
body{
background-color: #fcfcf0;
}
.select-date{
    margin-top: 30px;
    margin-bottom: 60px;
    width: 716px;
    height: 595px;
 
}
 .step-time{
 width:450px;
 }
 .btn-danger{
 margin-top: 30px;
 float: right;
 }
 .steps {
     margin-top: 30px;
    margin-bottom: 30px;
    position: relative;
    width: 996px;
    background-color: #F2F0E4;
}
body, input, select, textarea, header, footer {
    color: #333;
    font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
    font-size: 12px;
    font-weight: normal;
}
 .section-date {
    width: 494px;
    height: 528px;
    position: relative;
    float: left;
    height: 100%;
    margin-left: 2px;
    background-color: #f2f0e5;
    overflow: hidden;
    display: inline-block;
}
 .section-date>.col-head {
    background-position: 50% -58px;
    background-image: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/titles.png);
    background-repeat: no-repeat;
    position: relative;
    height: 33px;
    line-height: 33px;
    text-align: center;
    background-color: #333333;
}
.sreader {
    display: block;
    position: absolute;
    left: -10000px;
}
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, button, select {
    margin: 0;
    padding: 0;
    border: 0;
}
h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.section-date .col-body {
    width: 100%;
    position: relative;
    overflow: hidden;
    height: 560px;
}
#ticket .steps .step1 {
    height: 530px;
    background-color: #d4d3c9;
}
#ticket .steps .step {
    position: relative;
}
.time-wrap{
	width:950px;
	height: 300px
	
}
    </style>
   
   
        <script type='text/javascript'>

        $(function(){
        	
        	$('.alink').on('click',function(e){
        		e.preventDefault();
        		var href = $(this).attr("href");
//         				console.log(href);
        		
        				$.ajax({
        					url:"${pageContext.request.contextPath}/ticket/"+href,
        					type:"get",
        					success:function(no){
        						location.href="${pageContext.request.contextPath}/ticket/"+href;
        					}
        				})
       		});
        	
        	
        	$('.btn').on('click',function(e){
            		e.preventDefault();
            		var formData = $(".step-time").serialize();

            	

        			//ajax를 이용해서 /ticket/stepDateTime 을 불러온다.
        			//- 준비물 : movie_no, cinema_no
        			//var href = $(this).attr("href");//href 속성을 불러온다.
        			$.ajax({
        				url:"${pageContext.request.contextPath}/ticket/step_time",
        				type:"get",
        				data:formData,
        				success:function(page){
        					$(".time-wrap").html(page);
        				}
        			});
           		});
        	
        	
        	
        });
        
        
        
        
        
$(function(){

	
		$('#datePicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '-0',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+7d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    // datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		    // daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    // daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    // multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    // multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
// 		    title: "테스트",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "kr"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
         

		})
		
		.on("changeDate", function(e) {
                 //이벤트의 종류
                 //show : datePicker가 보이는 순간 호출
                 //hide : datePicker가 숨겨지는 순간 호출
                 //clearDate: clear 버튼 누르면 호출
                 //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 
                 //changeMonth : 월이 변경되면 호출
                 //changeYear : 년이 변경되는 호출
                 //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
					var date =  $('#datePicker').val();
                    
					console.log(date);

                });
                
		$("#datePicker").datepicker('setDate', new Date); // 오늘 날짜 넣기


                 
            });//datepicker end


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

 
    <div class="container">
    
    	<div class="steps">
    	 <div class="step step1" style="height: 300px; display: block;">
    		<div class="section section-theater">
	   			<!-- col-head -->
	    		<div class="col-head">
	    			<h3 class="sreader">극장</h3>
	    		</div>
	    		
	    		<div class="col-body">
	    			<!-- col-body -->
		    		<div class="theater-select">
		    			<div class="row">
		    				<div class="col-12">
		    					<h1>극장 선택</h1>
		    							<ul class="list-group area-list">
		    								<c:forEach  var="areaList" items="${areaList}">
		    								<li class="list-group-item list-group-item-warning">
		    									${areaList.name }
		    									<ul class="list-group-item list-group-item-warning">
		    									<c:forEach  var="cinemaDto" items="${areaList.list}">
		    									 	
		    										 <li class="list-group-item list-group-item-warning">
		    										 	<a class="alink" href="stepCinema?movie_no=${areaList.movie_no}&cinema_no=${cinemaDto.cinema_no}">
		    										 		${cinemaDto.cinema_area }
		    										 	</a>
		    										 </li>
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
	    			

	    			
<div class="section section-date">
	<div class="col-head">
				<h3 class="sreader">날짜</h3>
	</div>
			
		<div class="col-body">
 			<!--날짜 선택 구간  -->
 		
 			<div class="select-date">
 		
 		<form action="step_time" method="get" class="step-time">
<%--  		<c:forEach var="dateDto" items="${list}"> --%>
    			<input type="hidden" name="movie_no" value="${param.movie_no}">
   				<input type="hidden" name="cinema_no" value="${param.cinema_no}">
				<input type="text" id="datePicker" class="form-control" name="date">
    			<input type="submit" class="btn btn-danger" value="선택">
<%--      </c:forEach>  --%>
		</form>
 		</div>
 	</div>		
 		
 		</div>
	    		</div>	
	    			<div class="time-wrap"></div>
	    		
	    			</div>
	    			
	    			
    				</div>	
	    		
   		
	<jsp:include page="../footer.jsp"></jsp:include> 
	
	
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
	
	
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> -->
<!-- 	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/> -->
<!--     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css"> -->
<!--     <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--  	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
<!-- 	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script> -->
<!-- 	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script> -->
    