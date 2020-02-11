<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$("form").submit(function(e){
			 e.preventDefault();
 
            $.ajax({
                url:"test",
                type:"post",
                data:{'id':'admin'},
                success:function(data){
                console.log(data);
            }
		});
		});
	});
</script> -->
</head>
<body>
<!-- 	<form action="test" method="get">
		<input type="text" name="cinema_no">rladnsrl
		<input type="submit">
	</form> -->
	<h1>상영시간표 자르기</h1>
	<c:forEach items="${list}" var="mlist" >
		<c:forEach items="${mlist.list}" var="slist">
			<c:forEach items="${slist.list}" var="list">
				<h5>${list}</h5>
			</c:forEach>
			<h5>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</h5>
		</c:forEach>
	</c:forEach>
</body>
</html>