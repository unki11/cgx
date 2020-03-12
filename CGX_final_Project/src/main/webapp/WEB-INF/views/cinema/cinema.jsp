<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>극장</title>
    <jsp:include page="../header.jsp"></jsp:include>
</head>
 <style>
      p { margin:20px 0px; }
 </style>
    <script>
	$(function(){
		$(".time").click(function(e){
			e.preventDefault();
	            var time =$(this).find('.hidden-day').text();
	            var no = $("input[name=cinema_no]").val();
	            $('.date').removeClass('date');
	            console.log(this);
	            $(this).find('.float-left').addClass('date');
	        	$.ajax({
	    			url:"movietimelist",
	    			method:"post",
	    			data : {"cinema_no":no,"movietime":time},
	    			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    			success:function(data){
	    				console.log(data);
	    				$("#movietime").empty();
	    				$.each(data, function(index){
	    					var movie_no = data[index].movie_no;
	    					var list = data[index].list;
	    					var movieT = $("<strong>").css('font-size','1.5rem').text(data[index].movie_title+" ("+data[index].movie_grade+") ");
	    					var spanT = $("<span>").css('font-size','0.9rem').text(data[index].movie_genre+" / "+data[index].movie_startdate+"개봉");
	    					spanT.appendTo(movieT);
	    					movieT.appendTo("#movietime");
	    					$("<br>").appendTo("#movietime");	
	    					$.each(list, function(index){
	    						$("<br>").appendTo("#movietime");
	    						var rlist = list[index].list;
	    						var div = $("<div>").attr('class','screen');
	    						$("<div>").text(list[index].screen_type+" | "+list[index].screen_name).appendTo(div);
	    						$.each(rlist,function(index){
	    							var rtlist = rlist[index];
	    							console.log("rtlist",rtlist);
	    							
	    							var a = $("<a>").attr('href','seat?movietime_no='+rtlist.movietime_no).appendTo(div)
	    							var mtime = $("<div>").attr('class','time-movie');
	    							var span = $("<span>").text("상영시간표번호"+rtlist.movietime_no+"  "+"상영시간"+rtlist.movietime_time+"  "+"사용 좌석수"+rtlist.ticket_count+"  ");
									var movietime = $("<div>");
									var strong = $("<strong>").css('font-size','1.2rem').text(""+rtlist.movietime_time).appendTo("#movietime");
									var seat = $("<div>").css('color','dodgerblue').text(""+rtlist.ticket_count+"석");
									
									movietime.append(strong);
	    							mtime.append(movietime);
	    							mtime.append(seat);
	    							a.append(mtime);
	    							a.appendTo(div);
	    							
	    							})
	    							$("<br>").appendTo(div);
	    							$("<div>").attr('class','clear').appendTo(div);		
    								div.appendTo("#movietime")
    								$("<hr>").appendTo("#movietime");
    								})
	    						$("<hr>").appendTo("#movietime");
	    					})
	    			}
	    			
	    		})	
			});
		});
    </script>
        <style>
    	.w-70{
    		width:70%;	
    	}
    	article{
    		margin:auto;
    		width: 980px;
		}

		.hidden-day{
			display: none;
		}
		
		*{
            box-sizing: border-box;
            font-family: nomal;
            
        }
        article{
            margin: auto;
        }
        hr{
            height: 0.5px;
            background-color: black;
        }
        .area{
            width: 100%; height: 400px; background-color: bisque;
        }
        .area2{
            width: 980px;background-color: #353535;margin: auto;height: 100%;border-radius:10%;
            padding: 30px;
            
        }
        .area3{
        	border-radius:15%;
        	height : 100%;
        	border: 2px solid gray;
        }
        .main-cinema{
            font-size: 5rem; text-align: center;font-family: cinema;
        }
        .cinema-ex{
            z-index: 2;
            bottom: 152px;
            position: relative;
            height: 150px;
            background-color: black; 
            opacity: 0.8;
            color: white;
            padding: 30px
        }
        .float-left{
            float: left;
        }
        .float-left::after{
            clear: both;
        }
        .date-base{
        	width: 10%; 
            text-align: center;
        }
        .date{
            border: 2px solid black;
            border-radius: 15%;
            background-color: white;
            color: black;
        }
        .day{
            font-size: 2.5rem;
        }
        .movietime-time{
            width: 10%;
            border: 1px solid g	ray;
        }
        .tap{
        	width: 960px;height: 200px;padding: 20px;
        }
        .time-movie{
        	float: left;
        	width: 10%;
        	border: 1px solid gray;
        	text-align: center;
        }
        .clear{
        	clear: both;
        }
        .screen{
        	width: 90%;margin: auto;
        }
        a:link { color: gray; text-decoration: none;}
 		a:visited { color: gray; text-decoration: none;}
 		a:hover { color: black; text-decoration: none;}
    	</style> 	
  <body style="background-color: beige">
 
  <h1>cinema페이지입니다</h1>	
  <ol class="breadcrumb">
  <li><a href="#">Home</a>></li>
  <li><a href="#">Library</a>></li>
  <li class="active">Data</li>
</ol>
  <div class="area">
  <div class="area2">
  <div class="area3">
  <br><br>
    <div class="container">
      <div class="row">
        <div class="col-xs-4" style="width: 100%">
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">서울</a>
              </li>    
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd">경기</a>
              </li>
            </ul>
            <div class="tab-content" style="width: 980px">
             <div class="tab-pane fade show active tap" id="qwe">
             <c:forEach var="cinema1" items="${cinema_list1}">
               
				<div style="float: left;font-size: 1.5rem;"><a href="?cinema_no=${cinema1.CINEMA_NO}" style="color: white;">
				    ${cinema1.CINEMA_AREA}
				</a> &nbsp;|&nbsp;</div>
				
			</c:forEach>
              </div>
              <div class="tab-pane fade tap" id="asd">
                  <c:forEach var="cinema2" items="${cinema_list2}">
                <div style="float: left;font-size: 1.5rem;"><a href="?cinema_no=${cinema2.CINEMA_NO}" st>
				    ${cinema2.CINEMA_AREA}
				</a> &nbsp;|&nbsp;&nbsp;</div>
				</c:forEach>
              </div>
	         </div>
	         </div> 		
	         </div>
	         </div>
	        </div> 
	        </div>
          </div>		
      <article>     			
    <div>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</div>
    	<div style="font-size: 2.5rem">${cinemaDto.cinema_area}</div>
    	<img src="${pageContext.request.contextPath}/download/img?files_no=${cinemaDto.files_no}" width="100%" height="500px">
    	 <div class="cinema-ex" style="font-size: 1.5rem;">
    	 	<div class="float-left" style="width: 60%;">주소 : <br>${cinemaDto.cinema_addr}</div><div style="float: left;width: 40%;"> 전화번호 : <br>${cinemaDto.cinema_phone }</div>
    	 </div>
    	 <div style="width: 90%; margin: auto;">
    	 <hr style="height: 4px">
    	<c:forEach var="list" items="${timelist}">
    	<a class="time" href="#">
			<div class="float-left date-base">
				<span class="hidden-day">${list[0]}${list[1]}${list[2]}</span>
				<span>${list[1]}월 ${list[3]}</span><span class="day"><strong>${list[2]}</strong></span>	
			</div>
		</a>
		</c:forEach>
		<div style="clear: both;"></div>
		<hr>
    <div id="movietime">
    	
    	<c:forEach items="${list}" var="mlist" >
    		
    		<strong style="font-size: 1.5rem">
    		${mlist.movie_title} (${mlist.movie_grade}) 
    		<span style="font-size: 0.9rem"> ${mlist.movie_genre} / ${mlist.movie_startdate}개봉</span>
    		</strong>
   			<br>
			<c:forEach items="${mlist.list}" var="slist">
			<br>
			<div class="screen">
			 <div>${slist.screen_type} | ${slist.screen_name}</div>
				<c:forEach items="${slist.list}" var="list">
					<a href="seat?movietime_no=${list.movietime_no}">
					 <div class="time-movie">
					 	<div style="font-size: 1.2rem">
					 		<strong>${list.movietime_time}</strong>
					 	</div>
					 	<div style="color: dodgerblue;">${list.ticket_count}석</div>
					 </div>
					</a>
				</c:forEach>
				<div class="clear"></div>
				</div>
			</c:forEach>
			<br>
			<hr>
		</c:forEach>
    </div>
    <br><br>
    <input type="hidden" value="${cinema_no}" name="cinema_no">
		</div>
  </article>
  <jsp:include page="../footer.jsp"></jsp:include>  