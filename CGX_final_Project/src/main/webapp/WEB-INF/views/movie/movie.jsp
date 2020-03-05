<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <!-- ... -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <!-- ... -->
</head> 
 
<jsp:include page="../header.jsp"></jsp:include>    
<h1>movie페이지입니다</h1>
      
        <script>
$(function(){
	$(".wish").click(function(e){
		var value = (this).value;
		console.log(value);
		$.ajax({
			url:"likeupdate?movie_no="+value,
			type:"get",
			dataType :"json",
	 		success:function(data){
	 			console.log(data);
	 			var result = data;
	 			console.log(data.code);
	 			if(result.code == "true"){
	 				alert("위시리스트에 저장되었습니다.");
	 				window.location.reload(true);
	 			}else if(result.code == "false"){
	 				alert("위시리스트 삭제.");
	 				window.location.reload(true);
	 			} 

			}
		});
	});
});
	

</script>

<c:forEach var="list" items="${list }">

<h5>${list }</h5>
<a href="detail?movie_no=${list.movie_no}"><img src="download?files_no=${list.files_no }"></a>

<!-- <i class="far fa-heart"> -->
	<button class="wish far fa-heart btn"  value="${list.movie_no}" style="color: red;">
	
	</button> <!-- 지현이추가 --> 
	
<!-- </i> -->

<h3>${list.movie_wish }</h3>


<a href="detail?movie_no=${list.movie_no}"><img src="download?files_no=${list.files_no }" style="width: 185px; height: 260px"></a>
<h3>${list.movie_title }</h3>
 <h5>예매율 ${list.movie_ticket_rate}%</h5>
 <h5>개봉 :  ${list.movie_startdate}</h5>
<button>예매</button>
<br><br><br><br>
</c:forEach>




<jsp:include page="../footer.jsp"></jsp:include> 

  <script src="https://code.jquery.com/jquery-3.4.1.js" ></script>