<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<jsp:include page="../header.jsp"></jsp:include>    
<h1>movie페이지입니다</h1>
        <script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
        <script>
$(function(){
	$(".wish").click(function(e){
		var value = (this).value;
		console.log(value)
		$.ajax({
			url:"movielog?movie_no="+value,
			type:"get",
			dataType :"json",
	 		success:function(data){
	 			console.log(data);
	 			if(data == true){
	 				alert("위시리스트에 저장되었습니다.");
	 			}else{
	 				alert("위시리스트 삭제.");
	 			} 

			}
		});
	})
});
	

</script>

<c:forEach var="list" items="${list }">

<h5>${list }</h5>
<a href="detail?movie_no=${list.movie_no}"><img src="download?files_no=${list.files_no }"></a>
<button class="wish" value="${list.movie_no}">좋아요</button> <!-- 지현이추가 -->
</c:forEach>




<jsp:include page="../footer.jsp"></jsp:include> 