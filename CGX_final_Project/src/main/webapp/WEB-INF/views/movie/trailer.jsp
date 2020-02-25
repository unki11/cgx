<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>



<style>
    .videos img{
        width: 100%;
        height: auto;
    }

a.video{
    float: left;
    position: relative;
}

a.video span{
    width: 100%;
    height: 100%;
    position: absolute;
    background:url("https://t1.daumcdn.net/cfile/tistory/272B024E567617E839") no-repeat;
    background-position: 50% 50%;
    background-size: 20%;
}

@media screen and {
    a.video span{
        background-size: 20%;
    }
}
</style>


<script>
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
                event.preventDefault();
                $(this).ekkoLightbox();
            });


</script>



    <h1>trailer 페이지 입니다</h1>
    <body>
    <c:forEach var="videoVO" items="${video_list }">
 <div class="videos">
  <h1>${videoVO.movie_title}</h1>
    <a href=" ${videoVO.video_link}" data-toggle="lightbox" class="video">
        <span>&nbsp;</span>
         <img src="http://img.youtube.com/vi/${videoVO.video_id }/maxresdefault.jpg" style="width:240px; height: 135px;">
        </a>
    </div>
<br><br><br><br><br><br><br><br>
    </c:forEach>
    </body>
  
   