<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>

<title>예매내역</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>
		<!-- 헤더시작 -->
	
	

<body>
<h1>reserve페이지입니다</h1>
	
	 <c:forEach var="ticketVO" items="${ticketlist}">

	  <div>
	 <span>예매번호${ticketVO.ticket_no}</span><br>
     <span>예매날짜</span><br> 
     <span>사진  <img src="${pageContext.request.contextPath}/resources/img/${files_no}" alt="..."></span><br>
     <span>제목${ticketVO.movie_title}</span><br>
     <span>극장${ticketVO.screen_name}</span><br>
     <span>영화의 시작시간${ticketVO.movietime_time}</span><br>
     <span>관람좌석${ticketVO.movie_title}</span><br>
     <span>인원수${ticketVO.ticket_total_person}</span><br>
     </div>
      </c:forEach>
      </body>
      
      
      
      
     <!-- 푸터시작 -->
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
     