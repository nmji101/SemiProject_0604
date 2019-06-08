<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증 페이지</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="/favicon-32x32.png">
<script src="https://code.jquery.com/jquery-3.4.0.min.js">
</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	$(function(){
		var authStr = "";
		var result = "false";
		var count = 0;
		$("#auth_num_btn").on("click",function(){
			result = "false";
			count = 0;
			$.ajax({
				url:"sendAuthNum.login",
				type:"post",
				data:{
					email:"${email}"
				}
			}).done(function(resp){
				alert(resp);
				authStr = resp;
			})
		});
		
		$("#auth_btn").on("click",function(){
			var inputAuthNum = $("#input_auth").val();
			if(authStr==inputAuthNum){
				alert("인증성공");
				opener.document.getElementById("email").setAttribute("flag","true");
				close();
			}else{
				alert("인증실패 : "+(++count)+"회실패/3회");
			}
			if(count==3){
				alert("인증입력이 3회 틀렸습니다. 메인화면으로 돌아갑니다.");
				opener.document.getElementById("logo").click();
				close();
			}
		});
	})
</script>
</head>
<body>
	<div>
		<div>
			<input type="text" value="${email }" readonly><input id="auth_num_btn" type="button" value="이메일로 인증번호 받기">
		</div>
		<div>
			<input id="input_auth" type="text" placeholder="인증번호 입력"><input id="auth_btn" type="button" value="인증확인">
		</div>
	</div>
</body>
</html>