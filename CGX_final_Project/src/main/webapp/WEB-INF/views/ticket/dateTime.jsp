<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <head>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
 	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    
    </head>
    
    <script type='text/javascript'>
	
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
		    title: "테스트",	//캘린더 상단에 보여주는 타이틀
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




 	<!--날짜 선택 구간  -->
 		<h3>날짜</h3>
 		
 		<form action="step_time" method="get">
<%--  		<c:forEach var="dateDto" items="${list}"> --%>
    <input type="hidden" name="movie_no" value="${param.movie_no}">
    <input type="hidden" name="cinema_no" value="${param.cinema_no}">

    <input type="date" id="datePicker" class="form-control" name="date">
    <input type="submit">
<%--      </c:forEach>  --%>
</form>
 		
 		
 		
 		
 		
   		

 			 
<%--  			<c:forEach var="dateDto" items="${list}"> --%>
<%--    		  <a href="step_time?movie_no=${dateDto.movie_no}&cinema_no=${dateDto.cinema_no}&date=${dateDto.date}"> --%>
<%--  	 </c:forEach>  --%>
   		
<!--  	 </a> -->
   		

   		
   		
   		

       	  
  
   		




