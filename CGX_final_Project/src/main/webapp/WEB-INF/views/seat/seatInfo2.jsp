<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>영화관 좌석 배치</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.min.css">
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.min.js"></script>
    <script
	  src="https://code.jquery.com/jquery-3.4.1.min.js"
	  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  crossorigin="anonymous"></script>
    <script>
        window.addEventListener("load", function(){
            var tag = document.querySelector(".cinema-seat-area");
            var cinema = new Hakademy.Reservation(tag);
        });
        
        function fnReservation(){
        	var chkSeat = '';
        	var list = new Array();
        	
        	$('input:checkbox[name="seat"]:checked').each(function(index){
        		if(index > 0){
        			chkSeat += ',';
        		}
        		chkSeat += $(this).val();
        	})
        		list.push($(chkSeat).val());
        	
        	console.log(chkSeat);
        	$('#chkSeat').val(chkSeat);
        	console.log('formData : ', formData);
        	
        	//예매, 예매좌석 데이터 넣기.
        	var formData = {"chkSeatList":chkSeat, "ticket_no": $('#ticket_no').val()};
        	$.ajax({
				url:"seatInsert",
				type:"post",
				data:formData,
				success:function(resp){
					console.log("성공")
				}
			})
        }	
    </script>

</head>
<body>
    <form action="seatInsert" method="post" id="seatForm">
    	<input type="hidden" name="chkSeat" id="chkSeat">
    	<input type="hidden" name="ticket_no" id="ticket_no" value="1">
        <div class="cinema-seat-area" data-rowsize="4" data-colsize="13">
        <div class="cinema-screen"></div>
            
            <c:set var="tempGroupRow" value="" />
            <c:forEach items="${seatList}" var="list" varStatus="status">
            	<c:if test="${list.seat_row != tempGroupRow }">
            		<!-- 첫번째 row는 닫으면 안되기때문에 통과, 2번째row부터는 닫고 시작 -->  
            		<c:if test="${status.index > 0}">
            			</div>
            		</c:if>
            		<!-- row div열기 -->
		        	<div class="cinema-seat-row" data-row="${list.seat_row }">
            	</c:if>
            	<!-- col div 그리기 -->
	            <div class="cinema-seat
	            	<c:if test="${list.reservationYn == 1 }">
	            		 disabled
	            	</c:if>"
	            	data-column="${list.seat_col}"></div>
	            
	            <!-- col div 그리기 -->
	            <c:set var="tempGroupRow" value="${list.seat_row }" />
           	</c:forEach>
         	
        </div>
		<!-- <button onclick="fnReservation();">예매하기</button> -->
        <input type="submit" onclick="fnReservation();" value="예매하기" placeholder="예매하기">
    </form>
</body>
</html>
