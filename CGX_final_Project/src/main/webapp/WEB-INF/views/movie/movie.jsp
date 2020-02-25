<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<jsp:include page="../header.jsp"></jsp:include>    
<h1>movie페이지입니다</h1>
<script type= "text/javascript">
  function fn_wish(value){
		$.ajax({
			url:"movieWish?movieno="+value,
			type:"get",
			dataType :"json",
	/* 		success:function(data){
				//json데이터 파싱 후 사용 
			/* 	var result = data;  json 데이터 파싱 불가 원인 알아보기 
				if(result == "true"){
					alert("위시리스트에 저장되었습니다.");
				}else{
					alert("위시리스트에 저장이 실패했습니다.");
				} 
			
			},
			*/
			complete :function(data){
				alert("위시리스트에 저장되었습니다.");
			}
		});
	  
  }

</script>

<c:forEach var="list" items="${list }">

<a href="detail?movie_no=${list.movie_no}"><img src="download?files_no=${list.files_no }" style="width: 185px; height: 260px"></a>
<h3>${list.movie_title }</h3>
 <h5>예매율 ${list.movie_ticket_rate}%</h5>
 <h5>개봉 :  ${list.movie_startdate}</h5>
<button id="wish${list.movie_no}" value="${list.movie_no}" onclick="fn_wish(this.value)">좋아요</button> <!-- 지현이추가 -->
<button>예매</button>
<br><br><br><br>
</c:forEach>



<div>
	<iframe height="200" width="200" src="https://www.youtube.com/embed/SH4hOlox8WY?autoplay=1" frameborder="0"></iframe>
</div>
<jsp:include page="../footer.jsp"></jsp:include> 