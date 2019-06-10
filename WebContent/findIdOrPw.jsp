<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id/pw찾기</title>
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
	<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR|Acme|Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	background: url('main1.jpg') no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}

#wrapper {
	margin-top: 13%;
	background-color: #ffffff95;
	margin-right: auto;
	margin-left: auto;
	overflow: hidden;
	text-align: center;
	width: 400px;
	height: 500px;
	border-radius: 10px;
	position: relative;
}
#header{
	width:100%;
}
#part1,#part3_id{
	margin-top:100px;
	font-size : 20px;
}
.btn-warning {
	color: white;
}
#img {
	width: 300px;
}
#email{
	border : 1px solid rgba(0, 0, 0, 0.32);
	padding:0px 3px;
}
#footer {
	position: absolute;
	top: 400px;
	width: 100%;
	margin: auto !important;
}
</style>
<script>
	$(function() {
		$("#part2_id").hide();
		$("#part2_pw").hide();
		$("#part3_id").hide();
		$("#part3_pw").hide();
		//-----1단계
		$("#findId").on("click", function() {
			$("#part1").hide();
			$("#part2_id").show();
		});
		$("#findPw").on("click", function() {
			$("#part1").hide();
			$("#part2_pw").show();
		});
		//-----2단계
		$("#findId_btn").on("click", function() {
			var birth = $("#findId_birth").val();
			var phone = $("#findId_phone").val();
			if (birth == "" || phone == "") {
				alert("값을 입력해주세요.");
				return;
			}
			$("#part2_id").toggle();
			$("#findResult").text("해당정보의 ID를 검색중입니다.");
			$("#part3_id").toggle();
			$.ajax({
				url : "findId.login",
				type : "post",
				data : {
					birth : birth,
					phone : phone
				}
			}).done(function(resp) {
				if (resp == "false") {
					$("#findResult").text("입력하신 정보에 해당하는 ID가 없습니다.");
				} else {
					$("#findResult").text(" 회원님의 ID는 " + resp + "  입니다");
				}
			})
		});
		var authStr = "yet";
		var result = "false";
		var email_send_count = 0;
		var count = 0;
		var Idemail = "";
		$("#auth_num_btn").on("click", function() {
			var email = $("#email").val();
			var emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			var emailResult = emailRegex.exec(email);
			if(email=""||emailResult==null){
				alert("이메일형식이 아닙니다. ID를 정확히 입력해주세요.");
				$("#email").focus();
				return;
			}
			$.ajax({
				url : "idcheck.login",
				type : "post",
				data : {
					id : email
				}
			}).done(function(resp) {
				alert(resp);
				if (resp == "1") {
					Idemail = email;
					$("#email").attr("readonly", "true");
					var email = $("#email").val();
					result = "false";
					count = 0;
					if (email_send_count == 2) {
						alert("이메일발송은 세번까지만 가능합니다.");
					}
					if (email_send_count == 3) {
						alert("이메일발송버튼을 세번이상 누르셨습니다. 메인화면으로 돌아갑니다.");
						location.href = "start.main";
					}
					email_send_count++;
					$.ajax({
						url : "sendAuthNum.login",
						type : "post",
						data : {
							email : email
						}
					}).done(function(resp) {
						alert("이메일이 발송되었습니다. 인증번호를 입력해주세요.");
						alert("확인용! 발표시에는 삭제하기 " + resp);
						authStr = resp;
					})
				} else {
					$("#part2_pw").toggle();
					$("#findResult").text("해당 ID가 없습니다.");
					$("#part3_id").toggle();
				}
			});
		});

		$("#auth_btn").on("click", function() {
			if (authStr == "yet") {
				alert("이메일인증버튼을 눌러주세요.");
				return;
			}
			var inputAuthNum = $("#input_auth").val();
			if (authStr == inputAuthNum) {
				alert("인증성공");
				$("#part2_pw").toggle();
				$("#part3_pw").toggle();
			} else {
				alert("인증실패 : " + (++count) + "회실패/3회");
			}
			if (count == 3) {
				alert("인증입력이 3회 틀렸습니다. 메인화면으로 돌아갑니다.");
				location.href = "start.main";
			}
		});
		//-----3단계
		$("#changePw").on("click", function() {
			var pw1 = $("newPw1").val();
			var pw2 = $("newPw2").val();
			var regex = /^[A-Za-z0-9]{6,12}$/;
			var pwRegexResult = regex.exec(pw1);
			if (pwRegexResult == null) {
				alert("비밀번호조건 :  영문&숫자 6자리  ~ 12자리");
				$("newPw1").focus();
				return;
			} else if (pw1 == pw2) {
				alert("비밀번호 확인을 정확히 입력해주세요.");
				$("newPw2").focus();
				return;
			}
			$("#part3_pw").toggle();
			$("#findResult").text("PW변경중입니다.");
			$("#part3_id").toggle();

			$.ajax({
				url : "sendAuthNum.login",
				type : "post",
				data : {
					id : Idemail,
					pw : pw1
				}
			}).done(function(resp) {
				if (resp == "1") {
					$("#findResult").text("비밀번호가 변경되었습니다.");
				} else {
					$("#findResult").text("비밀번호 변경 실패");
				}
			})
		});

	});
</script>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div class="row pt-5">
				<div class="col-12">
					<img src="꿀단지2.png" id="img">
				</div>
			</div>
		</div>
		<div id="part1">
			<button id="findId" type="button" class="btn btn-warning">ID찾기</button>
			<button id="findPw" type="button" class="btn btn-warning">PW찾기</button>
		</div>
		<div id="part2_id">
			<div>
				<h4>ID찾기</h4>
			</div>
			<div>
				<h6>회원가입시 입력한 생일과 핸드폰번호를 입력해주세요.</h6>
			</div>
			<div class="input-group mb-3 mx-1">
				<div class="input-group-prepend">
					<span class="input-group-text bg-warning">생일</span>
				</div>
				<input id="findId_birth" type="text" class="form-control mr-2"
					placeholder="(예 : 11월09일 -> 1109)">
			</div>
			<div class="input-group mb-3 mx-1">
				<div class="input-group-prepend">
					<span class="input-group-text bg-warning">핸드폰번호</span>
				</div>
				<input id="findId_phone" type="text" class="form-control mr-2"
					placeholder="ex)010-9890-2814">
			</div>
			<div>
				<button id="findId_btn" type="button" class="btn btn-warning">ID찾기</button>
			</div>
		</div>
		<div id="part2_pw">
			<div>
				<h4>PW찾기</h4>
			</div>
			<div>
				<h6>ID(이메일)를 입력해주세요</h6>
			</div>
			<div class="input-group mb-3 ml-1">
				<input id="email" type="text" class="form-control" placeholder="ex)moonblack_@naver.com">
				<div class="input-group-append">
					<button id="auth_num_btn" class="btn btn-warning" type="button" >이메일로 인증번호 받기</button>
				</div>
			</div>
			<div class="input-group mb-3 ml-1">
				<input id="input_auth" type="text" placeholder="인증번호 입력">
				<div class="input-group-append">
					<button id="auth_btn" class="btn btn-warning" type="button"
						id="button-addon2">인증번호 확인</button>
				</div>
			</div>
		</div>
		<div id="part3_id">
			<div id="findResult"></div>
		</div>
		<div id="part3_pw">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">변경할 비밀번호</span>
				</div>
				<input id="newPw1" type="password" class="form-control"
					placeholder="영문&숫자 6자리  ~ 12자리">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">비밀번호 확인</span>
				</div>
				<input id="newPw2" type="password" class="form-control"
					placeholder="비밀번호를 다시한번 입력하세요">
			</div>
			<div>
				<button id="changePw" type="button" class="btn btn-warning">비밀번호변경하기</button>
			</div>
		</div>
		<div class="row" id="footer">
			<div class="col-12">
				<a class="btn btn-warning" href="EmailLogin.jsp" role="button">로그인으로
					돌아가기</a>
			</div>
		</div>
	</div>
</body>
</html>