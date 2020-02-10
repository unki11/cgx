<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 <style>
      p { margin:20px 0px; }
    </style>
  <body>
  <h1>cinema페이지입니다</h1>	
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Tab</p>
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">서울</a>
              </li>    
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd">경기</a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
               <c:forEach var="cinema1" items="${cinema_list1}">
               <a href="?cinema_no=${cinema1.CINEMA_NO}">
				<h3>${cinema1}</h3>
				<h3>시네마 ${cinema1.CINEMA_NO}</h3>
				<h3><img src="download?file_no=${cinema1.FILES_NO}" width="200" height="150"></h3>
				</a>
			</c:forEach>
              </div>
              <div class="tab-pane fade" id="asd">
                <c:forEach var="cinema2" items="${cinema_list2}">
                <a href="?cinema_no=${cinema2.CINEMA_NO}">
					<h3>${cinema2}</h3>
					<h3>${cinema2.FILES_NO}</h3>
				<h3><img src="download?file_no=${cinema2.FILES_NO}" width="200" height="150"></h3>
				</a>
				</c:forEach>
              </div>
            </div>
        </div>
      </div>
    </div>
    <c:forEach var="screen" items="${screen_list}">
		<h1>${screen}</h1>
	</c:forEach>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  </body>
</html>