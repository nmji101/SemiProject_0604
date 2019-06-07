<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Gugi|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<title>Document</title>

<style>

/*         header	 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}

div {
	width: 100%;
	text-align: center;
	padding: 0px;
}

#header {
	width: 100%;
	margin-left: 1px !important;
	margin-right: 1px !important;
	padding-left: 0px !important;
	padding-right: 0px !important;
	top: -20px !important;
	text-align: center;
	justify-content: center;
}

#logo_div {
	padding-left: 3px !important;
}

#container_div {
	/* 	padding-left: 0px !important; */
	/*     padding-right: 0px !important; */
	margin: 0px !important;
}

#search {
	text-align: center !important;
	justify-content: center !important;
}

#searchbox {
	width: 237px;
	height: 38px;
	position: relative;
	top: 4px;
	border: 1px solid #ffba00;
	border-radius: 10px;
	padding: 10px;
}

#searchbox_div {
	padding-left: 0px !important;
	padding-right: 60px !important;
}

#logo {
	position: relative;
	bottom: 20px;
	cursor: pointer;
}

#header {
	height: 100%;
	width: 100%;
	padding: 64px 32px;
}

.headBtn {
	color: white !important;
	font-weight: bolder !important;
}

.headBtn:hover {
	background-color: burlywood;
	border: 1px solid burlywood;
	color: white;
}
/*         header	 */
h2 {
	font-family: 'Gugi', cursive;
	color: #ffba00
}

#login_btn_div {
	padding-left: 0px !important;
	padding-right: 60px !important;
}

#header_div {
	border: 1px solid #FFC107;
	box-sizing: border-box;
}

#profile_div_row, #profile_div {
	text-align: center;
	justify-content: center;
}

#header_row, #profile_row, #contents_row {
	justify-content: center;
}

#logo_div, #event_div, #profile_img_div {
	text-align: center;
}

#logo_img, #event_img {
	width: 200px;
	height: 100px;
}

#search_div {
	text-align: center;
}

#search_text {
	width: 100%;
}

#profile_img_div img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}

.class_div {
	justify-content: center;
}

.class_img_div {
	text-align: center;
}

.class_text_div {
	text-align: center;
}

.class_img {
	width: 100px;
	height: 100px;
}

#navi_div {
	text-align: center;
}

#update_btn_div {
	text-align: center;
}

#update_btn {
	width: 30%;
}

#person_info_btn {
	color: white;
	font-weight: bold
}

.btn-group-toggle label {
	color: #6b6854;
	width: 130px;
}

#ing_class_btn, #done_class_btn, #person_info_btn, #tutor_page_btn {
	width: 100%;
	height: 100%;
}

#id_label_div, #pw_btn_div {
	text-align: left;
}

h2 {
	font-family: 'Gugi', cursive;
	color: #ffba00
}

#footer {
	height: 300px;
	width: 100%;
	background-color: #f2f0e1;
	margin: 100px 0px 0px 0px;
}

#sns>img {
	margin: 30px 20px;
	cursor: pointer;
}

#footerMsg {
	margin-right: 50px;
	text-align: right;
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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<script>
	$(function()
    {
		var attention = ${ dto.m_attention };
		if(attention != [ "없음" ])
		{
			attention.forEach(function(item, index, array)
			{
				$("#"+item).attr("class","btn btn-outline-warning my-1 font-weight-bolder active");
				$("#"+item).children("input:checkbox").prop("checked", true);
			});
		}
		$("#logo").on("click", function() {
			location.href = "mainHomePage.jsp";
		})
		$("#search_Btn").on("click",function(){
			var input = $("#searchbox").val();
			var regex = /^ {1,}$/g;
			var result = regex.exec(input);
			if(input==""){
				alert("검색어를 입력해주세요.");
				return;
			}else if(result!=null){
				alert("검색할 단어를 입력해주세요.");
				return;
			}
			//alert("검색어 : " + input)
			$("#searchForm").submit();
		});
		$("#mypage_btn").on("click", function()
        		{
					if(${type=="admin"}){
						location.href = "mypage.admin";
					}else{
						location.href = "doing.mypage?"+encodeURI("page=1");
					}
        		});
		$("#logout_btn").on("click", function()
		{
			if(${loginType == "kakao"})
			{
		    	Kakao.init('13fe5c08665b4e8a48dc83219f00ee79');
		            		            				            				
		        var popOption = "width=300, height=300, resizable=no, scrollbars=no, status=no top=100, left=100;";
		        window.open("exit.html","",popOption)
		            		            		
		        Kakao.Auth.logout
		        (
		        	function(data)
		        	{
			            if(data)
			            {				
			            	location.href="logout.login";
			            }
			            else
			            {
			            	location.href="error.html";
			            }
		            }
		         );
		  	}
			else if(${loginType == "normal"})
			{
				location.href="logout.login";
			}
			else
			{
				location.href="naverLogout.login";
			}
		})
	    
	    $("#ing_class_btn").on("click", function()
	    {
		    location.href = "doing.mypage?page=1";
	    });
	    
	    $("#done_class_btn").on("click", function()
	    {
		    location.href = "done.mypage?page=1";
	    });
	    
	    $("#person_info_btn").on("click", function()
	    {
		    location.href = "person.mypage?page=1";
	    });

	    $("#tutor_page_btn").on("click", function()
		{
			location.href = "tutor.mypage";
		});

	    $("#profile_img_btn").on("click", function()
	    {
		    var popOption = "width=450, height=300, resizable=no, scrollbars=no, status=no top=100, left=100;";
		    
		    open("changeImg.mypage", "", popOption);
	    });
	    
	    $("#profile_nickname_btn").on("click", function()
	    {
		    location.href = "person.mypage";
	    });
	    
	    // 이 위로는 공통 함수
	    
	    $("#pw_btn").on("click", function()
	    {
		    var popOption = "width=450, height=450, resizable=no, scrollbars=no, status=no top=100, left=100;";
		    
		    open("changePw.mypage", "", popOption);
	    });
	    
	    $("#submit_btn").on("click", function()
	    {
		    $("#info_form").submit();
	    });
	    
    });
    
    onload = function()
    {
	    
    };
</script>


</head>
<body>

	<div id="container_div" class="container col-12">

		<!--           HEADER-->
		<div id=header class=row>

			<div id="logo_div" class="col-12 col-lg-3">

				<a href="start.main"><img src="logo.png" id=logo></a>

			</div>

			<div class="col-12 col-lg-6">

				<form id="searchForm" action="search.category" class="my-2 my-lg-0">
						<div class="row justify-content-center">
							<div class="col-12">
								<input type="search" placeholder="취미를 검색해 보세요!"
									aria-label="Search" id="searchbox" name="search">
								<button id="search_Btn"
									class="btn btn-warning my-2 my-sm-0 headBtn" type="button">Search</button>
							</div>
						</div>
					</form>
			</div>

			<div id="login_btn_div" class="col-12 col-lg-3">

				<c:choose>

					<c:when test="${loginId==null}">

						<button id="toLogin" class="btn btn-warning headBtn" type="button">login</button>

						<button id="toSignup" class="btn btn-warning headBtn"
							type="button">signup</button>

					</c:when>

					<c:otherwise>

						<button class="btn btn-warning headBtn" type="submit"
							id=mypage_btn>mypage</button>

						<button class="btn btn-warning headBtn" type="submit"
							id=logout_btn>logout</button>

					</c:otherwise>

				</c:choose>

			</div>

		</div>
		<!--           HEADER-->

		<div id="profile_row" class="row">

			<div class="col-10 my-3">

				<div id="profile_div_row" class="row">

					<div class="col-lg-6">

						<div id="profile_div" class="row">

							<div id="profile_img_div" class="col-lg-4">

								<button id="profile_img_btn" class="btn">${ dto.m_photo }

								</button>

							</div>

							<div id="profile_text_div" class="col-lg-8 my-auto">

								<button id="profile_nickname_btn" class="btn">

									<h2>${ dto.m_nickname }
										님, 환영합니다! <img
											src="https://img.icons8.com/color/48/000000/smiling.png">
									</h2>

								</button>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

		<div id="contents_row" class="row my-5">

			<div class="col-10">

				<div class="row">

					<div id="menu_div" class="col-lg-3">

						<div class="row">

							<div class="col-6 col-md-3 col-lg-12 my-1">

								<button id="ing_class_btn" class="btn btn-outline-warning py-3">
									수강 중 클래스</button>

							</div>

							<div class="col-6 col-md-3 col-lg-12 my-1">

								<button id="done_class_btn" class="btn btn-outline-warning py-3">수강
									한 클래스</button>

							</div>

							<div class="col-6 col-md-3 col-lg-12 my-1">

								<button id="person_info_btn" class="btn btn-warning py-3">

									<h5>
										<strong>개인 정보 수정</strong>
									</h5>

								</button>

							</div>

							<div class="col-6 col-md-3 col-lg-12 my-1">

								<button id="tutor_page_btn" class="btn btn-outline-warning py-3">

									튜터 페이지</button>

							</div>

						</div>

					</div>

					<div id="contents_div" class="col-lg-9">


						<div class="row my-2">

							<div class="col-lg-3 my-auto">

								<h5>아이디</h5>

							</div>

							<div id="id_label_div" class="col-lg-9">

								<label class="form-control my-auto"> ${ dto.m_id } </label>

							</div>

						</div>

						<div class="row my-2">

							<div class="col-lg-3 my-auto">

								<h5>비밀번호</h5>

							</div>

							<div id="pw_btn_div" class="col-lg-9">

								<input id="pw_btn" class="btn btn-info" type="button"
									value="비밀번호 수정">

							</div>

						</div>

						<form id="info_form" action="update.mypage" method="post">

							<div class="row my-2">

								<div class="col-lg-3 my-auto">

									<h5>닉네임</h5>

								</div>

								<div class="col-lg-9 my-auto">

									<input class="form-control" type="text" name="nickname"
										value="${ dto.m_nickname }">

								</div>

							</div>

							<div class="row my-2">

								<div class="col-lg-3 my-auto">

									<h5>관심사</h5>

								</div>

								<div class="col-lg-9">

									<div class="btn-group-toggle" data-toggle="buttons">

										<label id="at1" class="btn btn-outline-warning my-1"><input
											type="checkbox" name="attention" value="at1">디자인</label> <label
											id="at2" class="btn btn-outline-warning my-1"><input
											type="checkbox" name="attention" value="at2">IT</label> <label
											id="at3" class="btn btn-outline-warning my-1"><input
											type="checkbox" name="attention" value="at3">언어</label> <label
											id="at4" class="btn btn-outline-warning my-1"><input
											type="checkbox" name="attention" value="at4">라이프스타일</label> <label
											id="at5" class="btn btn-outline-warning my-1"><input
											type="checkbox" name="attention" value="at5">재테크</label>

									</div>

								</div>

							</div>

							<div class="row mt-5 mb-1">

								<div id="update_btn_div" class="col-12">

									<input id="submit_btn" class="btn btn-info" type="button"
										value="수정하기">

								</div>

							</div>

						</form>

					</div>

				</div>

			</div>

		</div>


	</div>
<div id=footer class="row">
			<div class="col-12 col-md-8"></div>
			<div class="col-12 col-md-4" id=sns>
				<img src="https://img.icons8.com/ios/48/000000/facebook.png">
				<img src="https://img.icons8.com/ios/48/000000/twitter.png"> <img
					src="https://img.icons8.com/ios/48/000000/instagram-new.png">
				<img src="https://img.icons8.com/ios/48/000000/github.png">
			</div>
			<div id=footerMsg>
				(주)꿀단지 | 서울특별시 중구 남대문로 120 대일빌딩 3층<br> © Ggooldanji. all rights
				reserved.
			</div>
		</div>
</body>
</html>
