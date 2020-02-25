<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
    
    
         <style>
        * {
            box-sizing: border-box;
        }

        .area-list {
            list-style: none;
            margin: 0;
            padding: 0;
            display: inline-block;
            width: 150px;
        }

        .area-list>li {
            background-color: black;
            color: white;
            padding: 15px;
            cursor: pointer;
        }

        .area-list li:hover {
            background-color: gray;
            color: black;
        }

        /*        2차이상의 메뉴 스타일*/
        .area-list ul {
            list-style: none;
            margin: 0;
            padding: 0;
            position: absolute;
            margin-left: 135px;
            margin-top: -36px;
            /*            2차 이상의 메뉴는 처음에 숨김*/
            display: none;
        }

        .area-list ul>a>li {
            background-color: black;
            color: white;
            padding: 15px;
            width: 150px;
        }

        /*        메뉴를 표시하는 방법*/
        /*        1. hover
            2. checked    
        */
        .area-list li:hover>ul {
            display: block;
        }


        /*        
        overflow 설정 (넘침설정)
        숨김 처리 + 줄바꿈 금지 + 말줄임표 설정
        */
        .custom-list li {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis
        }

    </style>
    
    
    <div class="section theater-section">
   		<!-- col-head -->
    		<div class="col-head">
    			<h3>극장</h3>
    		</div>
    	<!-- col-body -->
    		
    		<div class="col-body">
    			<div class="theater-select">
    				<div class="theater-list">
    					<div	class="theater-area-list">
    						<ul class="area-list">
    							<c:forEach  var="areaList" items="${areaList}">
    							<li>
    								${areaList.name }
    								<ul>
    								<c:forEach  var="cinemaDto" items="${areaList.list}">
    									<a href="stepDateTime?movie_no=${areaList.movie_no}&cinema_area=${cinemaDto.cinema_area}"><li>${cinemaDto.cinema_area }</li></a>
    								</c:forEach>
    								</ul>
    							</li>	
    							</c:forEach>
    						</ul>
    					</div>		
    				</div>
    			</div>
    		</div>
    		
   		</div>