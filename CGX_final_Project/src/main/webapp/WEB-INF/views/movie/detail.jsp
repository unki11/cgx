<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <h1>상세정보</h1>
    
    <c:forEach var="movieActorVO" items="movieActorVO">
    
        <h5>${movie_title}</h5>
        <c:forEach var="movieActorVO.actorList"  items="actorList">
        <h5>${actorList }</h5>
</c:forEach>

    </c:forEach>