<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <style>
        
        .bg-1light{
            background-color: #efe4b0;
        }
    </style>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-1light">
        <a class="navbar-brand" href="http://www.cgv.co.kr/"><img src="/image/cgv2.png"></a>
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
                <a class="dropdown-item" href="/com.kh.cgx/user/mypage">내정보</a>
                <a class="dropdown-item" href="/com.kh.cgx/user/login">login</a>
                <a class="dropdown-item" href="<c:url value="/user/joinWhether" />">join</a>
                <a class="dropdown-item" href="/com.kh.cgx/user/find_id">find_id</a>
                <a class="dropdown-item" href="/com.kh.cgx/user/find_pw">find_pw</a>
                <a class="dropdown-item" href="/com.kh.cgx/user/logout">LogOut</a>
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
                <a class="dropdown-item" href="#">기프트샵</a>
              </div>
            </li>
          </ul>
          <form class="form-inline my-2 my-lg-3">
            <input class="form-control mr-lg-4" type="search" placeholder="영화검색" aria-label="Search">
            <button class="btn btn-outline-success my-3 my-lg-3" type="submit">검색하기</button>
          </form>
        </div>
      </nav>
      <!-- 헤더 끝 -->
      
      <h1>${sessionScope.id }</h1>
      <h1>${id }</h1>
      
      <!-- 푸터시작 -->
          <footer class=" bg-1light">

        <h2>로고</h2>
 <a href="#"><strong>회원약관</strong></a>|
 <a href="#"><strong>개인정보처리방침</strong></a>|
 <a href="#"><strong>이메일무단수집거부</strong></a>| 
 <a href="#"><strong>영상정보처리기기 운영.관리방침</strong></a> |
 <a href="#"><strong>기업정보</strong></a>
 <br><br>
 

 <p>(07212)서울 영등포구 선유동2로 57 이레빌딩 </p>
<p>대표이사 :흠냐냐  |사업자등록번호 : 104-88-12345 | 통신판매업신고번호 : 2019-서울-1234 |  </p> 사업자정보확인

호스팅사업자 : CGX |책임자 : 흠흠냐 |대표이메일 : hagisilta@ah.net |CGV고객센터 : 1004-1004
 © CJ CGV. All Rights Reserved
</footer>
</body>
</html>
