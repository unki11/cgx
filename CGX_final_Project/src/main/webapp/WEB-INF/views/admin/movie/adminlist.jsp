<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
	body{
		background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
		text-align: center;
	}
	.row {
      margin-bottom: 10px;
    }
</style>
<script>
	$(document).ready(function(){
		$(".delete").click(function(){
			var movieno = $(this).parent().find(".no").text();
			
			$.ajax({
				url:"admindelete?no="+movieno,
				type:"get",
				success:function(resp){
					console.log("성공")
					window.location.reload(true);
				}
			})
		})
		
		$(".update").click(function() {
			
			if($(this).text()=="수정"){
				var movieno = $(this).parent().find(".no").text();
				
				var movietitleCell = $(this).parent().find(".title");
				var movietitle = movietitleCell.text();
					movietitleCell.empty();
				
				var moviedirectorCell = $(this).parent().find(".director");
				var moviedirector = moviedirectorCell.text();
					moviedirectorCell.empty();
					
				var moviestartdateCell = $(this).parent().find(".startdate");
				var moviestartdate = moviestartdateCell.text();
					moviestartdateCell.empty();
					
				var movieruntimeCell = $(this).parent().find(".runtime");
				var movieruntime = movieruntimeCell.text();
					movieruntimeCell.empty();
					
				var moviecountryCell = $(this).parent().find(".country");
				var moviecountry = moviecountryCell.text();
					moviecountryCell.empty();
					
				var moviegradeCell = $(this).parent().find(".grade");
				var moviegrade = moviegradeCell.text();
					moviegradeCell.empty();
					
				var moviestatusCell = $(this).parent().find(".status");
				var moviestatus = moviestatusCell.text();
					moviestatusCell.empty();
					
				var moviepublisherCell = $(this).parent().find(".publisher");
				var moviepublisher = moviepublisherCell.text();
					moviepublisherCell.empty();
					
				var moviegenreCell = $(this).parent().find(".genre");
				var moviegenre = moviegenreCell.text();
					moviegenreCell.empty();
					
				
				$("<input>").val(movietitle).appendTo(movietitleCell);
				$("<input>").val(moviedirector).appendTo(moviedirectorCell);
				$("<input>").val(moviestartdate).appendTo(moviestartdateCell);
				$("<input>").val(movieruntime).appendTo(movieruntimeCell);
				$("<input>").val(moviecountry).appendTo(moviecountryCell);
				$("<input>").val(moviegrade).appendTo(moviegradeCell);
				$("<input>").val(moviestatus).appendTo(moviestatusCell);
				$("<input>").val(moviepublisher).appendTo(moviepublisherCell);
				$("<input>").val(moviegenre).appendTo(moviegenreCell);
				$(this).text("완료");
				
				$(this).click(function(){
					var movieno = $(this).parent().find(".no").text();
					
					var movietitleCell = $(this).parent().find(".title");
					var movietitle = movietitleCell.text();
					
					var moviedirectorCell = $(this).parent().find(".director");
					var moviedirector = moviedirectorCell.text();
					
					var moviestartdateCell = $(this).parent().find(".startdate");
					var moviestartdate = moviestartdateCell.text();
					
					var movieruntimeCell = $(this).parent().find(".runtime");
					var movieruntime = movieruntimeCell.text();
					
					var moviecountryCell = $(this).parent().find(".country");
					var moviecountry = moviecountryCell.text();
					
					var moviegradeCell = $(this).parent().find(".grade");
					var moviegrade = moviegradeCell.text();
					
					var moviestatusCell = $(this).parent().find(".status");
					var moviestatus = moviestatusCell.text();
					
					var moviepublisherCell = $(this).parent().find(".publisher");
					var moviepublisher = moviepublisherCell.text();
					
					var moviegenreCell = $(this).parent().find(".genre");
					var moviegenre = moviegenreCell.text();
					
					var alldata = {"movie_no":movieno,"movie_title":movietitle,"movie_director":moviedirector,
									"movie_startdate":moviestartdate,"movie_runtime":movieruntime,
									"movie_country":moviecountry,"movie_grade":moviegrade,
									"movie_status":moviestatus,"movie_publisher":moviepublisher,"movie_genre":moviegenre}
					console.log(alldata);
					$.ajax({
						url:"adminupdate",
						type:"post",
						data: alldata,
						success:function(resp){
							console.log("성공")
						}
					})
				})
				
			}
			else{
				var movietitleCell = $(this).parent().find(".title");
				//입력창이 하나 더 있음
				var titleinput = movietitleCell.find("input");
				var movietitle = titleinput.val();
				movietitleCell.empty();
				movietitleCell.text(movietitle);
				
				var moviedirectorCell = $(this).parent().find(".director");
				var directorinput = moviedirectorCell.find("input");
				var moviedirector = directorinput.val();
				moviedirectorCell.empty();
				moviedirectorCell.text(moviedirector);
				
				var moviestartdateCell = $(this).parent().find(".startdate");
				var startdateinput = moviestartdateCell.find("input");
				var moviestartdate = startdateinput.val();
				moviestartdateCell.empty();
				moviestartdateCell.text(moviestartdate);
				
				var movieruntimeCell = $(this).parent().find(".runtime");
				var runtimeinput = movieruntimeCell.find("input");
				var movieruntime = runtimeinput.val();
				movieruntimeCell.empty();
				movieruntimeCell.text(movieruntime);
				
				var moviecountryCell = $(this).parent().find(".country");
				var countryinput = moviecountryCell.find("input");
				var moviecountry = countryinput.val();
				moviecountryCell.empty();
				moviecountryCell.text(moviecountry);
				
				var moviegradeCell = $(this).parent().find(".grade");
				var gradeinput = moviegradeCell.find("input");
				var moviegrade = gradeinput.val();
				moviegradeCell.empty();
				moviegradeCell.text(moviegrade);
				
				var moviestatusCell = $(this).parent().find(".status");
				var statusinput = moviestatusCell.find("input");
				var moviestatus = statusinput.val();
				moviestatusCell.empty();
				moviestatusCell.text(moviestatus);
				
				var moviepublisherCell = $(this).parent().find(".publisher");
				var publisherinput = moviepublisherCell.find("input");
				var moviepublisher = publisherinput.val();
				moviepublisherCell.empty();
				moviepublisherCell.text(moviepublisher);
				
				var moviegenreCell = $(this).parent().find(".genre");
				var genreinput = moviegenreCell.find("input");
				var moviegenre = genreinput.val();
				moviegenreCell.empty();
				moviegenreCell.text(moviegenre);
					
				
				$(this).text("수정");
			}
		
		});
	});
</script> 
<%-- <h1>영화 목록 페이지</h1>

<c:forEach var="movieDto" items="${list}">
	<div>
		<p class="no">${movieDto.movie_no}</p>
		<img src="${pageContext.request.contextPath}/download/img?file_no=${movieDto.files_no}">
		<p>${movieDto.files_no}</p> 
		<p class="title">${movieDto.movie_title}</p>
		<p class="director">${movieDto.movie_director}</p>
		<p>${movieDto.movie_ticket_rate}</p>
		<p class="startdate">${movieDto.movie_startdate}</p>
		<p class="runtime">${movieDto.movie_runtime}</p>
		<p class="country">${movieDto.movie_country}</p>
		<p class="grade">${movieDto.movie_grade}</p>
		<p class="status">${movieDto.movie_status}</p>
		<p class="publisher">${movieDto.movie_publisher}</p>
		<p class="genre">${movieDto.movie_genre}</p>
		<button class="delete">삭제</button>
		<button class="update">수정</button>
	</div>

</c:forEach> --%>

<html>
<body>
      <div class="container">
      <div class="row">
        <div class="col">
          <h2>영화목록</h2>
          <a class="underlineHover" href="/com.kh.cgx/admin/adminlist">
             <input class="btn btn-info" value="관리자메인화면가기">
          </a>
          <ul class="list-group">
          <c:forEach var="movieDto" items="${list}">
	          <div>
	          	<ul type="square">
		            <li class="no list-group-item-danger active">${movieDto.movie_no}</li>
		            <img src="${pageContext.request.contextPath}/download/img?files_no=${movieDto.files_no }" style="width: 185px; height: 260px">
		            <li class="title">${movieDto.movie_title}</li>
		            <li class="director">${movieDto.movie_director}</li>
		            <li>${movieDto.movie_ticket_rate}</li>
		            <li class="startdate">${movieDto.movie_startdate}</li>
		            <li class="runtime">${movieDto.movie_runtime}</li>
		            <li class="country">${movieDto.movie_country}</li>
		            <li class="grade">${movieDto.movie_grade}</li>
		            <li class="status">${movieDto.movie_status}</li>
		            <li class="publisher">${movieDto.movie_publisher}</li>
		            <li class="genre">${movieDto.movie_genre}</li>
		            <button class="delete btn btn-danger">삭제</button>
		            <button class="update btn btn-warning">수정</button>
		         </ul>   
	           </div>
           </c:forEach>
          </ul>
        </div>
      </div>
    </div>

  </body>
</html>