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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/secom.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
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
<%-- <div class="container">
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
</div> --%>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="${pageContext.request.contextPath}/resources/img/latte2.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form action="adminLogin" method="post">
      <input type="text" id="login" class="fadeIn second" name="admin_id" placeholder="매니저아이디" required>
      <input type="password" id="password" class="fadeIn third" name="admin_pw" placeholder="매니저비밀번호" required>
      <input type="submit" class="fadeIn fourth" value="로그인 " style="background-color: red;">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="/com.kh.cgx/admin/adminList">매니저목록보기</a>
    </div>

  </div>
</div>
</body>
</html>