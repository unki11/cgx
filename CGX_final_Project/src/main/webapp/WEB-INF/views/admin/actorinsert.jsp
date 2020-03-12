<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<title>배우 등록 페이지</title>
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
<script>
	$(function(){
		$.ajax({
			url:"actorinsert/movie",
			method:"get",
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
		
	})
</script>

</head>
<body>
<div class="container">
        <form action="actorinsert" method="post">
<table class="table table-bordered">
	
    <tbody>
		<thead style="color: black;">
        	<caption> 배우 등록  </caption>
    	</thead>  

			<tr>
                <th>영화선택</th>
                <td>
                <select name="movie_no" id="movie">
					<option>영화를 선택하세요</option>
				</select>
				</td>
            </tr>
				
            <tr>
                <th>배우이름 등록</th>
                <td>
                	<input type="text" name="actor_name" placeholder="배우이름">
                </td>
            </tr>
						
            
            <tr style="text-align: center;">
                <td colspan="2" >
                    <input class="btn btn-danger" type="submit" value="배우등록">
                    
                    <a class="underlineHover" href="/com.kh.cgx/admin/adminlist">
                    	<input class="btn btn-info" value="관리자메인화면가기">
                    </a>
                </td>
            </tr>
    </tbody>
</table>
        </form>
</div>
</body>
</html>