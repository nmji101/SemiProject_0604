<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<style>
#div {
	margin-top: 13%;
	overflow: hidden;
	text-align: center;
	width: 400px;
	height: 500px;
}
form>div{
	background-color: #ffffff95;
	 border-radius:5px;
	
}
body {

  background: url('main1.jpg') no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  background-size: cover;
  -o-background-size: cover;
}
* {
	
}

#header {
	width: 108.1%;
	height: 40%;
}

logo {
	width: 100%;
	height: auto;
}

#log {
	float: left;
	width: 100%;
	height: 100%;
}
img{
	height: auto;
}
.form-control {
	float: left;
	width: 100%;
	height: 100%;
}

.input_text {
	text-align: right;
}

main>div>input {
	margin-left: 50px;
}

main>div {
	padding-top: 100%;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.0.min.js">
	
</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	$(function()
    {
		$("#login_btn").on("click", function()
		{
			$.ajax
        	({
        		type: "POST",
        		url:"email.login",
        		data:
        		{
        			id:$("#id").val(),
        			pw:$("#pw").val()
        		}
        	})
        	.done(function(response)
        	{
        		if(response == "Y")
        		{
        			location.href = "mainHomePage.jsp";
        		}
        		else if(response == "N")
        		{
        			alert("아이디 혹은 비밀번호를 확인해주세요.");
        		}
        		else
        		{
        			alert("ERROR");
        		}
        	})
        	.fail(function()
        	{
        		window.location.href = "error.pc";
        	});
		});
		
	    $("#back_btn").on("click", function()
	    {
		    location.href = "Login.jsp";
	    })
    })
</script>
</head>
<body>
	<form action="Login.insert" method="post">
		<div class="container col-md-6" id="div">
			<div class="row" id="header">
				                     <logo class="col-log-12 col-md-12 col-sm-12 pt-5"> 
				                         <img src="꿀단지2.png" alt="" id="log"> 
				                    </logo> 
			</div>
			<div class="row pt-4" id="main">
				<div class="col-1"></div>
				<div class="col-3 input_text pt-2">
					<label>아이디 :</label>
				</div>
				<div class="col-7">
					<input type="text" class="form-control" placeholder="아이디 입력"
						name="id" id="id" required>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row pt-1 mt-1" id="main">
				<div class=" col-4 input_text pt-2">
					<label>비밀번호 :</label>
				</div>
				<div class="col-7">
					<input class="form-control" type="password" placeholder="비밀번호 입력"
						name="pw" id="pw" required>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row pt-1 mt-2" id="main">
				<div class="col-1"></div>
				<div class="col-10 input_text">
					<a href="#" style="color: #7a5634">아이디 비밀번호 찾기</a> <span>/</span> <a
						href="SignUp.jsp" style="color: #7a5634">회원가입</a>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row pt-1 mt-2" id="main">
				<div class="col-2"></div>
				<div class="col-9 input_text">
					<button type="button" class="btn btn-warning" id="login_btn">확인</button>
					<button type="button" class="btn btn-warning" id="back_btn">돌아가기</button>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
	</form>
</body>
</html>