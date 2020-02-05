<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h1>movie페이지입니다</h1>




<c:forEach var="list" items="${list }">

<h5>${list }</h5>
<img src="upload?files_no=${list.files_no }">

</c:forEach>



