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
	$(function() {
		var authStr = "";
		var result = "false";
		var count = 0;
		$("#auth_num_btn").on("click", function() {
			result = "false";
			count = 0;
			$.ajax({
				url : "sendAuthNum.login",
				type : "post",
				data : {
					email : "${email}"
				}
			}).done(function(resp) {
				alert("확인용! 발표시에는 삭제하기 " + resp);
				authStr = resp;
			})
		});

		$("#auth_btn").on("click", function() {
			var inputAuthNum = $("#input_auth").val();
			if (authStr == inputAuthNum) {
				alert("인증성공");
				$("#email_auth_badge", opener.document).toggle();
				$("#emailAuth_btn", opener.document).toggle();
				$("#emailAuth_btn", opener.document).attr("flag", "true");
				$("#idcheckin", opener.document).text("");
				close();
			} else {
				alert("인증실패 : " + (++count) + "회실패/3회");
			}
			if (count == 3) {
				alert("인증입력이 3회 틀렸습니다. 메인화면으로 돌아갑니다.");
				opener.document.getElementById("logo").click();
				close();
			}
		});
	})
</script>
<style>
#wrapper {
	width: 480px;
	margin: auto;
}
#logoWrapper{
	width: 100%;
	margin: auto;
}
#logo {
	width: 300px;
}
#wrapper>div{
	margin: 10px 0px;
}
.btn {
	margin-left: 10px;
}
#input_auth{
	width: 276px !important;
	border-radius: 5px;
	border : 1px solid #ffba00;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="logoWrapper">
			<img src="로고.png" id="logo">
		</div>
		<div class="input-group mb-3">
			<input id="email" type="text" class="form-control" value="${email }" readonly>
			<div class="input-group-append">
				<button id="auth_num_btn" class="btn btn-outline-warning"
					type="button">이메일로 인증번호 받기</button>
			</div>
		</div>
		<div class="input-group mb-3">
			<input id="input_auth" type="text"
				placeholder="인증번호 입력">
			<div class="input-group-append">
				<button id="auth_btn" class="btn btn-outline-warning" type="button"
					id="button-addon2">인증번호 확인</button>
			</div>
		</div>
	</div>
</body>
</html>