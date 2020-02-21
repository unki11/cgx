<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <!--   <script src="https://code.jquery.com/jquery-3.4.1.slim.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"  type="text/javascript"></script> -->
<!--   <script src="http://code.jquery.com/jquery-1.11.1.js" type="text/javascript"></script> -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <style>
        
        .bg-1light{
            background-color: #efe4b0;
        }
    </style>
    <script type="text/javascript">
    
    function fn_search(){
         
 		var keyword = $('#keyWord').val();
 		
 		if(keyword !="" && keyword !=null){
    		window.location.href = '/com.kh.cgx/movie/searchview?keyword='+	keyword; 
 		}else{
 			alert("검색어를 입력해주세요.");
 		}
  
    }
    
    </script>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-1light">
        <a class="navbar-brand" href="http://localhost:8080/com.kh.cgx/"><img src="${pageContext.request.contextPath}/resources/img/latte2.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown" style="padding: 3rem;">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
              aria-expanded="false">영화
            </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">무비차트</a>
                <a class="dropdown-item" href="#">HD 트레일러</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">무비파인더</a>
              </div>
            </li>
            <li class="nav-item dropdown" style="padding: 3rem;">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  예매
                </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">빠른예매</a>
                <a class="dropdown-item" href="#">상영시간표</a>
              </div>
            </li>
            <li class="nav-item dropdown" style="padding: 3rem;">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                극장
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">CGV극장</a>
                <a class="dropdown-item" href="#">특별관</a>
              </div>  
            </li>
            <li class="nav-item dropdown" style="padding: 3rem;">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="-1" aria-disabled="true">
                  이벤트
                </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">이벤트</a>
                <a class="dropdown-item" href="/com.kh.cgx/goods/">기프트샵</a>
              </div>
            </li>
             <div>
            <a class="click" href="${pageContext.request.contextPath}/user/login" style="padding: 1rem;"> 로그인</a>
            <a class="click" href="${pageContext.request.contextPath}/user/join" style="padding: 1rem;"> 회원가입</a>
            <a class="click" href="${pageContext.request.contextPath}/mypage/mycgv" style="padding: 1rem;"> my cgv</a>
            </div>
          </ul>
            <input class="form-control mr-lg-4" type="text" id="keyWord" placeholder="영화검색" aria-label="Search">
            <button class="btn btn-outline-success my-3 my-lg-3" onclick="fn_search()">검색하기</button>
        </div>
      </nav>
      <!-- 헤더 끝 -->
      