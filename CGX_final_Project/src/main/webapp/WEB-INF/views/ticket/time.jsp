<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
	상영 시간표 조회 결과 페이지
--%>
<h1>상영 시간표 조회 결과</h1>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="movieTimeDto" items="${list}">
<h5>${movieTimeDto}</h5>
</c:forEach>




 <!--    	시간 선택 구간 --> 
<!--    		<div class="section time-section"> -->
 <!--    		col-head --> 
<!--     		<div class="col-head"> -->
<!--     			<h3>시간</h3> -->
<!--     		</div> -->
 <!--     	col-body	 --> 
<!--     		<div class="col-body"> -->
<!--     			<div class="time-list"> -->
<%--     			<c:forEach var="movieTimeDto" items="${list}"> --%>
<!--     				<div class="theater"> -->
<%--     					<span class="screen-type">${timeList.screen_type }</span> --%>
<%--     					<span class="screen-name">${timeList.screen_name }</span> --%>
<%--     					<span class="seat-count">${timeList.screen_all_seat }</span> --%>
    					
<!--     					<ul> -->
<!--     						<li> -->
<!--     							<span class="time"> -->
<%--     								<span>${timeList.movie_hour}</span> --%>
<!--     							</span> -->
    						
<!--     						</li> -->
<!--     					</ul> -->
<!--     				</div> -->
<%--     			</c:forEach> --%>
<!--     			</div> -->
<!--     		</div> -->
<!--    		</div> -->