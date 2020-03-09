<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="${pageContext.request.contextPath}/resources/css/swiper.css">
<html>
<head>
<script>
$(function(){
	

	new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,
	
	autoplay: {
		delay : 1000,
	},
	
	speed : 5000,
	
	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
});
</script>
<style>
	.container{
		width: 450px;
	}
/* 	img{
		height: 250px;
		width: 100%;
	} */
	.swiper-container{
		height: 300px;
	}
	.row{
		font-size: large;
	}
	
	.row > img{
		height: 250px;
		width: 100%;
	}
</style>
<!-- 발표전 풀기
<script> 
	alert("공지사항입니다.")
	alert("미흡하지만 이쁘게 봐주세요 !")
</script>
  -->


<jsp:include page="header.jsp"></jsp:include> 
      <!-- 헤더 끝 -->
      

      <h1>${sessionScope.id }</h1>

      
<body style="background-color: #fcfcf0">
    <div class="jumbotron">
        <h1>영화 트레일러 자리</h1>
    </div>   
    
<div class="container-fluid">
    <div class="row">
            <div class="col-md-4">
              <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/img/3.jpg" alt="...">
                <div class="caption">
                  <h3>1번 영화</h3>
                  <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
                <div class="thumbnail">
                  <a href="/com.kh.cgx/movie/review"><img src="${pageContext.request.contextPath}/resources/img/4.jpg" alt="..."></a>
                  <div class="caption">
                    <h3>2번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>
	
              <div class="col-md-4">
                <div class="thumbnail">
                  <img src="${pageContext.request.contextPath}/resources/img/5.jpg" alt="...">
                  <div class="caption">
                    <h3>3번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="thumbnail">
                  <img src="${pageContext.request.contextPath}/resources/img/2.jpg" alt="...">
                  <div class="caption">
                    <h3>4번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="thumbnail">
                  <img src="${pageContext.request.contextPath}/resources/img/1.jpg" alt="...">
                  <div class="caption">
                    <h3>5번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="thumbnail">
                  <img src="${pageContext.request.contextPath}/resources/img/girl.jpg" alt="..">
                  <div class="caption">
                    <h3>6번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>
    </div>
</div>

<!--      <div class="jumbotron">
        <h1>LATTE CINEMA 푸터자리</h1>
        <h3>영화관보고싶지?</h3>
    </div>   -->  
<!-- 클래스명은 변경하면 안 됨 -->
<div style="text-align:center; margin-top:5px;">이번주 개봉예정작</div>
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/1.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/2.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/3.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/4.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/5.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/1.jpg"></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
   
<div><img src="${pageContext.request.contextPath}/resources/img/alltype.jpg" style="height: 80px"></div>
</body> 
      <!-- 푸터시작 -->
<jsp:include page="footer.jsp"></jsp:include>      

</body>
</html>


    
      
      
      
      
      
      
      

