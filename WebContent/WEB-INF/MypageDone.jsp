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

#contents_div  img {
	width: 100%;
	height: 100%;
}

.class_btn_div {
	text-align: center;
}

#navi_div {
	text-align: center;
}

#done_class_btn {
	color: cornflowerblue;
	font-weight: bold;
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
	    
	    // 이 위로는 공통 함수
	    
	    $(document).on("click", ".review_class_btn", function()
	    {
            var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no top=100, left=100;";
			var classTitle = $(this).siblings(".class_title").val();
			var classDate = $(this).siblings(".class_date").val();
			var classId = $(this).siblings(".class_id").val();
            
            open("review.mypage?c_id="+classId+"&date="+classDate+"&title="+classTitle, "", popOption);
	    });
	    
	    $(document).on("click", ".detail_class_btn", function()
	    {
	       location.href = "detail.page?id=" + $(this).attr("name");
	    });
	           	    
	    $(document).on("click", ".navi_btn", function()
	    {
	    	location.href = "done.mypage?page=" + $(this).val();
	    });
	    $(document).on("click","#prev_btn",function()
	    {
	    	location.href = "done.mypage?page="+${ startNavi - 1};
	    });
	    $(document).on("click","#next_btn",function()
	    {
	    	location.href = "done.mypage?page="+${ endNavi + 1};
	    });
	    
	    if(${ currentPage } % 5 == 0)
		{
			$($(".navi_btn")[${ 4 }]).css("color", "red");
		}
		else
		{
			$($(".navi_btn")[${ currentPage %5 - 1 }]).css("color", "red");
		}
	    
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

								<button id="profile_img_btn" class="btn">${ dto.m_photo }

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

		<div id="contents_row" class="row mt-5">

			<div class="col-10">

				<div class="row">

					<div id="menu_div" class="col-lg-3">

						<div class="row">

							<div class="col-6 col-md-4 col-lg-12">

								<button id="ing_class_btn" class="btn btn link my-3">수강
									중 클래스</button>

							</div>

							<div class="col-6 col-md-4 col-lg-12">

								<button id="done_class_btn" class="btn btn link my-3">
									<h5>
										<strong>수강 한 클래스</strong>
									</h5>
								</button>

							</div>

							<div class="col-6 col-md-4 col-lg-12">

								<button id="person_info_btn" class="btn btn link my-3">개인
									정보 수정</button>

							</div>
							
							<div class="col-6 col-md-4 col-lg-12">

								<button id="tutor_page_btn" class="btn btn link my-3">
										
									튜터 페이지
										
								</button>

							</div>
							
						</div>

					</div>

					<div id="contents_div" class="col-lg-9">

						<c:forEach var="i" begin="1" end="${ listsize }" step="1">

							<div class="row class_div my-3">

								<div class="col-12">

									<div class="row">

										<div class="class_img_div col-lg-2 my-auto">

											${ list[i-1].img }
										</div>

										<div class="class_text_div col-lg-7 my-auto">

											<h4>${ list[i-1].title }</h4>
											${ list[i-1].tutorId } <br> 
											${ list[i-1].date } <br>

										</div>

										<div class="class_btn_div col-lg-3 my-auto">

											<input class="btn btn-primary detail_class_btn mx-3" name=${ list[i-1].classId } type="button" value="자세히">
											<input class="btn btn-primary review_class_btn mx-3" name=${ list[i-1].classId } type="button" value="리뷰 작성">
											
											<input class="class_title" type="hidden" value="${ list[i-1].title }">
											<input class="class_date" type="hidden" value="${ list[i-1].date }">
											<input class="class_id" type="hidden" value="${ list[i-1].classId }">
											
										</div>
										
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

			</div>

		</div>


	</div>

</body>
</html>
