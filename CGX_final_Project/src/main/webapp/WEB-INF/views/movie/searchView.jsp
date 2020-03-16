<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>

<script type= "text/javascript">


</script>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include> 
<div>
    <div class="container-fluid">
    <div class="row">
         <c:forEach var="list" items="${searchList}">
            <div class="col-md-4">
              <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/download/img?files_no=${list.files_no}" alt="${list.movie_title}">
                <div class="caption">
                  <h3>${list.movie_title}</h3>
                  <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                </div>
              </div>
            </div>
         </c:forEach>
     
    </div>
    </div>


</div>
<jsp:include page="../footer.jsp"></jsp:include> 
</body>

</html>