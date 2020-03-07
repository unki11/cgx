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
	    					$("<h3>").text(data[index].movie_title).appendTo("#movietime");
	    					$.each(list, function(index){
	    						var rlist = list[index].list;
	    						$("<h5>").text(list[index].screen_name).appendTo("#movietime");
	    						$.each(rlist,function(index){
	    							var rtlist = rlist[index];
	    							console.log("rtlist",rtlist);
	    							
	    							var a = $("<a>").attr('href','seat?movietime_no='+rtlist.movietime_no).appendTo("#movietime")
	    							var span = $("<span>").text("상영시간표번호"+rtlist.movietime_no+"  "+"상영시간"+rtlist.movietime_time+"  "+"사용 좌석수"+rtlist.ticket_count+"  ");
	    							a.append(span);
	    							a.appendTo("#movietime");
	    							$("<div>").appendTo("#movietime")
	    							})
	    						})
	    						$("<h5>").text("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ").appendTo("#movietime");
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
            width: 980px; height: 100%;margin: auto
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
        .date{
            width: 10%; 
            text-align: center;
            border: 2px solid black;
            border-radius: 15%;
        }
        .day{
            font-size: 2.5rem;
        }
        .movietime-time{
            width: 10%;
            border: 1px solid g	ray;
        }
        a:link { color: gray; text-decoration: none;}
 		a:visited { color: gray; text-decoration: none;}
 		a:hover { color: black; text-decoration: none;}
    	</style> 	
  <body style="background-color: beige">
  <article>
  <h1>cinema페이지입니다</h1>	
  <ol class="breadcrumb">
  <li><a href="#">Home</a>></li>
  <li><a href="#">Library</a>></li>
  <li class="active">Data</li>
</ol>
    <div class="container">
      <div class="row">
        <div class="col-xs-4">
          <p>Tab</p>
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">서울</a>
              </li>    
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd">경기</a>
              </li>
            </ul>
            <div class="tab-content">
             <div class="tab-pane fade show active" style="width: 100px" id="qwe">
             <c:forEach var="cinema1" items="${cinema_list1}">
               <a href="?cinema_no=${cinema1.CINEMA_NO}">
				<h3>${cinema1.CINEMA_AREA}</h3>
				<h3>시네마 ${cinema1.CINEMA_NO}</h3>
				</a>
			</c:forEach>

              </div>
              <div class="tab-pane fade" id="asd">
                  <c:forEach var="cinema2" items="${cinema_list2}">
                <a href="?cinema_no=${cinema2.CINEMA_NO}">
					<h3>${cinema2}</h3>

				</a>
				</c:forEach>
              </div>
	          		
          		
          			
    <div>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</div>
    	<div style="font-size: 2.5rem">${cinemaDto.cinema_area}</div>
    	<img src="${pageContext.request.contextPath}/download/img?files_no=${cinemaDto.files_no}" width="100%" height="500px">
    	 <div class="cinema-ex">
    	 	<div class="float-left" style="width: 60%;">안녕하세요</div><div style="float: left;width: 40%;">김운기입니다.</div>
    	 </div>
    	 <div style="width: 90%; margin: auto;">
    	 <hr style="height: 4px">
    	<c:forEach var="list" items="${timelist}">
    	<a class="time" href="#">
			<div class="date float-left">
			<span class="hidden-day">${list[0]}${list[1]}${list[2]}</span>
			<span>${list[1]}월 ${list[3]}</span><span class="day"><strong>${list[2]}</strong></span>	
			</div></a>
		</c:forEach>
		<div style="clear: both;"></div>
		<hr>
    <div id="movietime">
    	
    	<c:forEach items="${list}" var="mlist" >
    		<hr>
    		<strong style="font-size: 1.5rem">${mlist.movie_title}</strong>
   			<br>
			<c:forEach items="${mlist.list}" var="slist">
			<br>
			 <div style="width: 90%;margin: auto;">${slist.screen_name}</div>
				<c:forEach items="${slist.list}" var="list">
					<a href="seat?movietime_no=${list.movietime_no}">
					<span>상영시간표번호${list.movietime_no} 상영시간${list.movietime_time} 사용 좌석수${list.ticket_count}</span>

					</a>
				</c:forEach>
			</c:forEach>
		</c:forEach>
    </div>
    <div>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</div>
    <input type="hidden" value="${cinema_no}" name="cinema_no">
    <c:forEach var="screen" items="${screen_list}">
		<h1>${screen.SCREEN_NAME}</h1>
	</c:forEach>
		</div>
  </article>
  <jsp:include page="../footer.jsp"></jsp:include>  