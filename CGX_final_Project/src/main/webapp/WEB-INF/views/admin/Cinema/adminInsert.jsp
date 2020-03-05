<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <h1>극장 등록 페이지</h1>
<form action="adminInsert" method="post">
	<input type="text" name="cinema_no" placeholder="극장번호"><br><br>
	<input type="text" name="files_no" placeholder="사진번호"><br><br>
>>>>>>> refs/remotes/origin/master
	<input type="text" name="cinema_area" placeholder="극장지역"><br><br>
	<input type="text" name="cinema_phone" placeholder="극장전화번호"><br><br>
	<input type="text" name="cinema_addr" placeholder="극장주소"><br><br>
	<input type="submit" value="극장등록">
</form> -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>극장 등록 페이지</title>
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
</style>
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <thead>
        <caption> 극장 등록  </caption>
    </thead>
    
    <tbody>
        <form action="adminInsert" method="post" enctype="multipart/form-data">
            
            <tr>
                <th>극장 사진 등록창</th>
                <td><input type="file" name="files" placeholder="사진번호"></td>
            </tr>
            
            <tr>
                <th>극장 지역 등록창</th>
                <td><input type="text" name="cinema_area" placeholder="극장지역" required></td>
            </tr>
            
            <tr>
                <th>극장 전화번호 등록창</th>
                <td><input type="text" name="cinema_phone" placeholder="극장전화번호" required></td>
            </tr>
            
            <tr>
                <th>극장 주소 등록창</th>
                <td><input type="text" name="cinema_addr" placeholder="극장주소" required></td>
            </tr>
            
            <tr style="text-align: center;">
                <td colspan="2" >
                    <input type="submit" value="극장 등록하기" class="btn btn-danger">
                    <a class="underlineHover" href="/com.kh.cgx/admin/Cinema/adminList">
                    	<input class="btn btn-info" value="극장목록보기">
                    </a>
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</body>
</html>