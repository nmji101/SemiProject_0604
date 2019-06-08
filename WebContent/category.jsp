<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Category</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<script>
$(function(){
	$("#logo").on("click", function() {
		location.href = "start.main";
	});
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
	if(${loginId == null}){
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
					}
	    		})
	};
	$(".custom-select").on("click",function(){
		var select = $(this).val();
		console.log(select);
		if(select == 'info_price' || select == 'info_classid desc' || select == 'info_avgstar desc'){
			location.href="info.category?select="+select;
		}
		
	});
	
	$(".classCard").on("click",function(){
		var classId = $(this).children(".classId").val();
		location.href="clickClass.classInfo?classId="+classId;
	});		
	

	$(".tmp").each(function(i,item){
		var tmp = $(item).val();
		var result = tmp.replace(/[0-9]/g,"");
		$(item).parent().html(result);
	});


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
	
	$(".price").each(function (i, item) {
		var price = $(item).val();
		var result = price.replace(/(.?.?.?)([0-9][0-9][0-9])$/g,"$1,$2 원");
		console.log(result);
		$(item).parent().text(result);
	})
});

</script>
</head>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}
#searchbox {
	height: 38px;
	position: relative;
	top: 4px;
	border: 1px solid #ffba00;
	border-radius: 10px;
	padding: 10px;
}
#logo {
	position: relative;
	bottom: 20px;
	cursor: pointer;
}
div {
	width: 100%;
	text-align: center;
}
#header {
	height: 100%;
	width: 100%;
	padding: 64px 32px;
}
.headBtn {
	color: white;
}
.headBtn:hover {
	background-color: burlywood;
	border: 1px solid burlywood;
	color: white;
}
#navi {
	width: 100%;
	height: auto;
	position: static;
}
.collapse {
	text-align: center;
}
.menu {
	height: 100%;
	width: 33.33%;
	float: left;
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
	transition-duration: 1s;
}
#soon {
	text-align: center;
	color: #7e7666;
	font-size: 20px;
	margin-bottom: 80px;
}
#content {
	margin: auto;
	width: 80%;
	height: auto;
}
.card-body{
	text-align: left;
}
.card-body>img{
	height: 80px;
	width: 80px;
	float:right;
	border-radius: 50px;

}
#starBox{
	float: left;
	margin-right:10px;
}
.custom-select {
	width: 200px;
	margin: 20px 0px;
	float: right;
	border-color: #ffba00;
	border-radius: 10px;
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
	font-weight: bold;
}
.nav-link:hover {
	color: #d8b13a;
}
.has-megamenu {
	position: static;
}

.navbar>ul{
	width:70%;
	margin:auto;
}

.dropdown-menu li, a{
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
.cardItem {
	width: 100%;
}
.star {
	width: 15px;
}
.card {
	margin: 20px auto;
	cursor: pointer;
}
.card-text:hover {
	text-decoration: underline;
}
.face {
	float: right;
	border-radius: 50px;
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
.naviBtn:focus {
	color: #ffb100;
}
.naviBtn:hover {
	color: #ffb100;
}
#footer {
	height: 300px;
	width: 100%;
	background-color: #f2f0e1;
	margin: 0px;
}
#sns>img {
	width: 50px;
}
#sns>img{
	margin:30px 20px;
	cursor: pointer;
}

#footerMsg{
	margin-right:50px;
	text-align: right;
}
</style>
<body>

	<div id=wrapper>
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
								<button id="search_Btn" class="btn btn-warning my-2 my-sm-0 headBtn"
									type="button">Search</button>
							</div>
					</div>
				</form>
			</div>
			<div class="col-12 col-lg-3">
				<c:choose>
					<c:when test="${loginId==null}">
						<button id="toLogin" class="btn btn-warning my-2 my-sm-0 headBtn"
							type="button">login</button>
						<button id="toSignup" class="btn btn-warning my-2 my-sm-0 headBtn"
							type="button">signup</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-warning my-2 my-sm-0 headBtn" type="submit"
							id=mypage_btn>mypage</button>
						<button class="btn btn-warning my-2 my-sm-0 headBtn" type="submit"
							id=logout_btn>logout</button>
					</c:otherwise>
				</c:choose>
			</div>
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
											<li>영등포/양천</li>
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
	</div>
	<div id=content>

		<c:choose>
			<c:when test="${size != 0}">
				<select class="custom-select">
					<option selected>분류</option>
					<option value="info_avgstar desc">추천순</option>
					<option value="info_classid desc">최신순</option>
					<option value="info_price">낮은 가격순</option>
				</select>


				<div class="row cardItem">
					<c:forEach var="list" items="${list }">
						<div class="col-12 col-md-6 col-lg-4 cardItem classCard">
							<input type="hidden" class="classId"
								value="${list.info_classid }">
							<!-- N명참여 배치용 -->
							<span class="count"> 
							<span class="badge badge-pill badge-success"> 
							<span class="badge badge-success">${list.totalcount }</span> 명 참여
							</span>
							</span>
							<!----------------->
							<div class="card" style="width: 18rem">
								<!-- 캐러셀 시작 -->
								<div class="carousel slide" data-ride="carousel">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="${list.info_img1 }" class="d-block w-100" alt="이미지가 없습니다."
												width="200px" height="200px">
										</div>
										
										<c:choose>
										<c:when test="${list.info_img2 != null }">
										<div class="carousel-item">
											<img src="${list.info_img2 }" class="d-block w-100" alt="이미지가 없습니다."
												width="200px" height="200px">
										</div>
										</c:when>		
										</c:choose>
										
										<c:choose>
										<c:when test="${list.info_img3 != null }">
										<div class="carousel-item">
											<img src="${list.info_img3 }" class=d-block w-100" alt="이미지가 없습니다."
												width="200px" height="200px">
										</div>
										</c:when>		
										</c:choose>
										
									</div>
									<a class="carousel-control-prev" href="#carousel" role="button"
										data-slide="prev"> <span
										class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="carousel-control-next" href="#carousel"
										role="button" data-slide="next"> <span
										class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
								<!-- 캐러셀 끝 -->
								<div class="card-body">
									${list.m_photo }
									<span id=starBox> <c:choose>
											<c:when test="${list.info_avgstar =='0'}">
												<span class="badge badge-pill badge-info">New</span>
											</c:when>
										</c:choose> <c:forEach begin="1" end="${list.info_avgstar}">
											<img src="star.jfif" class=star>
										</c:forEach>
									</span><br>
									<p class="card-text">
										<b>${list.info_title }</b>
									</p>
									<p>
										<span><input type="hidden" value=${list.info_price } class=price></span> | <span>${list.m_nickname }</span>
									</p>
									<p class=addr2>
										<input type="hidden" value="${list.info_addr2 }" class=tmp>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id=naviBox class="row justify-content-center">
					<c:forEach var="i" begin="0" end="${size-1}">
						<form action="info.category" method="post" class=btnForm>
							<input type=submit value="${navi[i] }" class="naviBtn"
								name="nowPage">
						</form>
					</c:forEach>
		
				</div>
			</c:when>
			<c:when test="${searchResult != null}">
				<div id=soon>
					<img src="커밍순.png"><br> 
					검색어 : ${searchResult}<br>
					<b>검색결과가 없습니다.</b><br>
				</div>
			</c:when>
			<c:when test="${searchResult == null}">
				<div id=soon>
					<img src="커밍순.png"><br> 현재 클래스 준비 중입니다.
					<br> 튜터가 되어 첫번째 클래스를 오픈해주세요!
				</div>
			</c:when>
	</c:choose>
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
</body>
</html>