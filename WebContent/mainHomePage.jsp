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
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR|Acme|Nanum+Pen+Script&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" sizes="32x32"
	href="/favicon-32x32.png">
<style>
/* 헤드부분 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}

#logo {
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

.headBtn, .more {
	color: white;
}

.headBtn:hover, .more:hover {
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
	text-shadow: 0px 0px 5px grey;
}

#lookBtn:hover{
	text-shadow: none;
	transition-duration: 0.5s;
}

.display-4 {
	font-family: 'Do Hyeon', sans-serif;
	text-shadow: 0px 0px 7px white;
}

.lead{
text-shadow: 0px 0px 5px white;
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

#popular>h2 {
	font-family: 'Nanum Pen Script', cursive;
	font-style: italic;
	font-size:50px;
	text-align: left;
	color: #d66b8e;
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
	width: 25%;
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

.navbar>ul {
	width: 70%;
	margin: auto;
}

.dropdown-menu li {
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

.multi-column-dropdown li, a {
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

#count, #honey {
	font-family: 'Do Hyeon', sans-serif;
	color: #ffba00;
}
.card-title{
	font-family: 'Do Hyeon', sans-serif;;
}
.carousel-item>img {
	width: 100%;
	height: 350px;
	margin:auto;
	border-radius: 20px;
}

#carousel {
	margin: 30px auto;
}

.popular>img{
	height:100%;
}

#main1, #main2 {
	font-family: 'Do Hyeon', sans-serif;
	border-radius: 10px;
	text-shadow: 5px 5px 5px grey;
	font-size: 50px;
}

#card, .none {
	width: 100%;
	margin: 30px auto;
}

.card{
	border-radius: 20px;
	height: 210px;
	border: 1px dashed #ffeeba;
	color : #856404;
}
.carousel-caption {
	padding-bottom: 90px;
	width: auto;
}
.review{
	width: 100%;
	height: 90px;
	overflow-x : none;
	overflow-y : auto;
	margin-bottom:10px;	
	background-color: #ffeeba;
	border-radius: 20px;
	text-align: left;
	padding: 5px 20px;
}

.row {
	margin: 0px;
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

#sns>img {
	margin: 30px 20px;
	cursor: pointer;
}

#footerMsg {
	margin-right: 50px;
	text-align: right;
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
		var tmp = $(this).text();
		var addr1 = tmp.replace(/(.+)\/(.+)/g,"$1");
		var addr2 = tmp.replace(/(.+)\/(.+)/g,"$2");
		if(addr1 != addr2){
			location.href="info.category?addr1="+addr1+"&addr2="+addr2+"&select=info_avgstar desc";
		
		}else{
			location.href="info.category?addr1="+addr1+"&select=info_avgstar desc";
		}
	});
	
	$(".more").each(function (i, item) {
			var id = $(item).children().val();
			$(item).on("click",function(){
				location.href="clickClass.classInfo?classId="+id;
			})	
	});
	
	$(".has-megamenu").on("click",function(){
			$(this).css("transition-duration","2s");
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
				href="info.category?category=main&addr1=all&select=info_avgstar desc"
				role="button" id="lookBtn">클래스 보러가기</a>
		</div>
		<div id=navi>
			<nav class="navbar navbar-expand navbar-light">
				<ul class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link active"
						href="info.category?category=main&addr1=all&select=info_avgstar desc">추천</a></li>
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
											href="info.category?category=design&select=info_avgstar desc&addr1=all">
												디자인 <input type=hidden value="design" class=cate>
										</a></li>

									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2  CategoryMenu">
									<ul class="multi-column-dropdown">
										<li><a
											href="info.category?category=it&select=info_avgstar desc&addr1=all"
											class=cateA> IT </a> <input type=hidden value="it" class=cate></li>

									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2 CategoryMenu">
									<ul class="multi-column-dropdown">
										<li><a
											href="info.category?category=lang&select=info_avgstar desc&addr1=all">언어
										</a> <input type=hidden value="lang" class=cate></li>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2  CategoryMenu">
									<ul class="multi-column-dropdown">
										<li><a
											href="info.category?category=life&select=info_avgstar desc&addr1=all">라이프
												스타일 </a> <input type=hidden value="life" class=cate></li>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2 CategoryMenu">
									<ul class="multi-column-dropdown">
										<li><a
											href="info.category?category=money&select=info_avgstar desc&addr1=all">재테크
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
											<li>강남/서초</li>
											<li>서대문/마포</li>
											<li>송파/잠실</li>
											<li>종로/성동</li>
											<li>노원</li>
											<li>동작</li>
											<li>성북/동대문</li>
											<li>관악/신림</li>
											<li>영등포/구로</li>
											<li>강서/양천</li>
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
											<li>용인/분당</li>
											<li>수원/성남</li>
											<li>인천/부천</li>
											<li>남양주/구리</li>
											<li>안양/안산</li>
										</div>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2 locationMenu">
									<ul class="multi-column-dropdown">
										<li>충청도</li>

										<div class="col d-none d-md-block">
											<div class="dropdown-divider"></div>
											<li>대전</li>
											<li>충청</li>
										</div>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2  locationMenu">
									<ul class="multi-column-dropdown">
										<li>경상도</li>
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
										<li>전라도</li>
										<div class="col d-none d-md-block">
											<div class="dropdown-divider"></div>
											<li>광주</li>
											<li>전라</li>
										</div>
									</ul>
								</div>
								<div class="col-12 col-md-4 col-lg-2  locationMenu">
									<ul class="multi-column-dropdown">
										<li>강원/제주</li>
										<div class="col d-none d-md-block">
											<div class="dropdown-divider"></div>
											<li>강원</li>
											<li>제주</li>
										</div>
									</ul>
								</div>
							</div>
						</ul></li>

					<li class="nav-item"><a class="nav-link active"
						href="list.notice?page=1">공지사항</a></li>

				</ul>
			</nav>
		</div>

		<div id=content>
			<div class="row">
			<c:choose>
				<c:when test="${dto1!=null || dto2!=null}">
				<div class="col-12" id=popular>
					<h2>
					<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
width="48" height="48"
viewBox="0 0 192 192"
style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,192v-192h192v192z" fill="none"></path><g fill="#d66b8e"><g id="surface1"><path d="M45.72,23.04c-25.215,0 -45.72,20.505 -45.72,45.72c0,41.13 37.53,66.915 62.4,84c6.27,4.305 11.79,8.145 15.84,11.52l2.4,2.04l2.4,-2.04c2.565,-2.13 5.73,-4.485 9.24,-6.96c-13.125,-17.175 -29.685,-42.645 -20.4,-71.16c5.55,-17.07 21.3,-28.56 39.24,-28.56c4.35,0 8.685,0.69 12.84,2.04c8.565,2.79 15.9,8.325 21,15.6c4.305,-1.47 8.835,-2.28 13.44,-2.28c0.87,0 1.77,0.06 2.64,0.12c0.09,-1.44 0.24,-2.865 0.24,-4.32c0,-25.215 -20.505,-45.72 -45.72,-45.72c-13.425,0 -26.145,6.18 -34.92,16.68c-8.775,-10.5 -21.495,-16.68 -34.92,-16.68zM111.12,65.28c-14.61,0 -27.405,9.39 -31.92,23.28c-9.15,28.08 10.65,53.265 23.76,69.96c3.495,4.44 6.465,8.25 8.52,11.52l1.68,2.76l3,-1.2c3.585,-1.425 8.25,-2.79 13.68,-4.32c20.43,-5.76 51.33,-14.52 60.48,-42.6c5.73,-17.64 -3.975,-36.63 -21.6,-42.36c-8.94,-2.925 -18.9,-1.83 -27,2.76c-3.87,-8.565 -11.085,-15.165 -20.16,-18.12c-3.39,-1.095 -6.915,-1.68 -10.44,-1.68z"></path></g></g></g></svg>
					요즘 인기많은 클래스
					</h2>
				</div>
				<div id=card>
					<div class="row">
						<div class="col-12 col-lg-6">
							<div class="card mb-3" style="max-width: auto;">
								<div class="row no-gutters">
									<div class="col-md-5">
										<!-- 캐러셀 시작 -->
										<div class="carousel slide" data-ride="carousel" id=main1>
											<div class="carousel-inner">
												<div class="carousel-item active popular">
													<img src="${dto1.info_img1 }" class="d-block w-100"
														alt="이미지가 없습니다."">
												</div>

												<c:choose>
													<c:when test="${dto1.info_img2 != null }">
														<div class="carousel-item popular">
															<img src="${dto1.info_img2 }" class="d-block w-100"
																alt="이미지가 없습니다.">
														</div>
													</c:when>
												</c:choose>

												<c:choose>
													<c:when test="${dto1.info_img3 != null }">
														<div class="carousel-item popular">
															<img src="${dto1.info_img3 }" class="d-block
																w-100" alt="이미지가 없습니다.">
														</div>
													</c:when>
												</c:choose>

											</div>
											<a class="carousel-control-prev" href="#main1"
												role="button" data-slide="prev"> <span
												class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="sr-only">Previous</span>
											</a> <a class="carousel-control-next" href="#main1"
												role="button" data-slide="next"> <span
												class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="sr-only">Next</span>
											</a>
										</div>
										<!-- 캐러셀 끝 -->
									</div>
									<div class="col-md-7">
										<div class="card-body">
											<h5 class="card-title"> ${dto1.info_category} : ${dto1.info_title }</h5>
											
											<div class="review">
											<c:choose>
											<c:when test="${size1 == 0}">
											<p class=none>아직 등록된 후기가 없습니다.</p>
											</c:when>
											<c:otherwise>
											<c:forEach items="${review1}" var="list">
											<p>${list.re_review }</p>
											<hr>
											</c:forEach>
											</c:otherwise>
											</c:choose>
											</div>
											<p class="card-text">
												<small class="text-muted">
												<button type="button" class="btn btn-warning more">자세히 보기
												<input type=hidden value=${dto1.info_classid }>
												</button>
												</small>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-lg-6">
							<div class="card mb-3" style="max-width: auto;">
								<div class="row no-gutters">
									<div class="col-md-5">
										<!-- 캐러셀 시작 -->
										<div class="carousel slide" data-ride="carousel" id="main2">
											<div class="carousel-inner">
												<div class="carousel-item active popular">
													<img src="${dto2.info_img1 }" class="d-block w-100"
														alt="이미지가 없습니다.">
												</div>

												<c:choose>
													<c:when test="${dto2.info_img2 != null }">
														<div class="carousel-item popular">
															<img src="${dto2.info_img2 }" class="d-block w-100"
																alt="이미지가 없습니다.">
														</div>
													</c:when>
												</c:choose>

												<c:choose>
													<c:when test="${dto2.info_img3 != null }">
														<div class="carousel-item popular">
															<img src="${dto2.info_img3 }" class="d-block
																w-100" alt="이미지가 없습니다.">
														</div>
													</c:when>
												</c:choose>

											</div>
											<a class="carousel-control-prev" href="#main2"
												role="button" data-slide="prev"> <span
												class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="sr-only">Previous</span>
											</a> <a class="carousel-control-next" href="#main2"
												role="button" data-slide="next"> <span
												class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="sr-only">Next</span>
											</a>
										</div>
										<!-- 캐러셀 끝 -->
									</div>
									<div class="col-md-7">
										<div class="card-body">
											<h5 class="card-title">${dto2.info_category} : ${dto2.info_title }</h5>
											<div class="review">
											<c:choose>
											<c:when test="${size2 == 0}">
											<p class=none>아직 등록된 후기가 없습니다.</p>
											</c:when>
											<c:otherwise>
											<c:forEach items="${review2}" var="list">
											<p>${list.re_review }</p>
											<hr>
											</c:forEach>
											</c:otherwise>
											</c:choose>
											</div>
											<p class="card-text">
												<small class="text-muted">
												<button type="button" class="btn btn-warning more">자세히 보기<input type=hidden value=${dto2.info_classid }></button>
												</small>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:when>
				</c:choose>
			</div>



			<div id="carousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel" data-slide-to="0" class="active"></li>
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
				<a class="carousel-control-prev" href="#carousel" role="button"
					data-slide="prev"> <span class="carousel-control-prev-icon"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carousel" role="button"
					data-slide="next"> <span class="carousel-control-next-icon"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>
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
	</div>
</body>
</html>
