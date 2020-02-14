<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body>
<span>영화명 ${list.movie_title}</span>
<h1>watched페이지입니다</h1>

  
 <c:forEach var="list" items="${watchList}">
 
     <div>
      
         <img src=/resources/latte.png" title="${list.movie_title}">      
         <span>상영관 ${list.screen_name}</span><br>
         <span>명수${list.ticket_total_person}</span><br>
         <span>영화시간 : ${list.movietime_time}</span>
       

        
     </div>
 </c:forEach>
</body>