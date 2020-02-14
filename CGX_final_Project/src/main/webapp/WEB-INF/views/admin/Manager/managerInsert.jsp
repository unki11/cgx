<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script>
	$(function(){
		$.ajax({
			url:"managerInsert/movie",
			method:"get",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(data){
				console.log(data)
				
				$.each(data, function(index){
					var movie = data[index].movie_title;
					var movieno = data[index].movie_no;
					 $("<option>").text(movie).attr("value",movieno).appendTo("#movie");
					 console.log(movieno);
				})
				
			}
			
		})
		
		$.ajax({
			url:"managerInsert/cinema?no="+1, // 1은 매니저 번호 자리
			method:"get",
			success:function(data){
				console.log("성공")
				
				$.each(data, function(index){
					var cinema = data[index].cinema_no;
					 $("<option>").text(cinema).attr("value",cinema).appendTo("#cinema");
				})
				
			 $("#cinema").change(function(){
	             //this == select
	             var cinema = $(this).val();
				
				$.ajax({
					url:"managerInsert/screen?no="+cinema,
					method:"get",
					success:function(data){
						
						$.each(data, function(index){
							var screen = data[index].screen_no;
							 $("<option>").text(screen).attr("value",screen).appendTo("#screen");
						})
					}
				})	
			})
			}
		})
	})
</script>
<h1>매니저 페이지</h1>
<h2>상영 시간표 입력</h2>
<form action="managerInsert" method="post">
	<h3>영화선택</h3>
	<select name="movie_no" id="movie">
		<option>영화를선택하세요</option>
	</select>
	<br><br><br>
	
	<h3>극장선택</h3>
	<select name="cinema_no" id="cinema">
		<option>극장을 선택하세요</option>
	</select>
	<br><br><br>

	<h3>상영관선택</h3>
	<select name="screen_no" id="screen">
			<option>${screenDto.screen_no}</option>
	</select>
	<br><br><br>

	<input type="text" name="movietime_tiem" placeholder="시작시간"><br><br><br>
	<input type="text" name="movietime_price" placeholder="가격"><br><br><br>
	<input type="submit" value="상영시간 등록">
</form>