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
    
  <c:forEach var="titleList" items="${titleList }">

<a href="detail?movie_no=${titleList.movie_no}"><img src="download?files_no=${titleList.files_no }" style="width: 185px; height: 260px"></a>
<h3>${titleList.movie_title }</h3>
 <h5>예매율 ${titleList.movie_ticket_rate}%</h5>
 <h5>개봉 :  ${titleList.movie_startdate}</h5>
	<a href="stepCinema?movie_no=${titleList.movie_no}"><button>예매</button></a>
<br><br><br><br>
</c:forEach>
    
    
    
    

   		
   	