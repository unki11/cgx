<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>영화관 좌석 배치</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.css">
    <style>
    	.cinema-seat:not(.empty){
		    background-image: url("${pageContext.request.contextPath}/resources/image/seat-empty.png");
		}
		.cinema-seat.active{
		    background-image: url("${pageContext.request.contextPath}/resources/image/seat-active.png");
		}
		.cinema-seat.disabled{
		    background-image: url("${pageContext.request.contextPath}/resources/image/seat-disabled.png");
		}
    </style>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.js"></script>
    <script>
        window.addEventListener("load", function(){
            var tag = document.querySelector(".cinema-wrap");
            var cinema = new Hakademy.Reservation(tag);
		});

        
    </script>

</head>
<form action="seatInsert" method="post">
        <div class="cinema-wrap" data-name="seat" data-rowsize="5" data-colsize="15">
            <div class="cinema-screen">스크린</div>

            <div class="cinema-seat-area" data-rowsize="5" data-colsize="15">
				
				<div class="cinema-seat" data-row="1" data-column="1"></div>
                <div class="cinema-seat" data-row="1" data-column="2"></div>
                <div class="cinema-seat" data-row="1" data-column="5"></div>
                <div class="cinema-seat" data-row="1" data-column="6"></div>
                <div class="cinema-seat" data-row="1" data-column="7"></div>
                <div class="cinema-seat" data-row="1" data-column="8"></div>
                <div class="cinema-seat" data-row="1" data-column="9"></div>
                <div class="cinema-seat" data-row="1" data-column="10"></div>
                <div class="cinema-seat" data-row="1" data-column="13"></div>
                <div class="cinema-seat" data-row="1" data-column="14"></div>
                <div class="cinema-seat" data-row="1" data-column="15"></div>
     
				
                <div class="cinema-seat" data-row="2" data-column="1"></div>
                <div class="cinema-seat" data-row="2" data-column="2"></div>
                <div class="cinema-seat" data-row="2" data-column="5"></div>
                <div class="cinema-seat" data-row="2" data-column="6"></div>
                <div class="cinema-seat" data-row="2" data-column="7"></div>
                <div class="cinema-seat" data-row="2" data-column="8"></div>
                <div class="cinema-seat" data-row="2" data-column="9"></div>
                <div class="cinema-seat" data-row="2" data-column="10"></div>
                <div class="cinema-seat" data-row="2" data-column="13"></div>
                <div class="cinema-seat" data-row="2" data-column="14"></div>
                <div class="cinema-seat" data-row="2" data-column="15"></div>    

                <div class="cinema-seat" data-row="3" data-column="1"></div>
                <div class="cinema-seat" data-row="3" data-column="2"></div>
                <div class="cinema-seat" data-row="3" data-column="5"></div>
                <div class="cinema-seat" data-row="3" data-column="6"></div>
                <div class="cinema-seat" data-row="3" data-column="7"></div>
                <div class="cinema-seat" data-row="3" data-column="8"></div>
                <div class="cinema-seat" data-row="3" data-column="9"></div>
                <div class="cinema-seat" data-row="3" data-column="10"></div>
                <div class="cinema-seat" data-row="3" data-column="13"></div>
                <div class="cinema-seat" data-row="3" data-column="14"></div>
                <div class="cinema-seat" data-row="3" data-column="15"></div>

                <div class="cinema-seat" data-row="4" data-column="1"></div>
                <div class="cinema-seat" data-row="4" data-column="2"></div>
                <div class="cinema-seat" data-row="4" data-column="5"></div>
                <div class="cinema-seat" data-row="4" data-column="6"></div>
                <div class="cinema-seat" data-row="4" data-column="7"></div>
                <div class="cinema-seat" data-row="4" data-column="8"></div>
                <div class="cinema-seat" data-row="4" data-column="9"></div>
                <div class="cinema-seat" data-row="4" data-column="10"></div>
                <div class="cinema-seat" data-row="4" data-column="13"></div>
                <div class="cinema-seat" data-row="4" data-column="14"></div>
                <div class="cinema-seat" data-row="4" data-column="15"></div>
                <div class="cinema-seat" data-row="4" data-column="16"></div>
                
            </div>

        </div>

        <input id="btn" type="submit" value="좌석선택">
    </form>
</body>
</html>
                	

        

			
            
            	