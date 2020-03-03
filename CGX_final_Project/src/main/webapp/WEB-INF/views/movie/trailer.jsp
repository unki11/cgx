<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>

<jsp:include page="../header.jsp"></jsp:include> 

<head>

<style>
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
    height: 450px;
}
.sect-common:before {
    left: 0;
    background: url(../images/common/bg/bg_bricks_before.png) no-repeat 0 0;
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
    background: url(../images/common/bg/bg_bricks_after.png) no-repeat 0 0;
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
    background: url(../images/common/bg/bg_h3_line.jpg) repeat-x 0 50%;
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
</style>

</head>

<script>
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
                event.preventDefault();
                $(this).ekkoLightbox();
            });


</script>



 
    <body>
  
  <div id="contaniner">
  	<div id="contents">
  		<div class="sect-common">
  			<div class="cols-player">
  				<h3>
  				<span class="ico-trailer hd">HD</span>
  				Best 영상
  				</h3>
  			<c:forEach var="videoVO" items="${video_list }" begin="0" end="0">
  		<div class="col-player">
  			<div class="warp-player">
  				<iframe src=" ${videoVO.video_link}" data-toggle="lightbox" class="ifrm_hdtrailer_best" style="width: 640px; height: 360px;"></iframe>
  				
  			</div>
  		</div>	
  		
  	<div class="col-playerinfo">
  		<div class="box-image">
  		a 링크
  			<span class="thumb-image">
  			<img src="http://img.youtube.com/vi/${videoVO.video_id }/maxresdefault.jpg" style="width:240px; height: 135px;">
  			</span>
  		</div>
  		 </c:forEach>
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
  		
  		<!-- 실 컨텐츠 시작 -->
  		<div class="wrap-movie-hd">
 <div class="sect-trailer hdtrailer" id="menu">
  		<h3><img src="http://img.cgv.co.kr/R2014/images/title/h3_hd_trailer.gif" alt="HD Trailer"></h3>
  			<h4 class="hidden">최신트레일러</h4>
  			<ul id="hdtrailer_list_container">
  				<c:forEach var="videoVO" items="${video_list }" >
  				<li>
  					<div class="box-image">
<%--   					<h1>${videoVO.movie_title}</h1> --%>
    <a href=" ${videoVO.video_link}" data-toggle="lightbox" class="video">
        <span class="thumb-image"></span>
         <img src="http://img.youtube.com/vi/${videoVO.video_id }/maxresdefault.jpg" style="width:240px; height: 135px;">
        </a>
        </div>
        	<div class="box-contents">
        		<strong class="title">
                                      ${videoVO.movie_title}                          
                                
                            </strong>
        	</div>
  				</li>
         </c:forEach>
  			</ul>
 </div>
 </div>
    
    
    	</div>
   
</body>
    
  
   <jsp:include page="../footer.jsp"></jsp:include> 