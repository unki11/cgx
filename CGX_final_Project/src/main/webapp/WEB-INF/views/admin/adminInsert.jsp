<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <h1>관리자 페이지</h1>
<h3>매니저 등록</h3>

<form action="adminInsert" method="post">
	<input type="text" name="admin_no" placeholder="관리자번호"><br><br>
	<input type="text" name="admin_id" placeholder="관리자아이디"><br><br>
	<input type="password" name="admin_pw" placeholder="관리자비밀번호"><br><br>
	<input type="text" name="admin_grade" placeholder="관리자직급"><br><br>
	<input type="submit" value="등록하기">
</form> -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>매니저 등록 페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/crypto/secom.js"></script>
<style>
	body{
		margin-top: 150px;
		
	}
	
	.container{
		opacity: 3;
		text-align: center;
		color: black;
	}
</style>
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <thead>
        <caption> 매니저 등록  </caption>
    </thead>
    
    <tbody>
        <form action="adminInsert" method="post">
<!--             <tr>
                <th>매니저번호 입력창</th>
                <td><input type="text" name="admin_no" placeholder="매니저번호" required></td>
            </tr> -->
			
			<tr>
                <th>매니저 아이디 등록창</th>
                <td><input type="text" name="admin_id" placeholder="매니저아이디" required></td>
            </tr>
            
            <tr>
                <th>매니저 비밀번호 등록창</th>
                <td><input type="password" name="admin_pw" placeholder="매니저비밀번호" required></td>
            </tr>
            
            <tr>
                <th>매니저 등급 등록창</th>
                <td><input type="text" name="admin_grade" placeholder="매니저등급" required></td>
            </tr>
            
            <tr>
                <td colspan="2" >
                    <input type="submit" value="매니저등록하기" style="color: black;">
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