<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<style>
* {
	
}

body {
	background: url('main1.jpg') no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}

#span1 {
	color: blue;
}

#span2 {
	color: red;
}

#div {
	background-color: #ffffff95;
	margin-top: 12%;
	overflow: hidden;
	text-align: center;
	width: 600px;
	height: 800px;
	border-radius: 10px;
}

label {
	color: #8e7540;
}

#header {
	width: 108.5%;
	height: 25%;
}

#img {
	margin-top: 1%;
	width: 100%;
	height: auto;
}

loge {
	float: left;
	height: 75%;
}

.text_label {
	text-align: left;
	width: 100%;
	height: 100%;
}

select {
	padding: 0px;
}

.btn-warning {
	margin-top: 30px;
	cursor: pointer;
}
</style>
<style>
.ui-datepicker-trigger {
	cursor: pointer;
}

.hasDatepicker {
	cursor: pointer;
}

#email {
	margin: 0px;
	padding : 0px;
}

#email>.btn {
	margin: 0px;
}
</style>

<!-- 		날자 달력 이벤트 (동현)				 -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function() {

      $.datepicker
      .setDefaults({
                   dateFormat : 'yy-mm-dd',
                   showOtherMonths : true,
                   showMonthAfterYear : true,
                   changeYear : true,
                   changeMonth : true,
                   showOn : "both",
                   buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
                   buttonImageOnly : true,
                   buttonText : "날짜 선택",
                   yearSuffix : "년",
                   monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
                                      '9', '10', '11', '12' ],
                   monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                                 '8월', '9월', '10월', '11월', '12월' ],
                   dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
                   dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
                               '토요일' ],
                   minDate : "-100Y"
                   //,maxDate : "-10Y"
                   ,yearRange : '-100:-10'
                   });

      $("#datepicker").datepicker();
      //$('#datepicker').datepicker('setDate', new Date());

      });
</script>

<!-- 		날자 달력 이벤트 (동현)				 -->
<script>
    $(function() {
    		$("#emailAuth_btn").hide();
       		$("#email_auth_badge").hide();
       		
            $("#logo").on("click", function() {
                location.href = "start.main";
            })
            $("#idtext").on("focusout",function() {
            	if($("#emailAuth_btn").attr("flag")=="true"){//이메일 인증완료
            		$("#emailAuth_btn").attr("flag","false");
            		$("#id_Dupli_Btn").attr("flag","false");           		
                    $("#id_Dupli_Btn").toggle();
                    $("#email_auth_badge").toggle();
            	}else if($("#id_Dupli_Btn").attr("flag")=="true"){//id 중복체크 완료
            		$("#id_Dupli_Btn").attr("flag","false");
            		$("#emailAuth_btn").toggle();
                    $("#id_Dupli_Btn").toggle();  
            	}
            	$("#idcheckin").text("");
            	
            });
            $("#idtext").on("input",function() {
            	if($("#emailAuth_btn").attr("flag")=="true"){//이메일 인증완료
            		$("#emailAuth_btn").attr("flag","false");
            		$("#id_Dupli_Btn").attr("flag","false");           		
                    $("#id_Dupli_Btn").toggle();
                    $("#email_auth_badge").toggle();
            	}else if($("#id_Dupli_Btn").attr("flag")=="true"){//id 중복체크 완료
            		$("#id_Dupli_Btn").attr("flag","false");
            		$("#emailAuth_btn").toggle();
                    $("#id_Dupli_Btn").toggle();
            	}
            	$("#idcheckin").text("");
            });
                //id중복확인
                //id email인증받기

                //id중복확인 눌렀을때,
                $("#id_Dupli_Btn").on("click",function(){
                    $.ajax({
                        url : "idcheck.login",
                        type : "post",
                        data : {id : $("#idtext").val()}
                    }).done(function(resp) {
                        var idtext = $("#idtext").val();
                        var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/g
                        if (regex.exec(idtext) != null) {
                            if (resp == "1") {
                                $("#idcheckin").text("이미 가입된 아이디 입니다.");
                                $("#idcheckin").css("color","red");
                                $("#idcheckvar").val("");
                            }else if (resp == 0) {
                                $("#idcheckin").text("사용 가능한 아이디 입니다.이메일인증을 진행해주세요.");
                                $("#idcheckin").css("color","green");
                                $("#idcheckvar").val("사용 가능한 아이디 입니다.");
                                $("#id_Dupli_Btn").attr("flag","true");
                                $("#emailAuth_btn").toggle();
                                $("#id_Dupli_Btn").toggle();
                            } else if (resp == 3) {
                                $("#idcheckin").text("아이디를 입력해 주세요.");
                                $("#idcheckin").css("color","red");
                                $("#idcheckvar").val("");
                            }
                        
                        }else {
                            $("#idcheckin").text("올바른 형식으로 입력하세요.");
                            $("#idcheckin").css("color","red");
                            $("#idcheckvar").val("");
                        }
                    });
                });
                $("#emailAuth_btn").on("click",function() {//이메일 인증
                    var email = $("#idtext").val();
                    window.open("emailAuth.login?email=" + email, "",
                                "width=500px,height=500px");
            });


                $("#pwtext2").on("focusout", function() { // 패스워드 랑 패스워드 확인 의 값이 같은지 구별
                	$("#pwcheckvar").val("");
                    var regex = /^[A-Za-z0-9]{6,12}$/
                    var pw = $("#pwtext").val();
                    var pw2 = $("#pwtext2").val();
                    if (regex.exec(pw2) != null) {
                        if (pw == pw2) {
                            $("#pwcheckin").text("사용가능 합니다.");
                            $("#pwcheckin").css("color", "green");
                            $("#pwcheckvar").val("사용가능 합니다.");
                        } else {
                            $("#pwcheckin").text("비밀번호가 일치하지 않습니다.");
                            $("#pwcheckin").css("color", "red");
                            $("#pwcheckin").css("font-size", "15px");
                            $("#pwtext2").val("");
                            $("#pwcheckvar").val("");
                        }
                    } else {
                        $("#pwcheckin").text("사용불가능 합니다.");
                        $("#pwcheckin").css("color", "red");
                        $("#pwtext2").val("");
                        $("#pwcheckvar").val("");
                    }

                })
                $("#phonetext").on("focusout", function() {// 핸드폰 형식이 맞는지 구별 regex
                	$("#phonecheckvar").val("");
                    var phonetext = $("#phonetext").val();
                    var regex = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/g
                    if (regex.exec(phonetext) != null) {
                    	$.ajax({
            				url : "phoneCheck.login",
            				type : "post",
            				data : {
            					phone : phonetext
            				}
            			}).done(function(resp) {
            				if(resp=="false"){
            				$("#phonecheckin").text("사용가능한 핸드폰 번호입니다.");
                            $("#phonecheckin").css("color", "blue");
                            $("#phonecheckvar").val("올바른 양식 입니다.");
            				}else{
            					$("#phonecheckin").text("이미 사용중인 번호입니다.");
                                $("#phonecheckin").css("color", "red");
                                $("#phonetext").val("");
                                $("#phonecheckvar").val("");
            				}
            			});
                    } else {
                        $("#phonecheckin").text("양식에 맞지 않습니다.");
                        $("#phonecheckin").css("color", "red");
                        $("#phonetext").val("");
                        $("#phonecheckvar").val("");
                    }
                })

                $("#pwtext").on("input", function() {// 패스워드 형식이 맞는지 구별 regex
                	$("#pwcheckvar").val("");
                    var pwtext = $("#pwtext").val();
                    var regex = /^[A-Za-z0-9]{6,12}$/g
                    if (regex.exec(pwtext) != null) {
                        $("#pwcheckin").text("올바른 양식 입니다.");
                        $("#pwcheckin").css("color", "blue");
                    } else {
                        $("#pwcheckin").text("양식에 맞지 않습니다.");
                        $("#pwcheckin").css("color", "red");
                    }
                })

                $("#nicknametext").on("focusout", function() {// 닉네임 형식이 맞는지 구별 regex
                	$("#nicknamecheckvar").val("");
                    var nicknametext = $("#nicknametext").val();
                    var regex = /^.{1,6}$/g
                    if (regex.exec(nicknametext) != null) {
                        $("#nicknamecheckin").text("올바른 양식 입니다.");
                        $("#nicknamecheckin").css("color", "blue");
                        $("#nicknamecheckvar").val("올바른 양식 입니다.");
                    } else {
                        $("#nicknamecheckin").text("양식에 맞지 않습니다.");
                        $("#nicknamecheckin").css("color", "red");
                        $("#nicknametext").val("");
                        $("#nicknamecheckvar").val("");
                    }
                })
                /* $("#ok").on("click",function() {
        if(($("#idcheckvar").val() == "사용 가능한 아이디 입니다." && $("#pwcheckvar").val() == "사용가능 합니다.") && ($("#nicknamecheckvar").val() == "올바른 양식 입니다." && $("#phonecheckvar").val() == "올바른 양식 입니다.")){
        if(!$("input[name=gender]")){
        alert($("input[name=gender]").val());
        alert("가입란에 정확히 입력해주세요.");
        return false;
        }else{
        alert($("input[name=gender]").val());
        $("#login").submit();
        return true;
        }
        }else{
        lert($("input[name=gender]").val());
        alert("가입란에 정확히 입력해주세요.");
        return false;
        }
        })*/
                /* submit(function(){
        if($("#idtext").val() == ""){
        alert("값을 입력해 주세요.");
        return false;
        }else if($("#pwtext").val() == ""){
        alert("값을 입력해 주세요.");
        return false;
        }else if($("#nicknametext").val() == ""){

        }else if()
        }) */
       			$(document).keyup(function(e) {
            	    if ( e.keyCode == 13) {
            	    	$("#ok").click();
            	    }
            	});
                $("#ok").on("click",function() {
                    if($("#id_Dupli_Btn").attr("flag")=="false"){
                        alert("id중복확인을 해주세요.");
                        $("#idtext").focus();
                        return;
                    }else if($("#emailAuth_btn").attr("flag")=="false"){ //email인증
                        alert("email인증을 해주세요.");
                        $("#idtext").focus();
                        return;
                    }
                    if ((($("#pwcheckvar").val() == "사용가능 합니다.")
                         && ($("#nicknamecheckvar").val() == "올바른 양식 입니다." 
                             && ($("input:radio[name='gender']").is(":checked") == true)) && 
                         $("#phonecheckvar").val() == "올바른 양식 입니다.")) {
                        $("#login").submit();
                    } else {
                        alert("값을 입력해주세요.");
                        return false;
                    }
                });

                $("#back_btn").on("click", function() {
                    var back = confirm("메인화면으로 돌아갑니다.");
                    if (back) {
                        location.href = "start.main";
                    }
                });
            });
</script>
</head>
<body>
	<form id="login" action="signup.login" method="post">
		<input type="hidden" id="logo">
		<div class="container col-md-5 mt-5" id="div">
			<div class="row" id="header">
				<div class="col-1"></div>
				<div class="col-8">
					<img src="로고.png" alt="없음" id="img">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-10 text_label">
					<label for="" class="mt-3 mb-1 mr-3"><strong>아이디</strong></label> <span
						id="idcheckin"></span> <input type="hidden" id="idcheckvar"
						name="idcheck">
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label">
					<input type="text" class="form-control"
						placeholder="ex)moonblack_@naver.com" name="id" id="idtext"
						required onkeyup="noSpaceForm(this);"
						onchange="noSpaceForm(this);">
				</div>
				<div id="email" class="col-3">
					<input id="id_Dupli_Btn" flag="false" class="btn btn-warning"
						type="button" value="중복확인"> <input id="emailAuth_btn"
						flag="false" class="btn btn-warning" type="button" value="이메일인증">
					<h5>
						<span id="email_auth_badge" class="badge badge-info mt-2 mr-2">아이디
							인증성공!</span>
					</h5>
				</div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label ">
					<label for="" class="mt-2 mb-1 mr-3"><strong>비밀번호</strong></label><span
						id="pwcheckin"></span><input type="hidden" id="pwcheckvar"
						name="pwcheck">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label">
					<input type="password" class="form-control"
						placeholder="영문&숫자 6자리  ~ 12자리" name="pw" id="pwtext" required
						onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label ">
					<label for="" class="mt-2 mb-1"><strong>비밀번호 확인</strong></label>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label">
					<input type="password" class="form-control"
						placeholder="비밀번호를 입력하세요." name="pw2" id="pwtext2" required
						onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label ">
					<label for="" class="mt-2 mb-1 mr-3"><strong>닉네임</strong></label><span
						id="nicknamecheckin"></span><input type="hidden"
						id="nicknamecheckvar" name="nicknamecheck">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label">
					<input type="text" class="form-control" placeholder="6자 이내"
						name="nickname" id="nicknametext" required
						onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label">
					<label for="" class="mt-2 mb-1 mr-5"><strong>성 별</strong></label> <input
						type="radio" class="gender ml-4 mr-3" name="gender" value="M"
						required><span class="mr-3" id="span1"> 남</span> <input
						type="radio" class="gender ml-4 mr-3" name="gender" value="F"
						required><span id="span2"> 여</span>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label"></div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label ">
					<label for="" class="mt-2 mb-1 mr-4"><strong>생년월일</strong></label>
					<input type="text" id="datepicker" name="birth" readonly>
					<div class="col-3"></div>
				</div>
			</div>

			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label">
					<label for="" class="mt-2 mb-1 mr-3"><strong>휴대폰</strong></label><span
						id="phonecheckin"></span><input type="hidden" id="phonecheckvar"
						name="phonecheck">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row" id="main">
				<div class="col-1"></div>
				<div class="col-8 text_label">
					<input type="text" class="form-control"
						placeholder="ex)010-9890-2814" name="phone" id="phonetext"
						required>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row pt-1 mt-2" id="main">
				<div class="col-1"></div>
				<div class="col-10 input_text">
					<button type="button" class="btn btn-warning px-3 py-2" id="ok"
						name="ok">가입하기</button>
					<button type="button" class="btn btn-warning ml-4 px-3 py-2"
						id="back_btn">메인으로</button>

				</div>
				<div class="col-1"></div>
			</div>
		</div>
	</form>
	<script>
		function noSpaceForm(obj) { // 공백사용못하게
			var str_space = /\s/; // 공백체크
			if (str_space.exec(obj.value)) { //공백 체크
				alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
				obj.focus();
				obj.value = obj.value.replace(' ', ''); // 공백제거
				return false;
			}
			// onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
		}
	</script>
</body>
</html>