<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화관 좌석 배치</title>
    <jsp:include page="../header.jsp"></jsp:include>
    <!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.css"> -->
   <!--  <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.js"></script> -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    <script>
        window.addEventListener("load", function(){
            var tag = document.querySelector(".cinema-wrap");
            var cinema = new Hakademy.Reservation(tag);
        });
        (function(w){
            w.Hakademy = w.Hakademy || {};
            w.Hakademy.util = w.Hakademy.util || {};
            w.Hakademy.util.filterNodesByClassName = function(list, className){
                var rowList = [];
                for(var i=0; i < list.length; i++){
                    try{ 
                        if(list[i].classList.contains(className)){
                            rowList.push(list[i]);
                        }
                    }catch(e){}
                }
                return rowList;
            };
            w.Hakademy.Reservation = function(area){
                var children = area.children;
                var seat_area = Hakademy.util.filterNodesByClassName(children, "cinema-seat-area")[0];
                if(!seat_area){
                    throw "cinema-seat-area가 존재하지 않습니다";
                }
                this.seat_area = seat_area;

                var rowsize = seat_area.getAttribute("data-rowsize");      
                if(!rowsize){
                    throw "cinema-seat-area에 data-rowsize를 정의하십시오";
                }
                this.rowsize = function(){ return rowsize; };
                
                var colsize = seat_area.getAttribute("data-colsize");
                if(!colsize){
                    throw "cinema-seat-area에 data-colsize를 정의하십시오";
                }
                this.colsize = function(){ return colsize; };

                var sendName = area.getAttribute("data-name");
                if(!sendName){
                    console.warn("data-name이 설정되지 않아 seat으로 설정됩니다");
                    sendName = "seat";
                }

                var width;
                try{
                    width = parseInt(window.getComputedStyle(seat_area, null).width);
                }
                catch(e){
                    width = parseInt(seat_area.currentStyle.height);
                }

                this.width = function(){
                    return width;
                };

                var size = parseInt(width / colsize);
                this.size = function(){
                    return size;
                };

                var seatList = seat_area.children;
                var cloneList = [];
                while(seatList.length > 0){
                    var item = seatList[0];
                    var cloneNode = item.cloneNode(true);
                    cloneList.push(cloneNode);
                    seat_area.removeChild(item);
                }
                var seat_unit = cloneList.shift();
                for(var r = 1; r <= rowsize ; r++){
                    for(var c = 1; c <= colsize; c++){
                        //배치할 좌석이 없으면 전부 빈칸으로 채움
                        if(!seat_unit){
                            appendEmptySeat(seat_area, size);
                            continue;
                        }

                        var rownum = parseInt(seat_unit.getAttribute("data-row"));
                        var colnum = parseInt(seat_unit.getAttribute("data-column"));

                        //규격을 벗어날 경우 skip
                        if(rownum > rowsize || rownum < 1 || colnum > colsize || colnum < 1) 
                            continue;
                        
                        //줄칸이 맞지 않으면 빈칸으로 채움
                        if(r != rownum || c != colnum){
                            appendEmptySeat(seat_area, size);
                        }
                        //나머지 좌석
                        else{
                            if(seat_unit.classList.contains("disabled")){
                                appendDisabledSeat(seat_area, size);
                            }
                            else if(seat_unit.classList.contains("active")){
                                appendActiveSeat(seat_area, size);
                            }
                            else{
                                appendNormalSeat(seat_area, size);
                            }
                            seat_unit = cloneList.shift();
                        }
                    }

                    var app = this;
                    w.addEventListener("resize", function(){
                        app.resize();
                    });
                }

                w.Hakademy.Reservation.prototype.resize = function(){
                    var colsize = this.seat_area.getAttribute("data-colsize");
                    var width;
                    try{
                        width = parseInt(window.getComputedStyle(seat_area, null).width);
                    }
                    catch(e){
                        width = parseInt(seat_area.currentStyle.height);
                    }
                    var size = parseInt(width / colsize);
                    var list = this.seat_area.children;
                    for(var i=0; i < list.length; i++){
                        list[i].style.width = size + "px";
                        list[i].style.height = size + "px";
                    }
                };

                //좌석 클릭 이벤트 리스너
                function clickListener(){
                    var checkbox = this.childNodes[0];
                    checkbox.checked = !checkbox.checked;
                    
                    if(checkbox.checked){
                        this.classList.add("active");
                    }
                    else{
                        this.classList.remove("active");
                    }
                }

                function appendDisabledSeat(area, size){
                    var seat = createEmptySeat(size);
                    seat.classList.add("disabled");
                    area.appendChild(seat);
                }

                function appendNormalSeat(area, size){
                    var seat = createEmptySeat(size);
                    var checkbox = document.createElement("input");
                    checkbox.type = "checkbox"
                    checkbox.name = sendName;
                    checkbox.value = r+"-"+c;
                    checkbox.style.display = "none";
                    checkbox.checked = false;
                    seat.appendChild(checkbox);
                    seat.addEventListener("click", clickListener);
                    area.appendChild(seat);
                }

                function appendActiveSeat(area, size){
                    var seat = createEmptySeat(size);
                    var checkbox = document.createElement("input");
                    checkbox.type = "checkbox"
                    checkbox.name = sendName;
                    checkbox.value = r+"-"+c;
                    checkbox.style.display = "none";
                    checkbox.checked = true;
                    seat.classList.add("active");
                    seat.appendChild(checkbox);
                    seat.addEventListener("click", clickListener);
                    area.appendChild(seat);
                }

                function appendEmptySeat(area, size){
                    var seat = createEmptySeat(size);
                    seat.classList.add("empty");
                    area.appendChild(seat);
                }

                //기본 좌석 생성
                function createEmptySeat(size){
                    var seat = document.createElement("div");
                    seat.classList.add("cinema-seat");
                    seat.style.width = size+"px";
                    seat.style.height = size+"px";
                    return seat;
                }
            };
        })(window);
    </script>
    <style>
    	.w-70{
    		width:90%;	
    	}
    	article{
    		margin:auto;
		}
		.cinema-wrap{
    box-sizing: border-box;
    border:1px solid black;
    position:relative;
    padding-right: 200px;
    padding-left: 200px;
}
.cinema-wrap > .cinema-screen{
    width:60%;
    border:1px solid gray;
    text-align: center;
    color:gray;
    padding:10px;
    margin:1rem auto;
}

.cinema-wrap > .cinema-seat-area{
    position:relative;
    padding:1px;
    width:90%;
    margin:1rem auto;
}

.cinema-wrap > .cinema-seat-area::after {
    content:"";
    display:block;
    clear:both;
}
.cinema-wrap > .cinema-seat-area > .cinema-seat{
    float:left;
    background-repeat: no-repeat;
    background-size: cover;
}

.cinema-wrap > .cinema-seat-area > .cinema-seat:not(.empty){
    background-image: url("http://www.sysout.co.kr/file/image/285");
}
.cinema-wrap > .cinema-seat-area > .cinema-seat.active:not(.empty){
    background-image: url("http://www.sysout.co.kr/file/image/283");
}
.cinema-wrap > .cinema-seat-area > .cinema-seat.disabled:not(.empty){
    background-image: url("http://www.sysout.co.kr/file/image/284");
}
.dark-seat {
	width:922px;
	margin:auto;
	font-size:1.2rem;
	padding : 5px;
	background-color: black;
	text-align: center;
}
.border-ticket{
	border: 1px solid black;
	float: left;	
	padding: 15px;
}
.movie-seat{
	font-size: 1rem;
}
.test{
	border-right: 1px solid white;
}
    </style>
</head>
<body>
<article style="margin: auto;">
<div class="dark-seat" style="height: 40px;color: white;">영화 / 좌석</div>
<div style="width: 922px;margin: auto;text-align: center;">
	<div class="border-ticket" style="width: 50%;height: 100px;font-size: 1.3rem"> 
	<span class="movie-seat">제목 :</span>  ${seat.movie_title} (${seat.movie_grade}) <br> 
	<span class="movie-seat">장르 : </span> ${seat.movie_genre} / 
	<span class="movie-seat">감독 : </span>${seat.movie_director} /
	<span class="movie-seat">상영시간 : </span> ${seat.movie_runtime}분</div>
	<div class="border-ticket" style="width: 50%;height: 100px;">
	 당산점 &nbsp;|&nbsp; 운기관 &nbsp; | &nbsp; 남은좌석 
	<span>143</span>/159 <br>	
	<span style="font-size: 2rem">${seat.movietime_time} ~ 14:56</span>
	</div>	
	<div style="clear: both;"></div>
</div>
    <form action="${pageContext.request.contextPath}/pay/kakao/info" method="post">
        <div class="cinema-wrap" data-name="seat" data-rowsize="${rowsize}" data-colsize="${colsize }" style="width:922px;margin: auto;">
            <div class="cinema-screen">스크린</div>
                
                	
             
            <div class="cinema-seat-area" data-rowsize="${rowsize}" data-colsize="${colsize }">
					
					<c:forEach var="list" items="${seatall}">
					<c:choose>
					<c:when test="${list[2]!=0}">
						<div class="cinema-seat" data-row="${list[0]}" data-column="${list[1]}"></div>
					</c:when>
					<c:otherwise>
						<div class="cinema-seat disabled" data-row="${list[0]}" data-column="${list[1]}"></div>
					</c:otherwise>
                		    
					  </c:choose>
				  </c:forEach>
				
				  
				

        </div>

   		</div>
   		<div class="dark-seat" style="height: 200px;">
   			<div class="test float-left" style="width: 150px">
   				<img src="${pageContext.request.contextPath}/download/img?files_no=${seat.files_no }" style="width: 140px; height: 190px">
   			</div>			
   			<div class="test float-left" style="width: 250px;color: white;text-align: left;padding: 15px;height: 190px;">
   				${seat.movie_title} <br><br>
   				${seat.screen_type} <br>
   				${seat.movie_genre }<br>
   				${seat.movie_grade }
   			</div>
   			<div class="test float-left" style="width: 270px;color: white;text-align: left;padding: 30px;height: 190px;">
   				극장 &nbsp; ${seat.cinema_area} <br><br>
   				일시 &nbsp; ${seat.movietime_time}<br><br>
   				상영관 &nbsp; ${seat.screen_name}<br><br>
   			</div>
		<input type="hidden" value="${movietime_no}" name="movietime_no">
        <button type="submit" class="btn btn-danger" style="width: 225px;height: 95%;font-size: 3rem;border-radius: 10%;margin: auto;"><i class="far fa-hand-point-right" style="font-size: 5rem"></i><br> 선택</button>
         </div>
    </form>

<jsp:include page="../footer.jsp"></jsp:include> 	
  </article>        
</body>
</html>

