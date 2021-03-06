<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상영관 등록 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	
    <tbody>
        <form action="admininsert" method="post">
<!--             <tr>
                <th>매니저번호 입력창</th>
                <td><input type="text" name="admin_no" placeholder="매니저번호" required></td>
            </tr> -->
			<tr> 
				<th>
					<td>상영관 등록</td>
				</th>
			</tr>
			<tr>
                <th>극장선택</th>
                <td>
                <select name="cinema_no" style="width: 180px; height: 25px;">
						<option>극장을 선택하세요</option>
					<c:forEach var="cinemaDto" items="${cinemaDto}">
						<option value="${cinemaDto.cinema_no}">${cinemaDto.cinema_area}</option>
					</c:forEach>	
				</select>
				</td>
            </tr>
            
            <tr>
                <th>상영관 등록창</th>
                <td>
                	<input type="text" name="screen_type" placeholder="상영관종류">
                	<input type="text" name="screen_name" placeholder="상영관이름">
                	<input type="text" name="screen_rowsize" placeholder="상영관줄">
                	<input type="text" name="screen_colsize" placeholder="상영관칸">
                </td>
            </tr>
            
            <tr style="text-align: center;">
                <td colspan="2" >
                    <input class="btn btn-danger" type="submit" value="상영관등록">
                    <a class="underlineHover" href="/com.kh.cgx/admin/screen/adminlist">
                    	<input class="btn btn-info" value="상영관목록보기">
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
       