<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>

<style>
div {
	border: 1px solid black;
	box-sizing: border-box;
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

#tutor_page_btn {
	color: cornflowerblue;
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
	    $("#search_btn").on("click", function()
	    {
		    location.href = "query.query?query=" + $("#search_text").val();
	    });
	    
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
			location.href = "tutor.mypage?page=1";
		});
	    
	    $("#profile_img_btn").on("click", function()
	    {
		    var popOption = "width=300, height=300, resizable=no, scrollbars=no, status=no top=100, left=100;";
		    
		    open("changeImg.mypage", "", popOption);
	    });
	    
	    $("#profile_nickname_btn").on("click", function()
	    {
		    location.href = "person.mypage";
	    });
	    
    });
    
    onload = function()
    {
	    
    };
</script>


</head>
<body>


	<div class="container col-12 mt-3">

		<div id="header_row" class="row">

			<div class="col-10">

				<div class="row">

					<div id="logo_div" class="col-lg-3 d-none d-xl-block">

						<a href="Homepage.jsp"> <img id="logo_img" src="nmnb.jpg" alt="">

						</a>

					</div>

					<div id="search_div" class="col-lg-12 col-xl-6 my-auto">

						<div class="row">

							<div class="col-lg-9">

								<input id="search_text" class="form-control" type="text"
									placeholder="input text to search">

							</div>

							<div class="col-lg-3">

								<input id="search_btn" class="btn" type="button" value="검색">

							</div>

						</div>


					</div>

					<div id="event_div" class="col-lg-3 d-none d-xl-block">

						<a href="#"> <img id="event_img" src="nmnb.jpg" alt="">

						</a>

					</div>

				</div>

			</div>

		</div>

		<div id="profile_row" class="row">

			<div class="col-10 my-3">

				<div class="row">

					<div class="col-lg-6">

						<div class="row">

							<div id="profile_img_div" class="col-lg-4">

								<button id="profile_img_btn" class="btn">
									${ dto.m_photo }
								</button>

							</div>

							<div id="profile_text_div" class="col-lg-8 my-auto">

								<button id="profile_nickname_btn" class="btn">

									<h3>${ dto.m_nickname } 님 환영합니다.</h3>

								</button>

								<br>

								<button class="btn">뭔가 쓸 거 같은 공간</button>

							</div>

						</div>

					</div>

					<div class="col-lg-6">

						<div class="row">

							<div class="col-md-12 my-auto">무언가에 쓸 수 있을 거 같은 공간</div>

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

							<div class="col-6 col-md-4 col-lg-12">

								<button id="ing_class_btn" class="btn btn link my-3">수강
									중 클래스</button>

							</div>

							<div class="col-6 col-md-4 col-lg-12">

								<button id="done_class_btn" class="btn btn link my-3">수강
									한 클래스</button>

							</div>

							<div class="col-6 col-md-4 col-lg-12">

								<button id="person_info_btn" class="btn btn link my-3">
									개인 정보 수정
								</button>

							</div>
							
							<div class="col-6 col-md-4 col-lg-12">

								<button id="tutor_page_btn" class="btn btn link my-3">
										
									<h5>
										<strong>튜터 페이지</strong>
									</h5>
										
								</button>

							</div>
							
						</div>

					</div>

					<div id="contents_div" class="col-lg-9">

						<c:if test="${ check == 'true' }">
						
							<span>현재 신청 대기중</span>
							
						</c:if>
						
						<c:if test="${ check == 'false' }">
						
							<form id="apply_form" action="apply.mypage" method="post">
						
								<input name="id" type="hidden" value="${ dto.m_id }">
								<input name="nickname" type="hidden" value="${ dto.m_nickname }">
								
								<input type="submit">
								
							</form>
							
						</c:if>
						
						<c:if test="${ check == 'tutor' }">
						
							<script>
							
								location.href = "ForTutor.jsp";
							
							</script>
							
						</c:if>
												

					</div>

				</div>

			</div>

		</div>


	</div>

</body>
</html>