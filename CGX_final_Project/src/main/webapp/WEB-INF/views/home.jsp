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

	  .videos img{
        width: 100%;
        height: auto;
    }

a.video{
    float: left;
    position: relative;
}

a.video span{
    width: 100%;
    height: 100%;
    position: absolute;
    background:url("https://t1.daumcdn.net/cfile/tistory/272B024E567617E839") no-repeat;
    background-position: 50% 50%;
    background-size: 20%;
}

@media screen and {
    a.video span{
        background-size: 20%;
    }
}

#contaniner {
    width: 100%;
}

#contents {
    clear: both;
    padding-bottom: 50px;
}

#cgvwrap .cgv-ad-wrap .sect-head-ad, .head, .im-wrap, #contents, .foot, .sect-smuse, .sect-cinfo {
    position: relative;
    width: 980px;
    margin: 0 auto;
}
div[class^="sect-"] {
    clear: both;
    zoom: 1;
}
.sect-common {
   
    margin-top: 30px;
    height: 491px;
    margin-bottom: 30px;
}
.sect-common:before {
    left: 0;
    
}
.sect-common:before, .sect-common:after {
    position: absolute;
    top: 0;
    z-index: 10;
    content: '';
    width: 14px;
    height: 450px;
}
.sect-common, .cols-movie {
    overflow: hidden;
    width: 980px;
}
div[class^="sect-"]:after {
    content: '';
    clear: both;
    display: block;
}
.sect-common:before, .sect-common:after {
    position: absolute;
    top: 0;
    z-index: 10;
    content: '';
    width: 14px;
    height: 450px;
}
.sect-common:after {
    right: 0;
   
}
.cols-player {
    height: 450px;
    padding: 30px 32px 30px 41px;
    background: #1d1b1c;
    zoom: 1;
}
.cols-player:after {
    content: '';
    clear: both;
    display: block;
}
.cols-player h3 {
    height: auto;
    margin: 0;
    background: none;
    line-height: 1.2;
    text-align: left;
    color: #ffffff;
    font-size: 15px;
    margin-bottom: 10px;
}
.ico-trailer.hd {
    border-color: #2a6fb6;
    color: #2a6fb6;
}
.ico-trailer {
    display: inline-block;
    height: 13px;
    margin-right: 5px;
    padding: 0 3px;
    border: 1px solid #c62424;
    font-size: 10px;
    font-family: Dotum,'돋움';
    text-align: center;
    font-weight: bold;
    line-height: 13px;
}
.col-player {
    float: left;
}
.warp-player {
    width: 640px;
    height: 360px;
}
.col-playerinfo {
    float: right;
    width: 248px;
}
.col-playerinfo .box-image {
    float: left;
    width: 90px;
    height: 120px;
    margin-right: 10px;
}

.thumb-image {
    display: block;
    position: relative;
}
.col-playerinfo .box-contents {
    height: 100px;
    margin-bottom: 33px;
}
.col-playerinfo .box-contents {
    float: left;
    width: 148px;
    padding-top: 20px;
}
.col-playerinfo .title {
    color: #cccccc;
    font-size: 13px;
}
.title {
    display: block;
    color: #333333;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
strong {
    font-weight: 500;
}
.col-playerinfo .box-contents .txt-info {
    margin-top: 5px;
}
.txt-info {
    display: block;
    color: #999999;
    font-size: 12px;
}
.txt-info > em {
    display: block;
}
em {
    font-style: normal;
}
.col-playerinfo .descri-trailer {
    clear: both;
}
.col-playerinfo .descri-trailer textarea {
    width: 228px;
    height: 158px;
    margin-top: 12px;
    border: 1px solid #161415;
    background: #161415;
    color: #999999;
}
textarea {
    border: 1px solid #ddd;
    line-height: 1.7;
    padding: 10px;
}
textarea {
    resize: none;
}
.wrap-movie-hd > .sect-trailer.hdtrailer {
    padding: 40px 0;
    border-top: 3px solid #241d1e;
    border-bottom: 2px solid #241d1e;
}
div[class^="sect-"] {
    clear: both;
    zoom: 1;
}
div[class^="sect-"]:after {
    content: '';
    clear: both;
    display: block;
}
.wrap-movie-hd h3 {
    margin-bottom: 30px;
}
h3 {
    height: 41px;
    margin: 30px 0 15px;

    line-height: 41px;
    text-align: center;
    font-weight: 500;
}
h3 > img {
    padding: 0 8px;
    background-color: #fdfcf0;
}
input, select, img {
    vertical-align: middle;
}
.hidden {
    font: 0/0 a;
    height: 0;
    overflow: hidden;
    position: absolute;
    visibility: hidden;
    width: 0;
    zoom: 1;
}
.wrap-movie-hd > .sect-trailer > ul {
    margin: -40px 0 0 -6px;
}
ol, ul {
    list-style: none;
}
dl:after, ul:after, ol:after {
    content: '';
    clear: both;
    display: block;
}
.wrap-movie-hd > .sect-trailer > ul > li {
    width: 240px;
    margin: 40px 0 0 6px;
}
.sect-trailer > ul > li {
    float: left;
}
.wrap-movie-hd > .sect-trailer .box-image {
    width: 240px;
    height: 135px;
}
.box-image a {
    display: block;
}
a {
    
    text-decoration: none;
}
.wrap-movie-hd > .sect-trailer .box-image .thumb-image {
    width: 240px;
    height: 135px;
}
.thumb-image {
    display: block;
    position: relative;
}
.wrap-movie-hd > .sect-trailer .box-image .thumb-image img {
    width: 240px;
    height: 135px;
}
.wrap-movie-hd > .sect-trailer > ul {
    margin: -40px 0 0 -6px;
}
*, ::after, ::before {
    box-sizing: border-box;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}

a {
    color: inherit;
    text-decoration: none;
}
.wrap-movie-hd > .sect-trailer .title {
    margin-top: 13px;
    font-size: 12px;
    line-height: 16px;
}
.sect-trailer .title {
    font-size: 13px;
    vertical-align: middle;
}
.title {
    display: block;
    color: #333333;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

   .wrap-movie-hd > .sect-trailer > ul > li {
    width: 240px;
    height: 185px;
    margin: 40px 0 0 6px;
}     

#hdtrailer_list_container{
	width:1030px;
	height:900px;
}


	
	.row > img{
		height: 250px;
		width: 100%;
	}
	h3 {
    height: 41px;
    margin: 30px 0 15px;

    line-height: 41px;
    text-align: center;
    font-weight: 500;
}
h3 > img {
    padding: 0 8px;
    background-color: #fdfcf0;
}
input, select, img {
    vertical-align: middle;
}

</style>

<!-- 발표전 풀기
<script> 
	alert("공지사항입니다.")
	alert("미흡하지만 이쁘게 봐주세요 !")
</script>
  -->
<script>
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
                event.preventDefault();
                $(this).ekkoLightbox();
            });


</script>

<jsp:include page="header.jsp"></jsp:include> 
      <!-- 헤더 끝 -->
      

      <h1>${sessionScope.id }</h1>

      
<body style="background-color: #fcfcf0">
  
  	<div id="contents">
  		<div class="sect-common">
  			<h3><img src="http://img.cgv.co.kr/R2014/images/title/h3_movie_selection.gif" alt="MOVIE SELECTION"></h3>
  			<div class="cols-player">
  				<h3>
  				<span class="ico-trailer hd">HD</span>
  				Best 영상
  				</h3>
  			
  		<div class="col-player">
  			<div class="warp-player">
  				<iframe src=" https://www.youtube.com/embed/BIKz5KQpiog?autoplay=1" data-toggle="lightbox" class="ifrm_hdtrailer_best" style="width: 640px; height: 360px;"></iframe>
  				
  			</div>
  		</div>	
  		
  	<div class="col-playerinfo">
  		<div class="box-image">
  		a 링크
  			<span class="thumb-image">
  			<img src="http://img.youtube.com/vi/BIKz5KQpiog/maxresdefault.jpg" style="width:240px; height: 135px;">
  			</span>
  		</div>
  		 
  			<div class="box-contents">
  			alink
  			<strong class="title">캣츠</strong>
  				<div class="txt-info">
  					<em class="genre">뮤지컬,&nbsp;드라마</em>
  					<span>
                            <i>2019.12.24</i>
                            <strong>개봉</strong>
                            
                        </span>
  				</div>
  			
  			</div>
  			
  			<div class="descri-trailer">
                    <label for="descri-trailer" class="title">영상설명</label>
                    <textarea id="descri-trailer" readonly="readonly" cols="40" rows="20">컨텐츠 준비 중 입니다.</textarea>
                </div>
  	</div>
  			
  			</div>
  		
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

</div>
   <div align="center"><img src="${pageContext.request.contextPath}/resources/img/alltype.jpg" style="height: 80px; margin-left: 130px;"></div>
</body> 
      <!-- 푸터시작 -->
<jsp:include page="footer.jsp"></jsp:include>      


</html>



    
      
      
      
      
      
      
      

