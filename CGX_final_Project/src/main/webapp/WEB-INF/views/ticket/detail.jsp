<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <jsp:include page="../header.jsp"></jsp:include>    
    
     
    
   
    <head>
    <style>
       * {
	box-sizing: 
-box;
	}
	.carousel-indicators li {
    display: inline-block;
    width: 10px;
    height: 10px;
    margin: 1px;
    text-indent: -999px;
    cursor: pointer;
    background-color: #000\9;
    background-color: rgba(0,0,0,0);
    border: 1px solid #3433b7;
    border-radius: 10px;
}
      .videos{
 padding-left: 43%;
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

    #contaniner {
    width: 100%;
}
    html, body, #contaniner, #footer {
    background-color: #fdfcf0;
}
.linemap-wrap {
    width: 100%;
    background-color: #f1f0e5;
    border-bottom: 1px solid #cacac0;
}
.linemap-wrap .sect-linemap {
    position: relative;
    width: 980px;
    height: 28px;
    margin: 0 auto;
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
#contents {
    clear: both;
    padding-bottom: 50px;
}
#cgvwrap .cgv-ad-wrap .sect-head-ad, .head, .im-wrap, #contents, .foot, .sect-smuse, .sect-cinfo {
    position: relative;
    width: 980px;
    margin: 0 auto;
}
.tit-heading-wrap {
    position: relative;
    height: 51px;
    margin-top: 30px;
    border-bottom: 3px solid #241d1e;
}
.tit-heading-wrap > h3 {
    display: inline-block;
    position: relative;
    height: inherit;
    margin: 0;
    background-image: none;
    color: #222;
    font-weight: 500;
    font-size: 36px;
    text-align: left;
    vertical-align: middle;
}
[class|="wrap-movie"][class$="detail"] [class^="sect-"] {
    margin-top: 40px;
    
}
.round.lightblue > *:after {
    right: -2px;
    bottom: -2px;
    background-position: -25px -5px;
}
div[class^="sect-"] {
    clear: both;
    zoom: 1;
}
[class|="sect-base"] h3 {
    font: 0/0 a;
    zoom: 1;
    height: auto;
    margin: 0;
    background: none;
    text-align: left;
}
strong {
    font-weight: 500;
}
[class|="sect-base"][class$="movie"] .box-image {
    margin-right: 30px;
    width: 185px;
    height: 260px;
}

[class|="sect-base"] .box-image {
    float:left;
}

.box-image a {
    display:block;
}

a {
    color: inherit;
    text-decoration: none;
}
.thumb-image {
    display: block;
    position: relative;
}
[class|="sect-base"][class$="movie"] .thumb-image img {
    width: 185px;
    height: 260px;
}
input, select, img {
    vertical-align: middle;
}
.ico-posterdetail {
    display: block;
    position: absolute;
    left: 4px;
    bottom: 3px;
    width: 24px;
    height: 24px;
    background: url(../images/sprite/sprite_icon.png) 0 0 no-repeat;
    font: 0/0 a;
    zoom: 1;
}
.ico-grade.grade-15 {
    background-position: -72px 0;
}
.ico-grade {
    display: block;
    position: absolute;
    left: 5px;
    top: 5px;
    width: 21px;
    height: 21px;
    background: url(../images/sprite/sprite_icon.png) no-repeat;
    font: 0/0 a;
    zoom: 1;
}
[class|="sect-base"][class$="movie"] .box-contents {
    width: 765px;
}

[class|="sect-base"] .box-contents {
    float: left;
    position: relative;
}
.title {
    display: block;
    color: #333333;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
  
}
.wrap-movie-detail .sect-trailer .title {
    margin-top: 10px;
    font-size: 13px;
    line-height: 16px;
}
.sect-trailer .title {
    font-size: 13px;
    vertical-align: middle;
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


* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
[class|="sect-base"] .title strong {
    color: #1a1919;
    font-size: 25px;
    vertical-align: middle;
}
[class|="sect-base"] .title em {
    margin-left: 12px;
}
.round.lightblue {
    border: 2px solid #3e82a4;
    color: #3e82a4;
    width: 73px;
    height: 27px;
}
.round {
    line-height: 23px;
    font-weight: 500;
    font-size: 12px;
    text-align: center;
    vertical-align: middle;
}
.round, .round > * {
    display: inline-block;
    position: relative;
}
em {
    font-style: normal;
}
.round.lightblue:before {
    left: -2px;
    top: -2px;
    background-position: -20px 0;
}
.round:before, .round:after, .round > *:before, .round > *:after {
    content: '';
    display: block;
    position: absolute;
    width: 5px;
    height: 5px;
    background: #fdfcf0 url(../images/sprite/sprite_corner01.png) no-repeat;
}
.round.lightblue:after {
    left: -2px;
    bottom: -2px;
    background-position: -20px -5px;
}
.round > * {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
    height: 100%;
    padding: 0 5px 0;
}
[class|="sect-base"] .title p {
    color: #666666;
}
.title p {
    font-size: 12px;
    font-family: Verdana, Geneva, sans-serif;
}

[class|="sect-base"] .score {
    margin-top: 25px;
    padding-bottom: 10px;
    border-bottom: 1px solid #d9d6c8;
    font-size: 14px;
}
[class|="sect-base"] .score .egg-gage, [class|="sect-base"] .score .percent {
    vertical-align: middle;
}
.score .percent span {
    color: #333333;
    font-size: 12px;
    font-weight: normal;
    font-family: Verdana, Geneva, sans-serif;
    vertical-align: -1px;
}
[class|="sect-base"][class$="movie"] .spec {
    padding-top: 18px;
    line-height: 1.6;
}
.spec {
    color: #333333;
    font-size: 13px;
    font-weight: 500;
}
[class|="sect-base"][class$="movie"] .spec:after {
    content: '';
    display: block;
    clear: both;
}
dl:after, ul:after, ol:after {
    content: '';
    clear: both;
    display: block;
}
dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.spec dt {
    float: left;
}
[class|="sect-base"][class*="movie"] .spec dd {
    white-space: normal;
    text-overflow: clip;
    overflow: visible;
}
[class|="sect-base"][class*="movie"] .spec dd {
    float: left;
}
dd {
    display: block;
    margin-inline-start: 40px;
}

[class|="sect-base"][class$="movie"] .spec .on {
    float: none;
}
[class|="sect-base"][class*="movie"] .spec dd {
    white-space: normal;
    text-overflow: clip;
    overflow: visible;
}
[class|="sect-base"] .like {
    margin-top: 22px;
}
.like {
    display: inline-block;
    margin-right: 3px;
}
.link-reservation {
    display: inline-block;
    width: 91px;
    height: 35px;
    background: url(../images/sprite/sprite_btn.png) 0 0 no-repeat;
    font: 0/0 a;
    zoom: 1;
    vertical-align: top;
}
.wrap-movie-detail .cols-content {
    margin-top: 30px;
}
.cols-content {
    margin-top: 25px;
}
.cols-content:after {
    content: '';
    clear: both;
    display: block;
}
.cols-content .col-detail:first-child {
    float: left;
}
.cols-content .col-detail {
    position: relative;
    width: 800px;
    float: left;
}
.score {
    font-size: 11px;
}
[class|="wrap-movie"][class$="detail"] [class^="sect-"] {
    margin-top: 40px;
}
[class|="sect-story"][class*="movie"] {
    margin-top: 35px;
    color: #333333;
    line-height: 1.8;
}

[class|="sect-story"][class*="movie"] strong {
    font-size: 13px;
}



.graph {
    overflow: hidden;
    border-bottom: 1px solid #cccccc;
}
.graph li:first-child {
    border-left: none;
}
.graph li {
    overflow: hidden;
    height: 250px;
}
.sect-graph li {
    width: 33.3%;
}
.graph li {
    float: left;
    padding-bottom: 10px;
    border-top: 1px solid #cccccc;
    border-left: 1px solid #cccccc;
    margin-right: -1px;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.graph li strong {
    display: block;
    height: 58px;
    border-bottom: 1px solid #cccccc;
    color: #4a4a4a;
    text-align: center;
    line-height: 58px;
}
.graph .radar-graph {
    margin: 0 30px 0 15px;
}
element.style {
    width: 221px;
    height: 221px;
}
.sect-graph li {
    width: 33.3%;
}
b, strong {
    font-weight: 500;
}
[class|="wrap-movie"][class$="detail"] .heading {
    margin-bottom: 20px;
}
.heading {
    position: relative;
    width: 100%;
    height: 39px;
    background: #e2e0d2;
}
.heading h4 {
    float: left;
    margin-left: 16px;
    line-height: 39px;
    color: #333333;
    font-size: 13px;
    font-weight: bold;
    letter-spacing: -1px;
}
.wrap-movie-detail .sect-trailer > ul {
    margin-left: -10px;
}
.wrap-movie-detail .sect-trailer li {
    width: 260px;
    margin: 0 0 15px 10px;
}
.sect-trailer > ul > li {
    float: left;
}
.wrap-movie-detail .sect-trailer li .box-image {
    width: 260px;
    height: 142px;
}

.wrap-movie-detail .sect-trailer .txt-info {
    margin-top: 3px;
    color: #666666;
    font-family: Verdana, Geneva, sans-serif;
}
.txt-info {
    display: block;
    color: #999999;
    font-size: 12px;
}
.sect-stillcut .slider-wrap {
    width: 800px;
    height: 450px;
}
.slider {
    overflow: hidden;
    position: relative;
    z-index: 1;
    width: 100%;
    height: 100%;
}
.slider .item-wrap {
    display: inline-block;
    float: left;
}

.movie-detail-ad {
    clear: both;
    padding: 30px 0 0;
}
.round.lightblue > *:before {
    right: -2px;
    top: -2px;
    background-position: -25px 0;
}
body{
background-color: #fcfcf0;
}
body, input, textarea, select, button, table {
    font-size: 13px;
    line-height: 1.2;
    color: #666;
    font-family: 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-weight: 300;
}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}
h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

  ol, ul {
    list-style: none;
}
ul {
    display: block;
/*     list-style-type: disc; */
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
   
  
@media screen and {
    a.video span{
        background-size: 20%;
 }
  .wrap-movie-detail .sect-trailer .title {
    margin-top: 10px;
    font-size: 13px;
    line-height: 16px;
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
.canvasjs-chart-canvas{
	width: 245px;
    height: 185px;
    position: absolute;
    user-select: none;
}
    </style>
    </head>
     <script>


 window.onload = function () {

//동영상 모달 이벤트
	 $(document).on('click', '[data-toggle="lightbox"]', function(event) {
	     event.preventDefault();
	     $(this).ekkoLightbox();
	 });
	 
	 
	 //매력 포인트 그래프 
     var chart = new CanvasJS.Chart("charm-point",
{

data: [
{        
 type: "column",
 dataPoints: [
     { label: "감독연출", y: 89 },	
     { label: "스토리", y: 91 },	
     { label: "영상미", y: 77 },
     { label: "배우연기", y: 85 },	
     { label: "ost", y: 90 }

 ]
}]
});

chart.render();


//성별 예매 분포 그래프
 var options = {
 animationEnabled: true,
 title: {
	text: "성별 예매 분포도"
 },
 data: [{
	    type: "doughnut",
	    innerRadius: "40%",
	    showInLegend: true,
	    legendText: "{label}",
	    indexLabel: "{label}: #percent%",
	    dataPoints: [
		    { label: "남자", y: ${man}} ,
		    { label: "여자", y: ${woman}}
   ]  
}]
};
 $("#sex-reserv").CanvasJSChart(options);

 
 //연령별 예매 분포
 var optionss = {
     animationEnabled: true,
     title: {
         text: "연령별 예매 분포"
     },
//      axisY: {
         
//          suffix: "%",
//          includeZero: false
//      },
     axisX: {
         title: "연령"
     },
     data: [{
    	 type: "doughnut",
 	    innerRadius: "40%",
 	    showInLegend: true,
 	    legendText: "{label}",
 	    indexLabel: "{label}: #percent%",
         
        
         dataPoints: [
        	
             { label:"10대", y:${age10  == null? 0 : age10 } },
             { label: "20대", y: ${age20  == null? 0 : age20 }},	
             { label: "30대", y:${age30  == null? 0 : age30 } },
             { label: "40대", y:${age40  == null? 0 : age40 } },	
             { label: "50대", y:${age50  == null? 0 : age50 } }
             
          
         ]
     }]
 };
 $("#age-reserv").CanvasJSChart(optionss);
 


 
 }
 

 </script>
    
    
    
    <body style="background-color: #fcfcf0;">
    <div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

       

		<!-- Contents Area -->
		<div id="contents" class="">
            
            <!-- Contents Start -->
			

<!-- 실컨텐츠 시작 -->
<div class="wrap-movie-detail" id="select_main">

    
<div class="tit-heading-wrap">
    <h3>영화상세</h3>
</div>
<div class="sect-base-movie">
   
    <div class="box-image">
       
            <span class="thumb-image"> 
                <a href="detail?movie_no=${movieActorVO.movie_no}"><img src="download?files_no=${movieActorVO.files_no }"></a>
                
            </span> 
        </a> 
    </div>
    <div class="box-contents">
        <div class="title"> 
            <strong>${movieActorVO.movie_title}</strong>
            <em class="round lightblue"><span>${movieActorVO.movie_status}</span></em>
            
            
           
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>${movieActorVO.movie_ticket_rate}%</span></strong>
          
          
          
           
            </div>
            <!-- 떨어지는 얘 이전 요소에 class=on을 넣는다 -->
        <div class="spec">
            <dl>
                <dt>감독 :&nbsp;</dt>
                <dd>
                    
                        
                        ${movieActorVO.movie_director}               
                        
                </dd>
                
                <dd>
                    
                </dd>

                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                <dd class="on">
                    
                            ${movieActorVO.actorList}
                        
                </dd>

              


                <dt>장르 :&nbsp;${movieActorVO.movie_genre}</dt> 
                <dd></dd>
                <dt>&nbsp;/ 기본 :&nbsp;</dt>
                <dd class="on">${movieActorVO.movie_grade},&nbsp;${movieActorVO.movie_runtime}분,&nbsp;${movieActorVO.movie_country}</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on">${movieActorVO.movie_startdate}</dd>


            

            </dl>
        </div>
        
        <span class="like">
            

        
           <button>예매</button>
        
        </span>
    </div>
</div><!-- .sect-base -->




    <div class="cols-content" id="menu">
        <div class="col-detail">
            <!-- 메뉴가 선택되면 a 에 title="선택" 이라고 넣는다 -->
           
            <div class="sect-story-movie">
                <strong>${movieActorVO.movie_title}</strong>
					<h2 style="font-size: inherit;">${movieActorVO.movie_content}</h2>
            </div><!-- .sect-story -->
            <div id="ctl00_PlaceHolderContent_Section_Chart" class="sect-graph">
                <ul class="graph">
                    <li>
                        <strong>매력포인트</strong>
						<div class="radar-graph" id="chart1">							
                            <div id="charm-point" style="height: 200px; width: 100%;"></div>
						</div>
                    </li>
                    <li>
                        <strong>성별 예매 분포</strong>
                        
                        	<div id="sex-reserv" style="height: 200px; width: 100%;"></div>
                      
                    </li>
                    <li>
                        <strong>연령별 예매 분포</strong>
                        <div id="age-reserv" style="height: 200px; width: 100%;"></div>
                    </li>
                </ul>
            </div>            
            <!-- .sect-graph -->

            <div class="movie-detail-ad">
                <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_800" width="800" height="90" title="더보이2" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="SponsorBar_800" id="SponsorBar_800"></iframe>
            </div>
            
            <!-- .sect-staff -->
            <div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer">
                <div class="heading">
                    <h4>트레일러</h4>
                </div>
                <ul>
                <!-- 사진 동영상 조회 -->
                
                        <c:forEach var="info_trailer" items="${info_trailer }">
                    <li>
 						<div class="box-image">
    						<a href=" ${info_trailer.video_link}" data-toggle="lightbox" class="video">
       						 <span>&nbsp;</span>
         						<img src="http://img.youtube.com/vi/${info_trailer.video_id }/maxresdefault.jpg" style="width:240px; height: 135px;">
      						  </a>
      
    					</div>
							<div class="box-contents">
                          
                                <strong class="title">
                                    
                                    <span class="ico-trailer hd">HD</span>
                                    메인 예고편
                                </strong>
                          
                          
                        </div>
                    </li>
    </c:forEach>
                    
                    
                   
                    
                    
                </ul>
            </div><!-- .sect-trailer -->
            <div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
                <div class="heading">
                    <h4>스틸컷</h4>
                </div>
                <div class="slider-wrap">
                
                 <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" style="width: 800; height: 450px" >
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		  	<c:forEach var="stillcut" items="${info_stillcut}" varStatus="status">
		  		<c:choose>
		  			<c:when test="${status.first}">
					    <li data-target="#myCarousel" data-slide-to="${status.index}" class="active"></li>
		  			</c:when>
		  			<c:otherwise>
					    <li data-target="#myCarousel" data-slide-to="${status.index}"></li>
		  			</c:otherwise>
		  		</c:choose>
		    </c:forEach>
		  </ol>
		
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" style="width: 800px; height: 450px;    text-align: -webkit-center;" >
		  	<c:forEach var="stillcut" items="${info_stillcut}" varStatus="status">
		  		<c:choose>
		  			<c:when test="${status.first}">
					    <div class="item active" style="width: 800px; height: 450px">
					      <img src="download?files_no=${stillcut.files_no }" alt="stillcutActive" style="width: 320px ; height: 450px;">
					    </div>
		  			</c:when>
		  			<c:otherwise>
					    <div class="item" style="width: 800px; height: 450px">
					      <img src="download?files_no=${stillcut.files_no }" alt="stillcut" style="width: 320px ; height: 450px;">
					    </div>
		  			</c:otherwise>
		  		</c:choose>
			</c:forEach>
		  </div> 
		
		
		
		  <!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- 이미지 슬라이드 종료 -->
                        
                        
                        
                      
                    </div>
                </div>
            </div><!-- .sect-stillcut -->
                        
                     
                        
                        
                      
                        
                      
                        


              </div>
    
           </div>
           </div>
          
        


               


            <!--/ Contents End -->

		</div>
	</body>	
		<jsp:include page="../footer.jsp"></jsp:include>    
		
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
<!--     <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script> 이거키면 동영상 안켜짐 -->  
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    <script src="path/to/chartjs/dist/Chart.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>