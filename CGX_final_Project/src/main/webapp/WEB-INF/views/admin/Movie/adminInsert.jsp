<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <h1>영화 등록 페이지 </h1>
<form action="adminInsert" method="post">
	
	<input type="text" name="movie_no" placeholder="영화번호"><br><br>

	<input type="text" name="files_no" placeholder="사진번호"><br><br>
	<input type="text" name="movie_ticket_rate" placeholder="영화예매율"><br><br>
	<input type="text" name="movie_title" placeholder="영화제목"><br><br>
	<input type="text" name="movie_director" placeholder="영화감독"><br><br>
	<input type="text" name="movie_startdate" placeholder="영화개봉일자"><br><br>
	<input type="text" name="movie_runtime" placeholder="영화상영시간"><br><br>
	<input type="text" name="movie_country" placeholder="영화국가"><br><br>
	<input type="text" name="movie_grade" placeholder="영화관람등급"><br><br>
	<input type="text" name="movie_status" placeholder="영화상영상태"><br><br>
	<input type="text" name="movie_genre" placeholder="영화장르"><br><br>
	<input type="text" name="movie_publisher" placeholder="영화배급사"><br><br>
	<input type="text" name="movie_content" placeholder="영화줄거리"><br><br>

	<input type="submit" value="영화등록">
</form> -->

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
		margin-top: 100px;
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
        <form action="adminInsert" method="post">

			<tr>
                <th>사진 등록창</th>
                <td><input type="text" name="files_no" placeholder="사진번호" required></td>
            </tr>
            
            <tr>
                <th>예매율 창</th>
                <td><input type="text" name="movie_ticket_rate" placeholder="영화예매율" required></td>
            </tr>
            
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
                <td><input type="text" name="movie_runtime" placeholder="영화상영시간" required></td>
            </tr>
            
            <tr>
                <th>영화 제작 국가 등록창</th>
                <td><input type="text" name="movie_country" placeholder="영화국가" required></td>
            </tr>
            
            <tr>
                <th>영화 관람 등급 등록창</th>
                <td><input type="text" name="movie_grade" placeholder="영화관람등급" required></td>
            </tr>
            
            <tr>
                <th>영화 상영 상태 등록창</th>
                <td><input type="text" name="movie_status" placeholder="영화상영상태" required></td>
            </tr>
            
            <tr>
                <th>영화 장르 등록창</th>
                <td><input type="text" name="movie_genre" placeholder="영화장르" required></td>
            </tr>
            
            <tr>
                <th>영화 배급사 등록창</th>
                <td><input type="text" name="movie_publisher" placeholder="영화배급사" required></td>
            </tr>
            
            <tr>
                <th>영화 내용 등록창</th>
                <td><input type="text" name="movie_content" placeholder="영화줄거리" required></td>
            </tr>
            
            <tr>
                <td colspan="2" >
                    <input type="submit" value="영화 등록하기">
                    <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                    <a class="btn btn-default" type="reset"> reset </a>
                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</body>
</html>