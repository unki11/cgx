<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <h1>상영관 등록 페이지</h1>

<form action="adminInsert" method="post">
<!-- 	<input type="text" name="cinema_no" placeholder="극장번호"> -->
	<h3>극장선택</h3>
	<select name="cinema_no">
		<c:forEach var="cinemaDto" items="${cinemaDto}">
			<option>${cinemaDto.cinema_no}</option>
		</c:forEach>	
	</select>
	<br><br>	
<!-- 	<input type="text" name="screen_no" placeholder="상영관선택">	 -->
	<h3>상영관선택</h3>
	<select name="screen_no">
		<c:forEach var="screenDto" items="${screenDto}">
			<option>${screenDto.screen_no}</option>
		</c:forEach>
	</select>
		
	<br><br>
	<input type="text" name="screen_all_seat" placeholder="전체좌석수"><br><br>
	<input type="text" name="screen_type" placeholder="상영관종류"><br><br>
	<input type="text" name="screen_name" placeholder="상영관이름"><br><br>
	<input type="text" name="screen_rowsize" placeholder="상영관줄"><br><br>
	<input type="text" name="screen_colsize" placeholder="상영관칸"><br><br>
	<input type="submit" value="상영관등록">
</form> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상영관 등록 페이지</title>
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
</style>
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <thead>
        <caption> 상영관 등록  </caption>
    </thead>
    
    <tbody>
        <form action="adminInsert" method="post">
<!--             <tr>
                <th>매니저번호 입력창</th>
                <td><input type="text" name="admin_no" placeholder="매니저번호" required></td>
            </tr> -->
			
			<tr>
                <th>극장선택</th>
                <td>
                <select name="cinema_no">
					<c:forEach var="cinemaDto" items="${cinemaDto}">
						<option>${cinemaDto.cinema_no}</option>
					</c:forEach>	
				</select>
				</td>
            </tr>
            
            <tr>
                <th>상영관선택</th>
                <td>
                <input type="text" name="screen_no" placeholder="상영관입력">
                <%-- <select name="screen_no">
					<c:forEach var="screenDto" items="${screenDto}">
						<option>${screenDto.screen_no}</option>
					</c:forEach>
				</select> --%>
                </td>
            </tr>
            
            <tr>
                <th>상영관 등록창</th>
                <td>
                	<input type="text" name="screen_all_seat" placeholder="전체좌석수">
                	<input type="text" name="screen_type" placeholder="상영관종류">
                	<input type="text" name="screen_name" placeholder="상영관이름">
                	<input type="text" name="screen_rowsize" placeholder="상영관줄">
                	<input type="text" name="screen_colsize" placeholder="상영관칸">
                </td>
            </tr>
            
            <tr>
                <td colspan="2" >
                    <input type="submit" value="상영관등록">
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</body>
</html>