<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h1>movie페이지입니다</h1>

<div id="contents">
	<div class="movie-chart">
		<div class="movie-chart-title">
			<h3>무비차트</h3>
			<div class="submenu">
				<ul>
					<li class="Expected-movie">
						<a href="/movie/" title="선택">무비차트</a>
					</li>
					
					<li>
						<a href="/movie/pre-movie">상영예정작</a>
					</li>
				</ul>
			</div>
		</div>
		
	</div>
</div>



<c:forEach var="list" items="${list }">

<h5>${list }</h5>

</c:forEach>



