<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h1>movie페이지입니다</h1>



<c:forEach var="get" items="${get }">

<h5>${get }</h5>

</c:forEach>



