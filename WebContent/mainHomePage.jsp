<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>꿀단지 Main</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR|Acme&display=swap"
	rel="stylesheet">
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<style>
/* 헤드부분 */
* {
   font-family: 'Noto Sans KR', sans-serif;
}
#logo{
	position: relative;
	bottom: 20px;
	cursor: pointer;
}

#header {
   height: 200px;
   width: 100%;
}

div {
   width: 100%;
   text-align: center;
}

.headBtn {
   color: white;
}

.headBtn:hover {
   background-color: burlywood;
   border: 1px solid burlywood;
   color: white;
}

#searchbox {
   height: 38px;
   position: relative;
   top: 4px;
   border: 1px solid #ffba00;
   border-radius: 10px;
   padding: 10px;
}

.jumbotron {
   background-image: url("main1.jpg");
   background-size: cover;
   margin: 0px;
}


#lookBtn {
   font-weight: bold;
   font-size: 23px;
   width: auto;
}

.display-4 {
   font-family: 'Do Hyeon', sans-serif;
}

#navi {
   width: 100%;
   height: auto;
   position: static;
}

.collapse {
   text-align: center;
}

.form-control {
   width: 100%;
}

.loactionMenu {
   padding: 0px;
}

.dropdown-menu {
   width: 100%;
   text-align: center;
   opacity: 50%;
   padding: 0;
   border: 0px;
   margin: auto;
}

#content {
   margin: auto;
   padding: 50px 0px;
   width: 80%;
   height: auto;
}

.custom-select {
   width: 200px;
   float: right;
}

#navi {
   background-color: #fced80;
   text-align: center;
}

.nav-item {
   width: 33.3%;
   margin: auto;
   padding: 20px;
   font-size: 20px;
   font-weight: bold;
}

.nav-link {
   color: #ffb100;
   width: 200px;
   font-family: 'Raleway', sans-serif;
}
.nav-link:hover {
   color: #d8b13a;
}

.has-megamenu {
   position: static;
}

.dropdown-menu li{
   padding: 5px 5px;
   font-weight: 400;
   color: #d8b13a;
}

.multi-column-dropdown {
   list-style: none;
   padding: 0px;
}

.location, .category {
   background-color: #fffce7;
   margin: 0px;
   width: 100%;
}

.multi-column-dropdown li, a{
   display: block;
   clear: both;
   line-height: 1.428571429;
   color: #d8b13a;
   white-space: normal;
   padding: 5px;
   width: 100%;
   cursor: pointer;
}

.multi-column-dropdown li:hover, a:hover {
   text-decoration: none;
   color: #ffb100;
   font-weight: bold;
}

.count {
   position: relative;
   right: 100px;
   top: 50px;
   z-index: 10;
}

.carousel-item>img {
   height: 300px;
   border-radius: 20px;
}

#carouselExampleIndicators{
   margin:20px;
}

#main1, #main2 {
   font-family: 'Do Hyeon', sans-serif;
   border-radius: 10px;
}

#main1 {
   color: black;
   margin-left: 100px;
}

#yellow {
   color: #ffb100;
}

.carousel-caption {
   padding-bottom: 90px;
   width: auto;
}

#naviBox {
   width: 50%;
   margin: 30px auto;
   padding: 10px;
}

.naviBtn {
   background-color: white;
   font-weight: bold;
   border: 0px;
   padding: 0px 10px;
}

.naviBtn:hover {
   background-color: #a6e2bf;
}


#footer {
	height: 300px;
	width: 100%;
	background-color: #f2f0e1;
	margin: 0px;
}

#sns>img{
	margin:30px 20px;
	cursor: pointer;
}

#footerMsg{
	margin-right:50px;
	text-align:right;
}
</style>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
$(function(){
	$("#logo").on("click", function() {
		location.href = "start.main";
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
					else if(${loginType=="normal"})
					{
						location.href="logout.login";
					}else{
						location.href="naverLogout.login";
					}
        		});
	}
	
	$(".locationMenu li").on("click",function(){
		var addr = $(this).text();
		alert(addr);
		location.href="info.category?addr="+addr+"&select=info_avgstar desc";
	})
})


			
	</script>
	</head>
<body>

	<div id=wrapper>
		<div class="jumbotron">
			<div id=header class=row>
				<div class="col-12 col-lg-3">
					<img src="logo.png" id=logo>
				</div>
				<div class="col-12 col-lg-6" id=search>
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
				<div class="col-12 col-lg-3">
					<c:choose>
						<c:when test="${loginId==null}">
							<button id="toLogin" class="btn btn-warning my-2 my-sm-0 headBtn"
								type="button">login</button>
							<button id="toSignup"
								class="btn btn-warning my-2 my-sm-0 headBtn" type="button">signup</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-warning my-2 my-sm-0 headBtn"
								type="submit" id=mypage_btn>mypage</button>
							<button class="btn btn-warning my-2 my-sm-0 headBtn"
								type="submit" id=logout_btn>logout</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<h1 class="display-4">나를 위한 시간</h1>
			<p class="lead">집, 회사, 집, 회사 반복되는 지루한 일상이 싫다면?</p>
			<hr class="my-4">
			<p></p>
			<a class="btn btn-outline-light btn-lg"
				href="info.category?category=main&addr=all&select=info_avgstar desc"
				role="button" id="lookBtn">클래스 보러가기</a>
		</div>
		<div id=navi>
			<nav class="navbar navbar-expand navbar-light">
				<ul class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link active"
						href="info.category?category=main&addr=all&select=info_avgstar desc">추천</a></li>
					<li class="nav-item dropdown has-megamenu"><a href="#"
						class="dropdown-toggle nav-link" data-toggle="dropdown"
						d="navbarDropdown" role="button" aria-haspopup="true"
						aria-expanded="false">카테고리</a>

						<ul class="dropdown-menu multi-column columns-6">
							<div class="row category">
								<div class="d-none d-lg-block col-lg-1 CategoryMenu"></div>
								<div class="col-12 col-md-4 col-lg-2 CategoryMenu">
									<ul class="multi-column-dropdown">
										<li><a
											href="info.category?category=design&select=info_avgstar desc&addr=all">
												디자인 <input type=hidden value="design" class=cate>
										</a></li>

									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2  CategoryMenu">
									<ul class="multi-column-dropdown">
										<li><a
											href="info.category?category=it&select=info_avgstar desc&addr=all"
											class=cateA> IT </a> <input type=hidden value="it" class=cate></li>

									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2 CategoryMenu">
									<ul class="multi-column-dropdown">
										<li><a
											href="info.category?category=lang&select=info_avgstar desc&addr=all">언어
										</a> <input type=hidden value="lang" class=cate></li>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2  CategoryMenu">
									<ul class="multi-column-dropdown">
										<li><a
											href="info.category?category=life&select=info_avgstar desc&addr=all">라이프
												스타일 </a> <input type=hidden value="life" class=cate></li>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2 CategoryMenu">
									<ul class="multi-column-dropdown">
										<li><a
											href="info.category?category=money&select=info_avgstar desc&addr=all">제테크
										</a> <input type=hidden value="beauty" class=cate></li>
									</ul>
								</div>
								<div class="d-none d-lg-block col-lg-1 CategoryMenu"></div>
							</div>
						</ul></li>

					<li class="nav-item dropdown has-megamenu"><a href="#"
						class="dropdown-toggle nav-link" data-toggle="dropdown"
						d="navbarDropdown" role="button" aria-haspopup="true"
						aria-expanded="false">지역별</a>

						<ul class="dropdown-menu multi-column columns-6">

							<div class="row location">
								<div class="col-12 col-md-4 col-lg-2 locationMenu">
									<ul class="multi-column-dropdown">
										<li>서울</li>
										<div class="col d-none d-md-block">
											<div class="dropdown-divider"></div>
											<li>강남</li>
											<li>신촌/홍대</li>
											<li>건대</li>
											<li>잠실</li>
											<li>종로</li>
											<li>노원</li>
											<li>사당</li>
											<li>성북</li>
											<li>신림</li>
											<li>목동</li>
											<li>용산</li>
										</div>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2 locationMenu">
									<ul class="multi-column-dropdown">
										<li>경기</li>
										<div class="col d-none d-md-block">
											<div class="dropdown-divider"></div>
											<li>일산/파주</li>
											<li>용인/분당/수원</li>
											<li>인천/부천</li>
											<li>남양주/구리/하남</li>
											<li>안양/안산/광명</li>
										</div>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2 locationMenu">
									<ul class="multi-column-dropdown">
										<li>충청</li>

										<div class="col d-none d-md-block">
											<div class="dropdown-divider"></div>
											<li>대전</li>
											<li>충청</li>
										</div>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2  locationMenu">
									<ul class="multi-column-dropdown">
										<li>경상</li>
										<div class="col d-none d-md-block">
											<div class="dropdown-divider"></div>
											<li>대구</li>
											<li>경북</li>
											<li>부산</li>
											<li>경남</li>
										</div>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2 locationMenu">
									<ul class="multi-column-dropdown">
										<li>전라</li>
										<div class="col d-none d-md-block">
											<div class="dropdown-divider"></div>
											<li>광주</li>
											<li>전라</li>
										</div>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2  locationMenu">
									<ul class="multi-column-dropdown">
										<li>강원 / 제주</li>
										<div class="col d-none d-md-block">
											<div class="dropdown-divider"></div>
											<li>강원</li>
											<li>제주</li>
										</div>
									</ul>
								</div>
							</div>
						</ul></li>



				</ul>
			</nav>
		</div>

		<div id=content>
			<div class="row">
			<div class="col-12 col-lg-6">
			<div class="card mb-3" style="max-width: auto;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="..." class="card-img" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-12 col-lg-6">
			<div class="card mb-3" style="max-width: auto;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="..." class="card-img" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>
			</div>
			</div>
</div>


			
				<div id="carousel" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel" data-slide-to="1"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="메인1.jpg" class="d-block w-100 mainImg" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h1 id=main1>
									현재 <span id=count class=yellow>${count }</span>개 클래스 등록!
								</h1>
								<p></p>
							</div>

						</div>
						<div class="carousel-item">
							<img src="메인2.jpg" class="d-block w-100 mainImg" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h1 id="main2">
									신규가입 하고, <span id=honey class=yellow>1 꿀</span> 받자!
								</h1>
								<p></p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carousel"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>



		<div id=footer class="row">
			<div class="col-12 col-md-8"></div>
			<div class="col-12 col-md-4" id=sns>
		<img src="https://img.icons8.com/ios/48/000000/facebook.png">
		<img src="https://img.icons8.com/ios/48/000000/twitter.png">
		<img src="https://img.icons8.com/ios/48/000000/instagram-new.png">
		<img src="https://img.icons8.com/ios/48/000000/github.png">
			</div>
			<div id=footerMsg>
			(주)꿀단지 | 서울특별시 중구 남대문로 120 대일빌딩 3층<br>
			© Ggooldanji. all rights reserved.	
			</div>
		</div>
	</div>
</body>
</html>
