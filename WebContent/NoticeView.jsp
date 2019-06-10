<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR|Acme&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>공지사항</title>

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
#login_btn_div {
	padding-left: 0px !important;
	padding-right: 60px !important;
}

/*         header	 */


#header_div {
	border: 1px solid #FFC107;
	box-sizing: border-box;
}

#header_row, #profile_row, #contents_row {
	justify-content: center;
}
#contents_row
{
	min-height: 600px;
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

.class_div {
	justify-content: center;
}

.class_img_div {
	text-align: center;
}

.class_text_div {
	text-align: center;
}

.class_btn_div {
	text-align: center;
}

#navi_row {
	justify-content: center;
}

#navi_div {
	text-align: center;
}

#notice_row>div {
	border-left: 1px solid #ffba00;
	border-right: 1px solid #ffba00;
}

#notice_row {
	border: 1px solid #ffba00;
	background-color: #ffba00;
	color: white;
}

#notice_div {
	border-top: 1px solid #ffba00;
	border-bottom: 1px solid #ffba00;
}

#footer {
	height: 300px;
	width: 100%;
	background-color: #f2f0e1;
	margin: 0px
}

#sns>img {
	width: 50px;
}

#sns>img {
	margin: 30px 20px;
	cursor: pointer;
}

#footerMsg {
	margin-right: 50px;
	text-align: right;
}

.write{
	margin-bottom:60px;
}
#btn_row
{
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
<link rel="shortcut icon" href="favicon.ico">

<script>
	$(function()
    {
		
		if(${loginId == null }){
			$("#toLogin").on("click",function(){
				location.href = "Login.jsp";
			});
			$("#toSignup").on("click",function(){//회원가입
				location.href = "SignUp.jsp";
			});
		}else{
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
						}else{
							location.href="naverLogout.login";
						}
	        		});
		}
		
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
	      
	    // 이 위로는 공통 함수
	    
	    $(document).on("click", ".detail_class_btn", function()
	    {
		    location.href = "detail.notice?seq=" + $(this).attr("name");
	    });
	    
	    $(document).on("click", ".navi_btn", function()
	    {
		    location.href = "list.notice?page=" + $(this).val();
	    });
	    $(document).on("click","#prev_btn",function()
	   	{
	   		location.href = "list.notice?page="+${ startNavi - 1};
	   	});
	   	$(document).on("click","#next_btn",function()
	   	{
	   		location.href = "list.notice?page="+${ endNavi + 1};
	   	});
	   	
	   	
	   	if("${ currentPage }" % 10 == 0)
		{
			$($(".navi_btn")[9]).css("color", "red");
		}
		else
		{
			$($(".navi_btn")["${ currentPage % 10 - 1 }"]).css("color", "red");
		}
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

		<div id="contents_row" class="row mt-5">

			<div id="contents_outter_div" class="col-10">

				<div class="row">

					<div id="contents_div" class="col-lg-12">

						<div class="row my-3">

							<div class="col-12">

								<div id="notice_row" class="row">

									<div class="notice_seq_div col-lg-1 my-auto">글 번호</div>

									<div class="notice_text_div col-lg-5 my-auto">글 제목</div>

									<div class="notice_writer_div col-lg-3 my-auto">글 작성자</div>

									<div class="notice_time_div col-lg-3 my-auto">글 작성 날짜</div>

								</div>

							</div>

						</div>


						<c:forEach var="i" begin="1" end="${ listsize }" step="1">

							<div class="row my-3">

								<div class="col-12">

									<div id="notice_div" class="row">

										<div class="col-lg-1 my-auto">${ list[i-1].no_seq }</div>

										<div id="title_div" class="col-lg-5 my-auto">

											<a class="btn btn-link" style="color:black" href="detail.notice?seq=${ list[i-1].no_seq }">${ list[i-1].no_title }</a>

										</div>

										<div class="col-lg-3 my-auto">${ list[i-1].no_writer }</div>

										<div class="col-lg-3 my-auto">${ list[i-1].no_time }</div>

									</div>

								</div>

							</div>

						</c:forEach>

					</div>

				</div>

				<div id="navi_row" class="row my-3">

					<div id="navi_div" class="col-12">

						<c:if test="${ needPrev }">
							<input id="prev_btn" type="button" class="btn btn-link" value="<">
						</c:if>
						<c:forEach var="i" begin="${ startNavi }" end="${ endNavi }">
							<input class="btn navi_btn" name="${ i }" type="button"
								value="${ i }">
						</c:forEach>
						<c:if test="${ needNext }">
							<input id="next_btn" type="button" class="btn btn-link" value=">">
						</c:if>

					</div>

				</div>
				<c:if test="${ type == 'admin' }">

					<div class="row">

						<div id="btn_row" class="col-12 write">

							<a href="writePage.notice" class="btn btn-info">글 쓰기</a>

						</div>

					</div>

				</c:if>
			</div>

		</div>

	</div>
	<div id=footer class="row">
		<div class="col-12 col-md-8"></div>
		<div class="col-12 col-md-4" id=sns>
			<img src="https://img.icons8.com/ios/48/000000/facebook.png"> <img
				src="https://img.icons8.com/ios/48/000000/twitter.png"> <img
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