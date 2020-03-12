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
			url:"managerinsert/movie",
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
		
		var admin_no = ${sessionScope.admin_no};
		console.log(admin_no)
		
		$.ajax({
			url:"managerinsert/cinema?no="+admin_no, // 1은 매니저 번호 자리
			method:"get",
			success:function(data){
				console.log("성공")
				console.log(data)
				$.each(data, function(index){
					var cinema = data[index].cinema_no;
					var area = data[index].cinema_area;
					 $("<option>").text(area).attr("value",cinema).appendTo("#cinema");
					 
				})
				
			 $("#cinema").change(function(){
	             //this == select
	             var cinema = $(this).val();
				
				$.ajax({
					url:"managerinsert/screen?no="+cinema,
					method:"get",
					success:function(data){
						
						$.each(data, function(index){
							var screen = data[index].screen_no;
							var name = data[index].screen_name;
							 $("<option>").text(name).attr("value",screen).appendTo("#screen");
						})
					}
				})	
			})
			}
		})
				$("#timedate").click(function(){
						var date = $(this).val();
						console.log(date);
					})
	})
</script>
<%-- <h1>매니저 페이지</h1>
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
	
	<h3>상영시간입력</h3>
	<input id="date" type="date" name="movietime_time" placeholder="상영날짜입력"><br><br><br>
	<select name="movietime_hour" required>
		<c:forEach var="hour" begin="00" end="23">
			<option>${hour}</option>
		</c:forEach>
	</select>
	시
	<select name="movietime_min" required>
		<c:forEach var="min" begin="00" end="55" step="5">
			<option>${min}</option>
		</c:forEach>
	</select>
	분
	<br><br><br>
	<h3>영화가격입력</h3>
	<input type="text" name="movietime_price" placeholder="가격"><br><br><br>
	<input type="submit" value="상영시간 등록">
</form> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상영시간표 등록 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style>
	body{
		margin-top: 150px;
		background-image: url("${pageContext.request.contextPath}/resources/img/all.jpg");
		background-size: cover;
	}
	
	html{
		background-image: url("${pageContext.request.contextPath}/resources/img/latte2.png");
		background-repeat: no-repeat;
		background-position: top;
	}

</style>
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <thead>
        <caption> 상영시간표 등록  </caption>
    </thead>    
    <tbody>
        <form action="managerinsert" method="post">
            
            <tr>
                <th>영화 선택창</th>
                <td>
                	<select name="movie_no" id="movie">
						<option>영화를 선택하세요</option>
					</select>
                </td>
            </tr>
            
            <tr>
                <th>극장 선택창</th>
                <td>
                	<select name="cinema_no" id="cinema">
						<option>극장을 선택하세요</option>
					</select>
                </td>
            </tr>
            
            <tr>
                <th>상영관 선택창</th>
                <td>
                	<select name="screen_no" id="screen">
						<option>${screenDto.screen_no}</option>
					</select>
                </td>
            </tr>
            
            <tr>
                <th>상영시간 등록창</th>
                <td>
                	<input id="date" type="date" name="movietime_time" placeholder="상영날짜입력">
                	<select name="movietime_hour" required>
						<c:forEach var="hour" begin="00" end="23">
							<option>${hour}</option>
						</c:forEach>
					</select>
					시
					<select name="movietime_min" required>
						<c:forEach var="min" begin="00" end="55" step="5">
							<option>${min}</option>
						</c:forEach>
					</select>
					분
                </td>
            </tr>
            
            <tr>
                <th>영화 가격 등록창</th>
                <td>
                	<input type="text" name="movietime_price" placeholder="가격">
                </td>
            </tr>
					
            <tr style="text-align: center;">
                <td colspan="2" >
                    <input type="submit" value="상영시간표 등록하기" class="btn btn-danger">
                <a class="underlineHover" href="http://${pageContext.request.contextPath}/com.kh.cgx/">
                    <input class="btn btn-info" value="메인화면가기">
                </a>
                
          		<a class="underlineHover" href="${pageContext.request.contextPath}/admin/adminlogout">
             		<input class="btn btn-danger" value="로그아웃">
          		</a>
                </td>

            </tr>
        </form>
    </tbody>
</table>
</div>
</body>
</html>