<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>영화 등록 페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
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
	.container{
		text-align: center;
	}
</style>
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <thead>
        <caption> 영화 등록  </caption>
    </thead>
    
    <tbody>
        <form action="admininsert" method="post" enctype="multipart/form-data">

			<tr>
                <th>영화포스터 등록창</th>
                <td><input type="file" name="files" placeholder="사진번호"></td>
            </tr>
            
            <!-- <tr>
                <th>예매율 창</th>
                <td><input type="text" name="movie_ticket_rate" placeholder="영화예매율" required></td>
            </tr> -->
            
            <tr>
                <th>영화 제목 등록창</th>
                <td><input type="text" name="movie_title" placeholder="영화제목" required></td>
            </tr>
            
            <tr>
                <th>영화 감독 등록창</th>
                <td><input type="text" name="movie_director" placeholder="영화감독" required></td>
            </tr>
            
            <tr>
                <th>영화 개봉일자 등록창</th>
                <td><input type="text" name="movie_startdate" placeholder="영화개봉일자" required></td>
            </tr>
            
            <tr>
                <th>영화 상영시간 등록창</th>
                <td>
                	<input type="text" name="movie_runtime" placeholder="영화상영시간" required>
                </td>
            </tr>
            
            <tr>
                <th>영화 제작 국가 등록창</th>
                <td>
                	<!-- <input type="text" name="movie_country" placeholder="영화국가" required> -->
                	<select name="movie_country" style="width: 180px; height: 25px;">
                		<option>영화 제작 국가 선택</option>
                		<option>한국</option>
                		<option>미국</option>
                		<option>일본</option>
                		<option>중국</option>
                		<option>기타</option>
                	</select>
                </td>
            </tr>
            
            <tr>
                <th>영화 관람 등급 등록창</th>
                <td>
                	<!-- <input type="text" name="movie_grade" placeholder="영화관람등급" required> -->
                	<select name="movie_grade" style="width: 180px; height: 25px;">
                		<option>영화 관람 등급 선택</option>
                		<option>전체관람가</option>
                		<option>12세관람가</option>
                		<option>15세관람가</option>
                		<option>청소년관람불가</option>
                	</select>
                </td>
            </tr>
            
            <tr>
                <th>영화 상영 상태 등록창</th>
                <td>
                	<!-- <input type="text" name="movie_status" placeholder="영화상영상태" required> -->
                	<select name="movie_status" style="width: 180px; height: 25px;">
                		<option>영화상영 상태 선택</option>
                		<option>상영중</option>
                		<option>개봉예정작</option>
                	</select>
                </td>
            </tr>
            
            <tr>
                <th>영화 장르 등록창</th>
                <td>
                	<!-- <input type="text" name="movie_genre" placeholder="영화장르" required> -->
                	<select name="movie_genre" style="width: 180px; height: 25px;">
                		<option>영화 장르 선택</option>
                		<option>호러</option>
                		<option>판타지</option>
                		<option>로맨스</option>
                		<option>코믹</option>
                		<option>애니메이션</option>
                		<option>스릴러</option>
                		<option>액션</option>
                		<option>에로</option>
                	</select>
                </td>
            </tr>
            
            <tr>
                <th>영화 배급사 등록창</th>
                <td><input type="text" name="movie_publisher" placeholder="영화배급사" required></td>
            </tr>
            
            <tr>
                <th>영화 내용 등록창</th>
                <td><input type="text" name="movie_content" placeholder="영화줄거리" required></td>
            </tr>
            
            <tr style="text-align: center;">
                <td colspan="2" >
                    <input type="submit" value="영화 등록하기" class="btn btn-danger">
                    <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                    <a class="btn btn-default" type="reset"> reset </a>
                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
                	<a class="underlineHover" href="/com.kh.cgx/admin/movie/adminlist">
                    	<input class="btn btn-info" value="영화목록보기">
                    </a>
                    
                    <a class="underlineHover" href="/com.kh.cgx/admin/adminlist">
                    	<input class="btn btn-info" value="관리자메인화면가기">
                    </a>
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</body>
</html>