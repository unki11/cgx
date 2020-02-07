<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h1>movie페이지입니다</h1>

<c:forEach var="list" items="${list }">

<h5>${list }</h5>
<!-- <img src="files?files_no=1"> -->

</c:forEach>



<div>
	<iframe height="200" width="200" src="https://www.youtube.com/embed/SH4hOlox8WY?autoplay=1" frameborder="0"></iframe>
</div>
