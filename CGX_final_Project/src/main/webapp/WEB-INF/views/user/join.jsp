<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>jquery</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
<title>회원가입</title>
<script>
        //해야할일 : id에 input 이벤트가 발생하면 ajax로 xml을 불러와서 검사
        $(function(){
            $("button[id=checkId]").click(function(){
                $.ajax({
                    url:"checkId",
                    type:"post",
                    data:{'member_id':'admin'},
                    success:function(resp){ //resp = 위코드가 성공적으로 컨트롤러에 다녀왔을때 가져온 값
                    	var result = false;
                        $(resp).find("member_id").each(function(){ //each -각각찾는거
                            if($(this).text() === $("input[name=member_id]").val()){
                            	//만약에 니가 find를 실행해서 가져온 값이 글자인데 니가 입력한 값하고 같을때
                                result = true;
                            }
                        });
                        // console.log(result);
                        // result가 true면 아이디가 존재하는 것
                        // result가 false면 아이디가 존재하지 않는 것
                        if(result){ //result 는 위에  result = true; 
                            $("input[name=member_id]").next().text("이미 사용중인 아이디입니다");
                        }
                        else{
                            $("input[name=member_id]").next().text("사 용할 수 있는 아이디입니다");
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
	<h1>회원가입</h1>
	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">환영합니다!</div>
				</div>
					<div class="from-group">
				<form action="join" method="post" method="post">
		            <div>
                            <input type="text" name="memeber_id" placeholder="id">
                            <!--  name = 값 controller에있는파라미터값변수명하고 일치해야함 -->
                            <button id="checkId" value="중복확인"></button>
                    </div>
		            <div>
                            <input type="password" name="member_pw" placeholder="pw" >
                    </div>
		           <div>
                            <input type="text" name="member_name" placeholder="name">
                    </div>
		            <div>
                            <input type="text" name="member_phone" placeholder="phone">
                    </div>
		            <div>
                            <input type="text" name="member_birth" placeholder="birth" >
                    </div>
		            <div>
                            <input type="text" name="member_sex" placeholder="sex" >
                    </div>
          			<div>
                            <button type="submit">회원가입</button>
                   </div>
			</form>
			</div>
			</div>
		</div>
		<div>
	</div>
</div>
	
<script>
        //해야할일 : id에 input 이벤트가 발생하면 ajax로 xml을 불러와서 검사
        $(function(){
            $("button[id=checkId]").click(function(){
                $.ajax({
                    url:"checkId",
                    type:"post",
                    data:{'member_id':'rhddb'},
                    success:function(resp){ //resp = 위코드가 성공적으로 컨트롤러에 다녀왔을때 가져온 값
/*                     	var result = false;
                        $(resp).find("member_id").each(function(){ //each -각각찾는거
                            if($(this).text() === $("input[name=member_id]").val()){
                            	//만약에 니가 find를 실행해서 가져온 값이 글자인데 니가 입력한 값하고 같을때
                                result = true;
                            }
                        }); */
                        // console.log(result);
                        // result가 true면 아이디가 존재하는 것
                        // result가 false면 아이디가 존재하지 않는 것
                        if(resp){ //result 는 위에  result = true; 
                            $("input[name=member_id]").next().text("이미 사용중인 아이디입니다");
                        }
                        else{
                            $("input[name=member_id]").next().text("사 용할 수 있는 아이디입니다");
                        }
                    }
                });
            });
        });
    </script>
<script>
        //해야할일 : id에 input 이벤트가 발생하면 ajax로 xml을 불러와서 검사
        $(function(){
            $("button[id=checkId]").click(function(){
                $.ajax({
                    url:"checkId",
                    type:"post",
                    data:{'member_id':'admin'},
                    success:function(resp){ //resp = 위코드가 성공적으로 컨트롤러에 다녀왔을때 가져온 값
                    	var result = false;
                        $(resp).find("member_id").each(function(){ //each -각각찾는거
                            if($(this).text() === $("input[name=member_id]").val()){
                            	//만약에 니가 find를 실행해서 가져온 값이 글자인데 니가 입력한 값하고 같을때
                                result = true;
                            }
                        });
                        // console.log(result);
                        // result가 true면 아이디가 존재하는 것
                        // result가 false면 아이디가 존재하지 않는 것
                        if(result){ //result 는 위에  result = true; 
                            $("input[name=member_id]").next().text("이미 사용중인 아이디입니다");
                        }
                        else{
                            $("input[name=member_id]").next().text("사 용할 수 있는 아이디입니다");
                        }
                    }
                });
            });
        });
    </script>
<script>
        //해야할일 : id에 input 이벤트가 발생하면 ajax로 xml을 불러와서 검사
        $(function(){
            $("button[id=checkId]").click(function(){
                $.ajax({
                    url:"checkId",
                    type:"post",
                    data:{'member_id':'admin'},
                    success:function(resp){ //resp = 위코드가 성공적으로 컨트롤러에 다녀왔을때 가져온 값
                    	var result = false;
                        $(resp).find("member_id").each(function(){ //each -각각찾는거
                            if($(this).text() === $("input[name=member_id]").val()){
                            	//만약에 니가 find를 실행해서 가져온 값이 글자인데 니가 입력한 값하고 같을때
                                result = true;
                            }
                        });
                        // console.log(result);
                        // result가 true면 아이디가 존재하는 것
                        // result가 false면 아이디가 존재하지 않는 것
                        if(result){ //result 는 위에  result = true; 
                            $("input[name=member_id]").next().text("이미 사용중인 아이디입니다");
                        }
                        else{
                            $("input[name=member_id]").next().text("사 용할 수 있는 아이디입니다");
                        }
                    }
                });
            });
        });
    </script>
<script>
        //해야할일 : id에 input 이벤트가 발생하면 ajax로 xml을 불러와서 검사
        $(function(){
            $("button[id=checkId]").click(function(){
                $.ajax({
                    url:"checkId",
                    type:"post",
                    data:{'member_id':'admin'},
                    success:function(resp){ //resp = 위코드가 성공적으로 컨트롤러에 다녀왔을때 가져온 값
                    	var result = false;
                        $(resp).find("member_id").each(function(){ //each -각각찾는거
                            if($(this).text() === $("input[name=member_id]").val()){
                            	//만약에 니가 find를 실행해서 가져온 값이 글자인데 니가 입력한 값하고 같을때
                                result = true;
                            }
                        });
                        // console.log(result);
                        // result가 true면 아이디가 존재하는 것
                        // result가 false면 아이디가 존재하지 않는 것
                        if(result){ //result 는 위에  result = true; 
                            $("input[name=member_id]").next().text("이미 사용중인 아이디입니다");
                        }
                        else{
                            $("input[name=member_id]").next().text("사 용할 수 있는 아이디입니다");
                        }
                    }
                });
            });
        });
    </script>
</head>
</html>