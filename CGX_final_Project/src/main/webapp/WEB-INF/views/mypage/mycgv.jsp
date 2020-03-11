<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/small-business.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<style>
	.container{
		width: 100%;
		text-align: center;
		border: 0px solid black;
		padding: 20px;
		margin: 15px;
	}
		
		
	.card{
		display: inline-block;
		width: 50%;
		border: 1px solid red;
		height: 100px;
		left: 280px;
	}
	
	.container1{
		display: flex;
	}
	
	body{
		background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
	}
</style>
<jsp:include page="../header.jsp"></jsp:include>
<form action="mycgv" method="post">
	
	 
<%-- <main>
	<div class="sect-finder" align="center">
		<label class="hidden">이름</label>
		<h3>${search.member_name}</h3>
		<a href="">포인트</a>
		<br>
		<a href="">쿠폰</a>
		<br>
		<button type="button" onclick="deleteUser()">회원탈퇴</button>
		<br><br><br><br>
 	</div>
</main> --%>

<div class="container">
    <h2>회원정보</h2>
    <p>개인정보 보호 정책</p>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">${search.member_name}님</h4>
            <a class="btn btn-danger" href="#">포인트 확인하기</a>
            <a class="btn btn-danger" href="#">쿠폰 확인하기</a>
        </div>
    </div>
</div>

	
<%-- 	<c:forEach var="ist" items="${list}">
<h5>${ist}</h5>
</c:forEach> --%>

	 <%-- <h5>${search}</h5> --%> 
	<div class="container1">
		<div class="row">
			<%-- <div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_no}" required autofocus>
	         	<label for="inputId">회원번호</label>
	    	</div> --%>
	    	<div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_id}" required autofocus>
	         	<label for="inputId">아이디</label>
	    	</div>
	    	<div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_name}" required autofocus>
	         	<label for="inputId">이름</label>
	    	</div>
	    	<div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_phone}" required autofocus>
	         	<label for="inputId">핸드폰번호</label>
	    	</div>
	    	<div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_lastlogin}" required autofocus>
	         	<label for="inputId">최종 로그인 날짜</label>
	    	</div>
	    	<div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_joindate}" required autofocus>
	         	<label for="inputId">가입 날짜</label>
	    	</div>
	    	<div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_birth}" required autofocus>
	         	<label for="inputId">생년월일</label>
	    	</div>
	    	<div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_sex}" required autofocus>
	         	<label for="inputId">성별</label>
	    	</div>
	    	<div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_point}" required autofocus>
	         	<label for="inputId">포인트</label>
	    	</div>
	    	<div class="form-label-group" style="width: 500px">
	         	<input type="email" id="inputId" class="form-control" value="${search.member_email}" required autofocus>
	         	<label for="inputId">이메일</label>
	    	</div>
    	</div>	
	</div>
	
	<article class="w-40">
	<div class="sect-finder" align="center">
		<a href="http://localhost:8080/com.kh.cgx/mypage/reserve">예매내역</a> 
		<a href="http://localhost:8080/com.kh.cgx/movie/movielog?member_no=${search.member_no}">위시리스트</a>
		 <a href="http://localhost:8080/com.kh.cgx/mypage/movielog/watched?member_no='${search.member_no}'">내가 본 영화</a> 
<!-- 		<a href="http://localhost:8080/com.kh.cgx/mypage/movielog/watched?member_no=1">내가 본 영화</a>
 -->		<a href="">1:1 문의</a>
		<a href="http://localhost:8080/com.kh.cgx/user/mypage">my정보관리</a>
	</div>
	
 <%-- 	<c:forEach var="ist" items="${list}">
<h5>${ist}</h5>
</c:forEach>  --%>

</article>
</form>
<jsp:include page="../footer.jsp"></jsp:include>		
		
		
		
	
	



<!-- <script type="text/javascript">
function deleteUser() {
	if (confirm("정말로 탈퇴하시겠습니까?")) {
		$.ajax({
			url : '${pageContext.request.contextPath}/mypage/delete/user',
			method : 'POST',
			success : function (data) {
				console.log(data);
			}
		})
	}
} 
</script> -->

