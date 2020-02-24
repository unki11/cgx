<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <h1>매니저 로그인 페이지</h1>

<form action="adminLogin" method="post">
	<input type="text" name="admin_id" placeholder="ID" required><br><br>
	<input type="password" name="admin_pw" placeholder="Password" required><br><br>
	<input type="submit" value="로그인">
</form> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>매니저 로그인 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/secom.js"></script>
<style>
	body{
		margin-top: 150px;
	}
</style>
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <thead>
        <caption> 매니저 로그인  </caption>
    </thead>
    
    <tbody>
        <form action="adminLogin" method="post">
            <tr>
                <th>아이디입력창</th>
                <td><input type="text" name="admin_id" placeholder="ID" required></td>
            </tr>
			
			<tr>
                <th>비밀번호입력창</th>
                <td><input type="password" name="admin_pw" placeholder="Password" required></td>
            </tr>
            <tr>
                <td colspan="2" >
                    <input type="submit" value="로그인">
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