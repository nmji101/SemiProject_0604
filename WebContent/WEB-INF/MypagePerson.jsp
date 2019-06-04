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

#person_info_btn {
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
		var attention = ${ dto.m_attention };
		if(attention != [ "없음" ])
		{
			attention.forEach(function(item, index, array)
			{
				$("#"+item).attr("class","btn btn-primary my-1 active");
				$("#"+item).children("input:checkbox").prop("checked", true);
			});
		}
		
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
									<h5>
										<strong>개인 정보 수정</strong>
									</h5>
								</button>

							</div>
							

							<div class="col-6 col-md-4 col-lg-12">

								<button id="tutor_page_btn" class="btn btn link my-3">
										
									튜터 페이지
										
								</button>

							</div>
						</div>

					</div>

					<div id="contents_div" class="col-lg-9">

						<div class="row my-2 mb-3">

							<div class="col-lg-12 my-auto">

								<h2>
									<strong>개인 정보 수정</strong>
								</h2>

							</div>

						</div>

						<div class="row my-2">

							<div class="col-lg-3 my-auto">

								<h4>아이디</h4>

							</div>

							<div class="col-lg-9">

								<label class="form-control my-auto">
								
									${ dto.m_id }
								
								</label>

							</div>

						</div>

						<div class="row my-2">

							<div class="col-lg-3 my-auto">

								<h4>비밀번호</h4>

							</div>

							<div class="col-lg-9">

								<input id="pw_btn" class="btn" type="button" value="비밀번호 수정">

							</div>

						</div>

						<form id="info_form" action="update.mypage" method="post">

							<div class="row my-2">

								<div class="col-lg-3 my-auto">

									<h4>닉네임</h4>

								</div>

								<div class="col-lg-9 my-auto">

									<input class="form-control" type="text" name="nickname"
										value="${ dto.m_nickname }">

								</div>

							</div>

							<div class="row my-2">

								<div class="col-lg-3 my-auto">

									<h4>관심사</h4>

								</div>

								<div class="col-lg-9">

									<div class="btn-group-toggle" data-toggle="buttons">

										<label id="at1" class="btn btn-primary my-1"><input
											type="checkbox" name="attention" value="at1">관심사 1</label>
										<label id="at2" class="btn btn-primary my-1"><input
											type="checkbox" name="attention" value="at2">관심사 2</label>
										<label id="at3" class="btn btn-primary my-1"><input
											type="checkbox" name="attention" value="at3">관심사 3</label>
										<label id="at4" class="btn btn-primary my-1"><input
											type="checkbox" name="attention" value="at4">관심사 4</label>
										<label id="at5" class="btn btn-primary my-1"><input
											type="checkbox" name="attention" value="at5">관심사 5</label>
										<label id="at6" class="btn btn-primary my-1"><input
											type="checkbox" name="attention" value="at6">관심사 6</label>
										<label id="at7" class="btn btn-primary my-1"><input
											type="checkbox" name="attention" value="at7">관심사 7</label>
										<label id="at8" class="btn btn-primary my-1"><input
											type="checkbox" name="attention" value="at8">관심사 8</label>
										<label id="at9" class="btn btn-primary my-1"><input
											type="checkbox" name="attention" value="at9">관심사 9</label>

									</div>
								</div>

							</div>

							<div class="row mt-5 mb-1">

								<div id="update_btn_div" class="col-12">

									<input id="submit_btn" class="btn btn-primary" type="button"
										value="수정하기">

								</div>

							</div>

						</form>





					</div>

				</div>

			</div>

		</div>


	</div>

</body>
</html>





</body>
</html>