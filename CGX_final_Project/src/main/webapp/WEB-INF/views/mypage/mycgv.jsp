<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"></jsp:include>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/small-business.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>

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
		height: 150px;
		left: 280px;
	}
	
	.container1{
		display: flex;
	}
	
	body{
		background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
	}
</style>

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
            <h4 class="card-title">${search.member_name} 님  안녕하세요 :)</h4>
            <h6 class="card-title"> 오늘은 어떤영화를 보러 갈까요? </h6>
            <a class="btn btn-danger" href="${pageContext.request.contextPath}/ticket/">예매하러가기</a>
            
        </div>
    </div>
</div>

	<article class="w-40">
	<div class="sect-finder" align="center">
      <a href="${pageContext.request.contextPath}/mypage/reserve">
	 <input type="text" id="login" class="second" name="member_id" value="예매내역" readonly="readonly"><br />
	 </a> 
	 <a href="${pageContext.request.contextPath}/movie/movielog">
	 <input type="text" id="login" class="second" name="member_id" value="위시리스트" readonly="readonly"><br />
	 </a>
	 <a href="${pageContext.request.contextPath}/mypage/movielog/watched?member_no='${search.member_no}'">
	 <input type="text" id="login" class="second" name="member_id" value="내가본 영화"  readonly="readonly"><br />
	 </a>
	<!--  <a href="">
	 <input type="text" id="login" class="fadeIn second" name="member_birth" value="1:1 문의" readonly="readonly" ><br />
	 </a> -->
	 <a href="${pageContext.request.contextPath}/user/mypage">
	 <input type="text" id="login" class="second" name="member_sex" value="my정보관리" readonly="readonly" ><br />
	 </a>
	</div>
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

