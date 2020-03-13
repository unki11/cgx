<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    		width:70%;	
    	}
    	article{
    		margin:auto;
		}
		body{
		background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
		text-align: center;
	}
    </style>
</head>
<body>
	<article class="w-70">
    <form action="screeninsert" method="post">
        <div class="cinema-wrap" data-name="seat" data-rowsize="${rowsize}" data-colsize="${colsize }" style="width:922px;">
            <div class="cinema-screen">스크린</div>
                
                	
             
            <div class="cinema-seat-area" data-rowsize="${rowsize}" data-colsize="${colsize }">
					
					<c:forEach var="list" items="${seatall}">
						<div class="cinema-seat" data-row="${list[0]}" data-column="${list[1]}"></div>
                		    
				  </c:forEach>
				
				  
				

        </div>
		
		<input type="hidden" value="${screen_no}" name="screen_no">
        <input type="submit" value="선택" width="200px" height="100px">
          </div>
    </form>


  </article>        
</body>
</html>