<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<jsp:include page="../header.jsp"></jsp:include>
<style>

</style>
</head>	
<br><br><br><br>
<div class="sect-finder" align="center">

		<a href="/com.kh.cgx/goods/categorypage?goods_category=콤보">
			<button class="btn btn-danger" style="font-size: 2.3rem">
				콤보
			</button>
		</a>
		<a href="/com.kh.cgx/goods/categorypage?goods_category=팝콘">
			<button class="btn btn-danger" style="font-size: 2.3rem">
				팝콘
			</button>
		</a>
		<a href="/com.kh.cgx/goods/categorypage?goods_category=음료">
			<button class="btn btn-danger" style="font-size: 2.3rem">
				음료
			</button>
		</a>
		<br><br><br><br>
</div>
	<div class="container-fluid">
	<div class="row">
		<c:forEach var="ist" items="${list}">
		<div class="col-md-4">
            <div class="card h-100">
              <a href="#">
              	<!-- <img class="card-img-top" src="image/기생충.jpg" alt=""> -->
              	<img src="${pageContext.request.contextPath}/resources/img/popcon.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">팝콘</a>
                </h4>
                	<h5>${ist.GOODS_NAME}</h5>
                	<h5>${ist.GOODS_PRICE}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
            </div>
          </div>
		</c:forEach>
	</div>
	</div>
	
		<div class="row">
		<c:forEach var="ist" items="${list}">
		<div class="col-md-4">
            <div class="card h-100">
              <a href="#">
              	<!-- <img class="card-img-top" src="image/기생충.jpg" alt=""> -->
              	<img src="${pageContext.request.contextPath}/resources/img/cola.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">콜라</a>
                </h4>
                	<h5>${ist.GOODS_NAME}</h5>
                	<h5>${ist.GOODS_PRICE}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
            </div>
          </div>
		</c:forEach>
		</div>
		
		<div class="row">
		<c:forEach var="ist" items="${list}">
		<div class="col-md-4">
            <div class="card h-100">
              <a href="#">
              	<!-- <img class="card-img-top" src="image/기생충.jpg" alt=""> -->
              	<img src="${pageContext.request.contextPath}/resources/img/ade.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">팝콘</a>
                </h4>
                	<h5>${ist.GOODS_NAME}</h5>
                	<h5>${ist.GOODS_PRICE}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
            </div>
          </div>
		</c:forEach>
		</div>
		
		<div class="row">
		<c:forEach var="ist" items="${list}">
		<div class="col-md-4">
            <div class="card h-100">
              <a href="#">
              	<!-- <img class="card-img-top" src="image/기생충.jpg" alt=""> -->
              	<img src="${pageContext.request.contextPath}/resources/img/americano.jpg">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">음료</a>
                </h4>
                	<h5>${ist.GOODS_NAME}</h5>
                	<h5>${ist.GOODS_PRICE}</h5>
                	<p class="card-text"></p>
                <button>구매하기</button>
              </div>
            </div>
          </div>
		</c:forEach>
		</div>        	
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
