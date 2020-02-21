<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>


<jsp:include page="header.jsp"></jsp:include> 


      <!-- 헤더 끝 -->
      

      <h1>${sessionScope.id }</h1>

      
     <body>
    <div class="jumbotron">
        <h1>LATTE CINEMA 영화 트레일러</h1>
        <h3>영화관보고싶지?</h3>
    </div>   
    
    <div class="container-fluid">
    <div class="row">
            <div class="col-md-4">
              <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/resources/img/3.jpg" alt="...">
                <div class="caption">
                  <h3>1번 영화</h3>
                  <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
                <div class="thumbnail">
                  <a href="/com.kh.cgx/movie/review"><img src="${pageContext.request.contextPath}/resources/img/4.jpg" alt="..."></a>
                  <div class="caption">
                    <h3>2번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="thumbnail">
                  <img src="${pageContext.request.contextPath}/resources/img/5.jpg" alt="...">
                  <div class="caption">
                    <h3>3번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="thumbnail">
                  <img src="${pageContext.request.contextPath}/resources/img/2.jpg" alt="...">
                  <div class="caption">
                    <h3>4번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="thumbnail">
                  <img src="${pageContext.request.contextPath}/resources/img/1.jpg" alt="...">
                  <div class="caption">
                    <h3>5번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="thumbnail">
                  <img src="${pageContext.request.contextPath}/resources/img/girl.jpg" alt="..">
                  <div class="caption">
                    <h3>6번 영화</h3>
                    <p><a href="#" class="btn btn-default" role="button">예매하기</a></p>
                  </div>
                </div>
              </div>
    </div>
    </div>

    <div class="jumbotron">
        <h1>LATTE CINEMA 푸터자리</h1>
        <h3>영화관보고싶지?</h3>
    </div>   
</body> 
      
      
      
      
      
      
      
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
