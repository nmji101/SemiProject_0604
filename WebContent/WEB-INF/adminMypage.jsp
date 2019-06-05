<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>

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
	color: cornflowerblue;
	font-weight: bold;
}
.row * {
	text-align: center;
}
#searchSelect {
	width: 200px;
	margin: 0px;
}
.navi_page_btn{
	border-style : none;
	background-color : white;
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
		
	    $("#profile_img_btn").on("click", function()
	    {
		    var popOption = "width=300, height=300, resizable=no, scrollbars=no, status=no top=100, left=100;";
		    
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
            	alert(page); //확인용
            	if(page=="<이전"){
            		page = ${beginpage}-1;
            	}else if(page=="다음>"){
            		page = ${endpage}+1;
            	}
            	location.href = "clickPage.admin?currentPage="+page;
	    });
    });

</script>


</head>
<body>


	<div class="container col-12">

		<div id=header class=row>

			<div id="logo_div" class="col-12 col-lg-3">

				<a href="mainHomePage.jsp"><img src="logo.png" id=logo></a>

			</div>

			<div class="col-12 col-lg-6">

				<form id=search class="form-inline my-2 my-lg-0">

					<div class="row justify-content-center">

						<div id="searchbox_div" class="col-12">

							<input type="search" placeholder="취미를 검색해 보세요!"
								aria-label="Search" id=searchbox>

							<button class="btn btn-warning my-2 my-sm-0 headBtn"
								type="submit">Search</button>

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

									<h3>${ dto.m_nickname } 님 환영합니다.</h3>

								</button>

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

								<button id="tutorList_btn" class="btn btn link my-3">
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
								<span>튜터 승인 요청 목록</span>
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
									<div class="col-lg-12 col-md-12 col-sm-12">
										<span>튜터 승인 요청 목록이 없습니다.</span>
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
						<div class="row footer">
							<div class="col-lg-3 col-md-3 col-sm-3">
								<input id="toApplyTutor" class="footBtn" type="button"
									value="튜터승인하기">
							</div>
							<div class="col-lg-9 col-md-9 col-sm-9 text-right">
								<select id="searchSelect" class="custom-select mb-2">
									<option selected value="way">검색방법</option>
									<option value="memberId">아이디</option>
									<option value="nickname">닉네임</option>
								</select> <input id="tutor_searchInput" type="text" class="footText"
									placeholder="검색입력"> <input id="tutor_search_Btn"
									class="footBtn mr-3" type="button" value="검색">
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>

	</div>


	</div>

</body>
</html>