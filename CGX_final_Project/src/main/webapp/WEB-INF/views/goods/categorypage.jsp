<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.row {
		display: flex;
		width: 33.3%;
		
	}
</style>

<div class="sect-finder" align="center">
		<a href="${pageContext.request.contextPath}/goods/
				categorypage?goods_category=콤보">콤보</a>
		<a href="${pageContext.request.contextPath}/goods/
				categorypage?goods_category=팝콘">팝콘</a>
		<a href="${pageContext.request.contextPath}/goods/
				categorypage?goods_category=음료">음료</a>
		<br><br><br><br>
	</div>

<%-- <h4>${list2}</h4> --%>
	<div class="container">
	<div class="row">
	<c:forEach var="ist" items="${list2}">
		<div class="col-md-3">
           <div class="card h-30">
              <a href="#">
              	<img src="${pageContext.request.contextPath}/resources/img/package.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">패키지상품1</a>
                </h4>
                	<h5>${ist.goods_name}</h5>
                	<h5>${ist.goods_price}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
            </div>
          </div>
		</c:forEach>
		
		<c:forEach var="ist" items="${list2}">
		<div class="col-md-3">
            <div class="card h-30">
              <a href="#">
              	<img src="${pageContext.request.contextPath}/resources/img/package2.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">패키지상품2</a>
                </h4>
                	<h5>${ist.goods_name}</h5>
                	<h5>${ist.goods_price}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
            </div>
          </div>
		</c:forEach>
		
		
		<c:forEach var="ist" items="${list2}">
		<div class="col-md-3">
            <div class="card h-30">
              <a href="#">
              	<img src="${pageContext.request.contextPath}/resources/img/package3.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">패키지상품3</a>
                </h4>
                	<h5>${ist.goods_name}</h5>
                	<h5>${ist.goods_price}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
            </div>
          </div>
		</c:forEach>
		
		<c:forEach var="ist" items="${list2}">
		<div class="col-md-3">
            <div class="card h-30">
              <a href="#">
              	<img src="${pageContext.request.contextPath}/resources/img/package4.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">패키지상품4</a>
                </h4>
                	<h5>${ist.goods_name}</h5>
                	<h5>${ist.goods_price}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
           </div>
          </div>
		</c:forEach>
		
		<c:forEach var="ist" items="${list2}">
		<div class="col-md-3">
            <div class="card h-30">
              <a href="#">
              	<img src="${pageContext.request.contextPath}/resources/img/package5.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">패키지상품5</a>
                </h4>
                	<h5>${ist.goods_name}</h5>
                	<h5>${ist.goods_price}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
           </div>
          </div>
		</c:forEach>

		
		<c:forEach var="ist" items="${list2}">
		<div class="col-md-4">
            <div class="card h-100">
              <a href="#">
              	<!-- <img class="card-img-top" src="image/기생충.jpg" alt=""> -->
              	<img src="${pageContext.request.contextPath}/resources/img/combo1.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">콤보상품1</a>
                </h4>
                	<h5>${ist.goods_name}</h5>
                	<h5>${ist.goods_price}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
            </div>
          </div>
		</c:forEach>
		
		<c:forEach var="ist" items="${list2}">
		<div class="col-md-4">
            <div class="card h-100">
              <a href="#">
              	<!-- <img class="card-img-top" src="image/기생충.jpg" alt=""> -->
              	<img src="${pageContext.request.contextPath}/resources/img/combo2.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">콤보상품2</a>
                </h4>
                	<h5>${ist.goods_name}</h5>
                	<h5>${ist.goods_price}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
            </div>
          </div>
		</c:forEach>
	</div>
	</div>

	
