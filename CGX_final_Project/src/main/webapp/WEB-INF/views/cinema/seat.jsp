<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>영화관 좌석 배치</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.css">
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.js"></script>
    <script>
        window.addEventListener("load", function(){
            var tag = document.querySelector(".cinema-wrap");
            var cinema = new Hakademy.Reservation(tag);
        });
    </script>
    <style>
    	.w-70{
    		width:90%;	
    	}
    	article{
    		margin:auto;
		}
    </style>
</head>
<body>
<article class="w-70">
    <form action="${pagecontext.request.contextpath}/com.kh.cgx/pay/kakao/info" method="post">
        <div class="cinema-wrap" data-name="seat" data-rowsize="${rowsize}" data-colsize="${colsize }" style="width:922px;">
            <div class="cinema-screen">스크린</div>
                
                	
             
            <div class="cinema-seat-area" data-rowsize="${rowsize}" data-colsize="${colsize }">
					
					<c:forEach var="list" items="${seatall}">
					<c:choose>
					<c:when test="${list[2]!=0}">
						<div class="cinema-seat" data-row="${list[0]}" data-column="${list[1]}"></div>
					</c:when>
					<c:otherwise>
						<div class="cinema-seat disabled" data-row="${list[0]}" data-column="${list[1]}"></div>
					</c:otherwise>
                		    
					  </c:choose>
				  </c:forEach>
				
				  
				

        </div>
		
		<input type="hidden" value="${movietime_no}" name="movietime_no">
        <input type="submit" value="선택">
          </div>
    </form>


  </article>        
</body>
</html>

