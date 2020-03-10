<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	상영 시간표 조회 결과 페이지
--%>
<style>
 .section-time .col-body.theater:first-child {
    margin-top: 0px;
}
 .col-body .theater {
    float: left;
    width: 306px;
    border-bottom: solid 2px #cfcdc3;
    margin-top: 16px;
    overflow: hidden;
}
body, input, select, textarea, header, footer {
    color: #333;
    font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
    font-size: 12px;
    font-weight: normal;
}
.name {
    color: #b54d15;
    font-size: 12px;
    font-weight: bold;
    margin-right: 6px;
}
.floor {
    color: #333;
    font-size: 12px;
    font-weight: bold;
    margin-right: 5px;
}
.seatcount {
    color: #666;
    font-size: 12px;
}

.theater ul {
    width: 309px;
    margin-top: 10px;
    margin-bottom: 6px;
    overflow: hidden;
    list-style: none;
}
dl, ul, ol {
    list-style: none;
}
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, button, select {
    margin: 0;
    padding: 0;
    border: 0;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.theater ul li {
    position: relative;
    float: left;
    height: 25px;
    line-height: 25px;
    padding-bottom: 9px;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.theater ul li a {
    display: block;
    vertical-align: middle;
    width: 103px;
    height: 25px;
}
a:link, a:active {
    text-decoration: none;
}
.button {
    display: inline;
    border: none;
    padding: 0 0;
    background: none;
    white-space: nowrap;
    vertical-align: baseline;
    text-align: center;
    cursor: pointer;
    text-decoration: none;
    -webkit-user-drag: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

a {
    text-decoration: none;
    text-overflow: ellipsis;
    -o-text-overflow: ellipsis;
    color: #333;
}
 .theater ul li a span.time {
    width: 49px;
    height: 23px;
    line-height: 23px;
    border: 1px solid #d6d3ce;
    background-image: none;
    background-color: #f2f0e5;
}

 .theater ul li a span.time {
    float: left;
    width: 51px;
    height: 25px;
    line-height: 25px;
    color: #333;
    font-size: 12px;
    font-weight: bold;
    font-family: Verdana;
/*     background: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step1/timelist_item_none.png) no-repeat; */
}
 .theater ul li a span.time span {
    display: block;
}
.count {
    padding-left: 19px;
    width: 33px;
/*     background: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/icon/icon_morning_night.png) no-repeat left; */
    background-position: 2px 6px;
}
.theater ul li a span.count {
    float: left;
    width: 49px;
    height: 20px;
    line-height: 25px;
    text-align: left;
    color: #3d7c35;
    font-size: 12px;
    padding-left: 3px;
    overflow: hidden;
}

.steps{
width: 996px;
height: 595px;
margin: auto;f
   text-align: center;
}

.section-time {
    width: 996px;
    height: 528px;
    position: relative;
    float: left;
    height: 100%;
    margin-left: 2px;
    background-color: #f2f0e5;
    overflow: hidden;
}

.col-head {
    background-position: 50% -91px;
    background-image: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/titles.png);
    background-repeat: no-repeat;
  position: relative;
    height: 33px;
    line-height: 33px;
    text-align: center;
    background-color: #333333;
  
}
.col-body {
    width: 100%;
    position: relative;
    overflow: hidden;
    height: 560px;
}
.sreader {
    display: block;
    position: absolute;
    left: -10000px;
}

#container{
	    margin-bottom: 30px;
    margin-top: 30px;
}
body{
background-color: #fcfcf0;
}

</style>







		<div class="section section-time">
			<div class="col-head" id="skip_time_list">
							<h3 class="sreader">상영 시간표 조회 결과</h3>
			</div>
							


<div class="col-body">
<!-- 시간선택 -->
<c:forEach var="movieTimeDto" items="${list}">

<div class="theater"  style="border: none;">
	<span class="title">
		<span class="name">${movieTimeDto.screen_type }</span>
		<span class="floor">${movieTimeDto.screen_name }</span>
		<span class="seatcount">(총${movieTimeDto.screen_all_seat }석)</span>
	</span>
		<ul>
			<li >
				<a class="button" href="${pageContext.request.contextPath }/cinema/seat?movietime_no=${movieTimeDto.movietime_no }" >
				<span class="time">
					<span>${movieTimeDto.movie_hour }</span>
				</span>
				<span class="count">267석</span>
				</a>
			</li>
		</ul>
	</div>
</c:forEach>
</div>			
			
			
		</div>

			












