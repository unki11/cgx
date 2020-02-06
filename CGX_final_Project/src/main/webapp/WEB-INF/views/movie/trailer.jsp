<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <h1>trailer 페이지 입니다</h1>
    
    <c:forEach var="video_list" items="${video_list }">
  
  <h1>${video_list.video_no}</h1>
   <div>
	<iframe height="200" width="200" src="${video_list.video_link}" frameborder="0"></iframe>
</div>

    </c:forEach>
    
    
  
     