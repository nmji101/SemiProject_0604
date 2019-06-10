<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="/favicon-32x32.png">
<link
	href="https://fonts.googleapis.com/css?family=Gugi|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
/*         header	 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}

#contents_div>.row:not (.bottomNavi ){
	border-bottom: 1px solid rgba(0, 0, 0, 0.26);
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
}

.headBtn:hover {
	background-color: burlywood;
	border: 1px solid burlywood;
	color: white;
}
/*         header	 */
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

h2 {
	font-family: 'Gugi', cursive;
	color: #ffba00;
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

#contents_div  img {
	width: 100%;
	height: 100%;
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

#tutorList_btn {
	color: white;
	font-weight: bold;
}

.row * {
	text-align: center;
}

#searchSelect {
	width: 200px;
	margin: 0px;
}

.navi_page_btn {
	border-style: none;
	background-color: white;
}

.header {
	background-color: rgba(255, 186, 0, 0.69);
	border-radius: 5px;
}

.topNavi {
	background-color: rgba(255, 186, 0, 0.29);
	border-radius: 5px;
}

.content>div {
	cursor: pointer;
}
.content{
	min-height: 300px;
}
.lineContent:hover {
	background-color: rgba(157, 255, 0, 0.15);
}
#contents_div{
	margin-bottom: 30px;
}
.footer {
	height: 50px !important;
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
.container{
	padding: 0px !important;
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
                $("#tutorList_btn").on("click",function(){
                	location.href ="mypage.admin";
                	
                });
                    $("#mypage_btn").on("click", function(){
                            location.href = "mypage.admin";
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

                $(".lineContent").each(function(i,item){
					$(item).on("click",function(){
						var checked = $(this).find(".checkedId").prop("checked");
						if(checked==false){
							$(this).find(".checkedId").prop("checked",true);
						}else{
							$(this).find(".checkedId").prop("checked",false);
						}
					})
				})
                $("#profile_img_btn").on("click", function()
                                         {
                	var popOption = "width=500, height=300, resizable=no, scrollbars=no, status=no top=100, left=100;";

                    open("changeImg.mypage", "", popOption);
                });

                $("#toApplyTutor").on("click",function(){//승인하기 버튼 눌렀을때
                    var checkedIdLength =  $(".checkedId:checked").length;
                    if(checkedIdLength==0){
                        alert("튜터승인할 아이디를 선택해주세요");
                        return;
                    }
                    var applyTutorForm = $('<form></form>');
                    $(applyTutorForm).attr('action', 'tutorUpgrade.admin');
                    $(applyTutorForm).attr('method', 'post');
                    $(applyTutorForm).appendTo('body');

                    $(".checkedId").each(function(i,item){
                        if($(item).prop("checked")==true){
                            var val = $(item).val();
                            alert(val);
                            var input = $('<input type="hidden" value="'+val+'" name="checkedId">');
                            $(applyTutorForm).append(input);
                        }
                    });       
                    $(applyTutorForm).submit();
                });

                $(".navi_page_btn").on("click",function(){
                    var page = $(this).text();
                    //alert(page); //확인용
                    if(page=="<이전"){
                        page = ${beginPage}-1;
                    }else if(page=="다음>"){
                        page = ${endPage}+1;
                    }
                    $("#currentPage").val(page);
                    $("#clickSearchPage").submit();
                });
                $(".navi_page_btn").each(function(i,item){
                	var currentBtn = $(item).text();
                	var currentPage = "${currentPage}";
                	if(currentBtn==currentPage){
                		$(item).css("color","#ffba00");
                	}
                });
                
                $("#tutor_search_Btn").on("click",function(){//검색버튼 눌렀을때
                	var select = document.getElementById("searchSelect");
                	var way = select[select.selectedIndex].value;
                	
                	var searchInput = $("#tutor_searchInput").val();
                	var regex = /^ +?$/;
                	var result = regex.exec(searchInput);
                	
                	if(way=="way"){
                		alert("검색방법을 선택해주세요.");
                		return;
                	}else if(result!=null){//검색입력을 안했다면
                		alert("검색할 내용을 1글자 이상 입력해주세요.");
                		$("#tutor_searchInput").focus();
                		return;
                	}
                	location.href = "searchTutor.admin?way="+way+"&search="+searchInput;
                });
                
                $("#toAdminPage").on("click",function(){
                	location.href = "mypage.admin?search=search";
                })
            });

        </script>


</head>
<body>
	<form id="clickSearchPage" action="searchTutor.admin" method="post">
		<input type="hidden" name="way" value="${way }"> <input
			type="hidden" name="search" value="${search }"> <input
			id="currentPage" type="hidden" name="currentPage" value="">
	</form>

	<div class="container col-12">

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


				<button class="btn btn-warning headBtn" type="submit" id=mypage_btn>mypage</button>

				<button class="btn btn-warning headBtn" type="submit" id=logout_btn>logout</button>
			</div>

		</div>

		<div id="profile_row" class="row">

			<div class="col-10 my-3">

				<div id="profile_div_row" class="row">

					<div class="col-lg-6">

						<div id="profile_div" class="row">

							<div id="profile_img_div" class="col-lg-4">

								<button id="profile_img_btn" class="btn">${ dto.m_photo }

								</button>

							</div>

							<div id="profile_text_div" class="col-lg-8 my-auto px-3">

								<h2>${ dto.m_nickname }
									<br>[관리자 모드]
								</h2>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

		<div id="contents_row" class="row mt-5">

			<div class="col-10">

				<div class="row">

					<div id="menu_div" class="col-lg-3">

						<div class="row">

							<div class="col-12">

								<button id="tutorList_btn" class="btn btn-warning py-3">
									<h5>
										<strong>튜터요청목록</strong>
									</h5>
								</button>

							</div>

						</div>

					</div>
					<div id="contents_div" class="col-lg-9">

						<div class="row header">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<span>튜터 승인 요청 목록 [ ${wayWord }로 검색 : "${search }" ]</span>
							</div>
						</div>
						<!--					order-(size)-순서-->
						<div class="row topNavi">
							<!--			d-xs-none -> d-none -->
							<div class="col-lg-2 col-md-2 d-none d-md-block">No</div>
							<div class="col-lg-2 col-md-2 col-sm-5 col-6">회원ID</div>
							<div class="col-lg-3 col-md-3 col-sm-5 col-6">회원닉네임</div>
							<div class="col-lg-3 col-md-3 d-none d-md-block">튜터신청일자</div>
							<div class="col-lg-2 col-md-2 col-sm-2 d-2">선택</div>
						</div>
						<div class="row content">
							<c:choose>
								<c:when test="${upgradeList==null}">
									<div class="col-lg-12 col-md-12 col-sm-12" style="line-height: 300px">
										<span>검색어 : ${search} / 검색결과가 없습니다.</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="p-0 col-lg-12 col-md-12 col-sm-12">
										<c:forEach var="list" items="${upgradeList}">
											<div class="m-0 p-0 row lineContent">
												<div class="col-lg-2 col-md-2 d-none d-md-block">${list.up_seq }</div>
												<div class="col-lg-2 col-md-2 col-sm-5 col-6">${list.up_id }</div>
												<div class="col-lg-3 col-md-3 col-sm-5 col-6">${list.up_nickname }</div>
												<div class="col-lg-3 col-md-3 d-none d-md-block">${list.up_applydate }</div>
												<div class="col-lg-2 col-md-2 col-sm-2 d-2">
													<input class="checkedId" type="checkbox"
														value="${list.up_id }">
												</div>
											</div>
										</c:forEach>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="row bottomNavi">
							<div class="col-lg-3 col-md-3 col-sm-3"></div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<c:forEach var="n" items="${navi}">
									<button type="button" class="navi_page_btn">${n}</button>
								</c:forEach>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3"></div>
						</div>
						<div class="row footer mt-2">
							<div class="col-lg-3 col-md-12 col-sm-12">
								<button id="toApplyTutor" type="button"
									class="btn btn-outline-warning footBtn">튜터승인하기</button>
								<button id="toAdminPage" type="button"
									class="btn btn-outline-warning footBtn">전체목록보기</button>
							</div>
							<div class="col-lg-9 col-md-12 col-sm-12 text-right">
								<select id="searchSelect" class="custom-select mb-2">
									<option selected value="way">검색방법</option>
									<option value="up_id">아이디</option>
									<option value="up_nickname">닉네임</option>
								</select> <input id="tutor_searchInput" type="text" class="footText"
									placeholder="검색입력">
								<button id="tutor_search_Btn" type="button"
									class="btn btn-outline-warning footBtn mr-3 mb-1 px-3">검색</button>
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>

		<div id="footer" class="row">
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