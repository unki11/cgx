<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
 <style type="text/javascript">
      p { margin:20px 0px; }
    </style>
    <script>
	$(function(){
		$(".time").click(function(e){
			e.preventDefault();
	            var time =$(this).text();
	            var no = $("input[name=cinema_no]").val();
	            console.log(time);
	            console.log(no);
	            
	        	$.ajax({
	    			url:"movietimelist",
	    			method:"post",
	    			data : {"cinema_no":no,"movietime":time},
	    			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    			success:function(data){
	    				console.log(data);
	    				
	    				$.each(data, function(index){
	    					var movie_no = data[index].movie_no;
	    					console.log(movie_no);
	    					var list = data[index].list;
	    					console.log(list);
	    					$.each(list, function(index){
	    						console.log("list={}",list);
	    						var rlist = list[index].list;
	    						$.each(rlist,function(index){
	    							console.log("rlist",rlist);
	    							var rtlist = rlist[index];
	    							console.log("rtlist",rtlist);
	    							$("<span>").text("상영시간표번호"+rtlist.movietime_no+"  ").appendTo("#movietime");
	    							$("<span>").text("극장번호"+rtlist.movie_no+"  ").appendTo("#movietime");
	    							$("<span>").text("상영관번호"+rtlist.screen_no+"  ").appendTo("#movietime");
	    							$("<span>").text("상영시간번호"+rtlist.movietime_time+"  ").appendTo("#movietime");
	    							$("<span>").html("<br>").appendTo("#movietime");
	    							})
	    						})
	    					})
	    			}
	    			
	    		})
			});
		});
    </script>
  <body>
  <h1>cinema페이지입니다</h1>	
    <div class="container">
      <div class="row">
        <div class="col">
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
              <div class="tab-pane fade show active" id="qwe">
               <c:forEach var="cinema1" items="${cinema_list1}">
               <a href="?cinema_no=${cinema1.CINEMA_NO}">
				<h3>${cinema1}</h3>
				<h3>시네마 ${cinema1.CINEMA_NO}</h3>
				<h3><img src="download?file_no=${cinema1.FILES_NO}" width="200" height="150"></h3>
				</a>
			</c:forEach>
              </div>
              <div class="tab-pane fade" id="asd">
                <c:forEach var="cinema2" items="${cinema_list2}">
                <a href="?cinema_no=${cinema2.CINEMA_NO}">
					<h3>${cinema2}</h3>
					<h3>${cinema2.FILES_NO}</h3>
					<h3><img src="${pageContext.request.contextPath}/download/img?file_no=${cinema2.FILES_NO}" width="200" height="150"></h3>
				</a>
				</c:forEach>
              </div>
            </div>
        </div>
      </div>
    </div>
    <div>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</div>
    	<c:forEach var="list" items="${timelist }">
			<span>${list}</span>
			<a class="time" href="#"><sapn>${list[0]}${list[1]}${list[2]}</sapn></a>
		</c:forEach>
    <div>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</div>
    <div id="movietime">
    </div>
    <div>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</div>
    <input type="hidden" value="${cinema_no}" name="cinema_no">
    <c:forEach var="screen" items="${screen_list}">
		<h1>${screen}</h1>
	</c:forEach>
		<h1>상영시간표 자르기</h1>
	<c:forEach items="${list}" var="mlist" >
		<c:forEach items="${mlist.list}" var="slist">
			<c:forEach items="${slist.list}" var="list">
				<h5>${list}</h5>
			</c:forEach>
			<h5>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</h5>
	</c:forEach>
	</c:forEach>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  </body>
</html>