<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
<h1>pre_movie페이지입니다</h1>


<c:forEach var="pre_list" items="${pre_list }">

<h5>${pre_list }</h5>
<img src="download?files_no=${pre_list.files_no }">

</c:forEach>
