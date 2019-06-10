<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--                달력 api cdn-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--                /달력 api cdn-->

<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/png" sizes="32x32"
	href="/favicon-32x32.png">
<style>
/*         header	 */

/* 해당 #3f51b5 색상코드 변경 시 디자인 일괄적용 */

/* datepicker Style */
.ui-datepicker {
	width: 270px;
	padding: 0;
	display: none;
	border: 0;
	margin-top: 10px;
	font-size: 15px;
}
#datepicker *{
	text-align: center;
}
.ui-widget.ui-widget-content {
	border: 0;
	border-radius: 3px;
	overflow: hidden;
	background: none;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
}

.ui-datepicker .ui-widget-header {
	position: relative;
	padding: 6px 0 36px 0;
	border: 0;
	background: rgba(135, 206, 235, 0.52);
	color: #fff;
	border-radius: 0;
}
.ui-state-default:not(.ui-state-highlight):not(.ui-state-active){
	background-color: #fff !important;
}
.ui-state-highlight {
	text-align: center !important;
}
.ui-state-active {
	color: rgb(0, 157, 255) !important;
	border: 1px solid rgba(135, 206, 250, 0.28) !important;
	font-weight: bold;
	background-color:rgba(135, 206, 250, 0.28) !important;
}

#schedule * {
	font-size: 16px;
	width: 100%;
	text-align: center;
}

#select *:not(img) {
	font-size: 16px;
	width: 100%;
}

#select {
	border: 2px solid rgba(135, 206, 235, 0.52);
	border-radius: 10px;
	padding: 1px;
	margin: 2px;
}

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

#header {
	height: 100%;
	width: 100%;
	padding: 64px 32px;
}

#header>div {
	padding: 0px 15px;
}

#header * {
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

/*         header	 */
#myCarousel1 {
	width: 100%;
}

div {
	border: none;
	box-sizing: border-box;
}

#wrapper {
	overflow: hidden;
}

#topMenu {
	margin: 0px;
	padding: 0px;
	text-align: center;
}

#topMenu>li {
	float: left;
	list-style: none;
	width: 25%;
}

#contents {
	/*                 margin: auto; */
	padding-top: 30px;
	padding-left: 15%;
	overflow: hidden;
	/*                 background-color: rgba(44, 31, 31, 0.1); */
}

#contents>div {
	float: left;
}

#mainContent {
	width: 60%;
	background-color: white;
}

#sideContent {
	width: 300px;
	/*                height: 150px;*/
	/*                position: fixed;*/
	/*                left: 60.5%;*/
	overflow: hidden;
	margin-left: 10px;
}

#sideFixed {
	/*                 position: fixed; */
	width: 290px;
	font-size: 12px;
	background-color: white;
}

#classNavi {
	overflow: hidden;
	/*                position: fixed;*/
	width: 100%;
	/*                height: 30px;*/
	background-color: white;
	border-bottom: 1px solid rgba(0, 0, 0, 0.28);
}

#clickNavi {
	margin: 0px;
	padding: 0px;
	text-align: center;
}

#clickNavi>li {
	float: left;
	list-style: none;
	width: 20%;
}

#clickNavi>li>a {
	color: #ffba00;
	text-decoration: none;
	font-size: 20px;
}
/*            요약정보*/
#sumary {
	/*                임시 : 내용채워지는대로 자동으로 높이 생기도록하기*/
	overflow: hidden;
	/*                margin-top: 30px;*/
	margin: 0px 70px;
}

.class_name {
	height: 200px;
	float: left;
}
/*            튜터이미지 원형*/
.class_tuImg {
	display: inline-block;
	overflow: hidden;
	border-radius: 100px;
	width: 150px;
	height: 150px;
}

#tutorImg {
	width: 150px;
	height: 150px;
}
/*            /이미지원형*/
.class_nickname {
	text-align: center;
}

.class_title {
	float: left;
	width: 100%;
	overflow: hidden;
	padding-left:40px;
	padding-top:10px;
}
.tutor{
	text-align: center;
}
.title>* {
	font-size: 20px;
}

.class_title>.star {
	height: 50px;
	padding-top: 15px;
	overflow: hidden;
}

.info>ul>li {
	float: left;
	list-style: none;
	width: 33.3%;
	text-align: center;
	font-size : 15px;
}

.info {
	overflow: hidden;
	margin-top : 10px;
	border-top: 1px solid rgba(0, 0, 0, 0.28);
}

.info>ul {
	overflow: hidden;
	margin-top: 13px;
	padding: 0px;
}
.info img{
	width : 40px;
}
.info div{
	margin-bottom : 5px;
}

/*            /요약정보*/
/*            튜터설명*/
#tutorinfo {
	min-height: 500px;
}
/*            /튜터설명*/
/*            수업소개*/
#introduction {
	min-height: 500px;
}
/*            /수업소개*/
#place {
	min-height: 400px;
}
#review{
	height : 700px;
}

.class_detail {
	padding-top: 40px;
	margin: 0px 40px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.28);
}

.class_detail>h3 {
	font-weight: bold;
}
/*            사이드 fixed 메뉴*/
#sideTop {
	font-size: 20px;
}

.calendar {
	cursor: pointer;
}
/*            사이드 fixed 메뉴*/
/*                임시*/
#purchase {
	text-align: center;
	background-color: transparent !important;
}

#purchaseBtn {
	font-size: 15px;
	background-color: rgba(135, 206, 235, 0.52);
	border-style: none;
	width: 100%;
	transition-duration: 1s;
	height: 30px;
	border-radius: 5px;
}

#purchaseBtn:hover {
	background-color: #ffba00;
}

#scdBtn {
	background-color: rgba(92, 92, 96, 0.13);
	text-align: center;
}

#datepicker>div {
	width: 100%;
	height: 100%;
}

#selectScd {
	font-size: 17px;
}

#map_addr {
	text-align: center;
}

#map {
	border-radius: 10px;
}

.carousel-item>div {
	border-radius: 10px;
}
/* footer*/
#footer {
	height: 300px;
	width: 100%;
	background-color: #f2f0e1;
	margin: 0px;
}
#sns{
	text-align: center;
}
#sns>img{
	margin:30px 20px;
	cursor: pointer;
}

#footerMsg{
	margin-right:50px;
	text-align: right !important;
	display: block !important;
	width:100%;
}
/* /footer*/
</style>
<!--         다음지도 api cdn -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9810110832de2e2124764f7bd3da339a&libraries=services"></script>
<!--         /다음지도 api cdn -->
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
                    		})
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
            	
                var he1 = document.getElementById("myCarousel1").scrollHeight;
                var he2 = document.getElementById("classNavi").scrollHeight;
                var mainWidth = $("#mainContent").css("width");
                $(window).scroll(function() {
                    if($(this).scrollTop() > he1+he2){
                        $("#classNavi").css({ "position": "fixed", "top": "0px" ,"width":mainWidth , "z-index" : "2"});
                    }else{
                        $("#classNavi").css({ "position": "relative"});
                    }
                });
                
                var side = document.getElementById("sideFixed").scrollHeight;
                $(window).scroll(function() {
                    if($(this).scrollTop() > side){
                        $("#sideFixed").css({ "position": "fixed", "top": "0px" });
                    }else{
                        $("#sideFixed").css({ "position": "relative"});
                    }
                });
                $(".class_detail").each(function(i,item){//해당 카테고리 위치로 이동하면 일단 배경색 바꿔놓기.
                    var id = $(this).prop("id");
                    var scrollHe = document.getElementById(id).scrollHeight;
                    if($(this).scrollTop()>scrollHe){
                        //아직 미완성
                    }
                });

                //위치 지도에 표시하기 daum API이용
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };  

                // 지도를 생성합니다    
                var map = new daum.maps.Map(mapContainer, mapOption); 

                // 주소-좌표 변환 객체를 생성합니다
                var geocoder = new daum.maps.services.Geocoder();

                // 주소로 좌표를 검색합니다.
                //여기에 주소넣기!!!
                var addr = "${classInfo.info_addr2}" + "${classInfo.info_addr4}";
                geocoder.addressSearch(addr, function(result, status) {

                    // 정상적으로 검색이 완료됐으면 
                    if (status === daum.maps.services.Status.OK) {

                        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new daum.maps.Marker({
                            map: map,
                            position: coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new daum.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;">수업 장소</div>',
                            removable : true
                        });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                    } 
                });


			// 특정날짜들 배열
            //var disabledDays = ["2019-6-9","2019-6-24","2019-6-26"]; //내가 제외하고싶은 날짜
            var disabledDays = [];
            $(".date").each(function(i,item){
            	var closedate = new Date($(item).val());
            	var m = closedate.getMonth(), d = closedate.getDate(), y = closedate.getFullYear();
            	disabledDays.push(y + '-' +(m+1) + '-' + d);
            });
            //console.log(disabledDays);
            
            var minDate = new Date("${classInfo.info_start}");
        	var maxDate = new Date("${classInfo.info_end}");
        	var today = new Date();
        	if(minDate < today){
        		minDate = today;
        	}
        	if(maxDate < today){
        		var m = maxDate.getMonth(), d = maxDate.getDate(), y = maxDate.getFullYear();
            	disabledDays.push(y + '-' +(m+1) + '-' + d);
        	}
            // 특정일 선택막기
            function disableAllTheseDays(date) {
                var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
                for (i = 0; i < disabledDays.length; i++) {
                    if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
                        return [false];
                    }
                }
                return [true];
            }
            function getDayLabel(day) {          
                var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
                //var day = new Date(date).getDay();
                var dayLabel = week[day]; 
                return dayLabel;
            }
            $("#scdBtn").hide();
            $("#select").hide();
            $("#selectScd").hide();
            $("#selectInfo").prop("flag","false");
				
            	var selectedDate = "";
                $(".calendar").on("click",function(){
                    var calendar = $(".calendar").text();
                    if(calendar == "달력에서 보기"){
                        $(".calendar").text("달력 접기");
                        $( "#datepicker" ).datepicker({
                            onSelect: function (dateText, inst) {
                                //alert(dateText);
                                //해당날짜의 일정불러와서 띄워주기.
                                $.ajax({
                        			url:"applicable.classInfo",
                        			type:"post",
                        			data:{ //ajax로 보낼 값
                        				classId : "${classInfo.info_classid}",
                        				check: dateText
                        			}
                        		}).done(function(resp){
                        			var checkDate = new Date(dateText) //해당날짜
                        			selectedDate = dateText;
                        			var m = checkDate.getMonth(), d = checkDate.getDate(), y = checkDate.getFullYear(), dy = checkDate.getDay();
                        			var dayLabel = getDayLabel(dy);
                        			var dateInfo = y+"년 "+(m+1)+"월 "+d+"일 ("+dayLabel+")";
                 			
                        			//alert(resp); //resp : 해당날짜에 현재 신청한 인원
                        			var maximumNum = "${classInfo.info_maxperson}"; //해당 클래스의 정원
                        			//alert(dateInfo); //날짜정보
                        			//alert(maximumNum); //해당클래스 정원
                        			$("#checkDate").text(dateInfo);
                        			$("#checkApplicable").text(resp+"명/"+maximumNum+"명");
                        			$("#scdBtn").show();
                        		})
                            }
                        	,showMonthAfterYear: true
                            ,dateFormat: "yy-mm-dd"
                            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
							,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
							,dayNamesMin: ['일','월','화','수','목','금','토']
                        	,minDate : minDate //최소날짜  포맷은 2019-5-30 , 2019/05/30 가능 
                            ,maxDate : maxDate //최대날짜 
                        	,beforeShowDay: disableAllTheseDays 
                        });
                        $( "#datepicker" ).show();
                    }else{
                        $(".calendar").text("달력에서 보기");
                        $( "#datepicker" ).hide();
                    }
                });
                //여기까지 달력
                
                $("#scdBtn").on("click",function(){
                	var selectDate = $("#checkDate").text();
                	$("#selectDate").text(selectDate);
                	$("#selectInfo").prop("flag","true");
                	$("#scdBtn").hide();
                	$("#select").show();
                	$("#selectScd").prop("class","d-flex");
                	$("#selectScd").show();
                	//플래그 true로
                });
                
                $("#closeImg").on("click",function(){
                	$("#selectInfo").prop("flag","false");
                	$("#select").hide();
                	$("#selectScd").prop("class","");
                	$("#selectScd").hide();
                });
                $("#purchaseBtn").click(function(){ //구매하기버튼눌렀을때
                	var classId = "${classInfo.info_classid}";
                	var userId = "${loginId}"
                	if(userId==""){
                		alert("로그인 후 구매해주세요.");
                		return;
                	}
                	var tutorId = "${classInfo.info_tutorid}";
                	if(tutorId==userId){
                		alert("본인이 등록한 class입니다.\r\n 다른 사람의 클래스를 들어보시는건 어때요?");
                		return;
                	}
                	if($("#selectInfo").prop("flag")=="false"){
                		alert("상품을 선택해주세요");
                		return;
                	}
                	
                	var purchaseForm = $("<form></form>");
                	$(purchaseForm).prop("action","purchaseClass.classInfo");
                	$(purchaseForm).prop("method","post");
                	
                	$(purchaseForm).append($('<input type="hidden" value="'+classId+'" name="classId">'));
                	$(purchaseForm).append($('<input type="hidden" value="'+userId+'" name="userId">'));
                	$(purchaseForm).append($('<input type="hidden" value="'+selectedDate+'" name="selectedDate">'));
                	
                	alert("구매진행중");
                	$(purchaseForm).appendTo("body");
                	//alert(classId + " : " + userId + " : " + selectedDate);
                	
                	$(purchaseForm).submit();
                });
                //주소위치 설정
                var addr = "${classInfo.info_addr2}";
                var addrRegex = /(.+?) (.+?) .*/g;
                var addrResult = addrRegex.exec(addr);
                if(addrResult!=null){
                	addr = addrResult[1];
                    if(addrResult[1]=="서울"){
                    	addr = addrResult[2];
                    }
                }
                $("#simpleAddr").text(addr);
                
                $(".class_tuImg").children("img").prop("id","tutorImg");
            });
        </script>
</head>
<body>
	<c:forEach var="date" items="${closedDateList}">
		<input class="date" type="hidden" value="${date }">
	</c:forEach>
	<div id="wrapper">
		<!--           HEADER-->
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
		<!--           /HEADER-->
		<div id="contents">
			<div id="mainContent">
				<div id="myCarousel1" class="carousel slide" data-ride="carousel"
					data-interval="3000">
					<c:choose>
						<c:when test="${classInfo.info_img3!=null}">
							<ol class="carousel-indicators">
								<li data-target="#myCarousel1" data-slide-to="0" class="active">
								</li>
								<li data-target="#myCarousel1" data-slide-to="1"></li>
								<li data-target="#myCarousel1" data-slide-to="2"></li>
							</ol>
						</c:when>
						<c:when test="${classInfo.info_img2!=null}">
							<ol class="carousel-indicators">
								<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel1" data-slide-to="1"></li>
							</ol>
						</c:when>
					</c:choose>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div
								style="background:#000;
                            	width:100%;height:540px;
                            	background-size:cover;
                            	background-position:center;
                            	background-image:url('${classInfo.info_img1 }');">
							</div>
						</div>
						<c:if test="${classInfo.info_img2 !=null}">
							<div class="carousel-item">
								<div
									style="background:#000;
                            	z-index:0;width:100%;height:540px;
                            	background-size:cover;
                            	background-position:center;
                            	background-image:url('${classInfo.info_img2 }');">
								</div>
							</div>
						</c:if>
						<c:if test="${classInfo.info_img3 !=null}">
							<div class="carousel-item">
								<div
									style="background:#000;
                            	z-index:0;width:100%;height:540px;
                            	background-size:cover;
                            	background-position:center;
                            	background-image:url('${classInfo.info_img3 }');">
<%-- <<<<<<< HEAD
                            	</div>
                                </div>
                            </c:if>
                        </div>
                        <c:if test="${classInfo.info_img2 !=null}">
                            <a class="carousel-control-prev" href="#myCarousel1" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#myCarousel1" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>
                    </div>
                    <!--                캐러셀 이미지 끝-->
                    <div id="classNavi">
                        <ul id="clickNavi">
                            <!--                           href에다가 해당위치 id넣어주기-->
                            <li><a href="#sumary">요약</a></li>
                            <li><a href="#tutorinfo">튜터정보</a></li>
                            <li><a href="#introduction">수업소개</a></li>
                            <li><a href="#place">위치</a></li>
                            <li><a href="#review">후기</a></li>
                        </ul>
                    </div>
                    <div id="sumary" class="class_detail">
                        <!--                        요약부분-->
                        <div id="sumary_wrapper">
                        <div class="class_name">
                            <div class="tutor">
                                <span class="class_tuImg">
                                    <img id="tutorImg" src="${tutorImg}" alt="no img">
                                </span>
                            </div>
                            <div class="class_nickname">
                                ${tutorNickname}
                            </div>
                        </div>
                        <div class="class_title">
                            <div class="title">
                                <h5>${classInfo.info_title}</h5>
                            </div>
                            <div class="star">
                                <a id="starImg" class="starImg" href="#">
                                    <!--                                 별점에 따라..몇개로할건지..... -->
                                    <c:forEach var="i" begin="0" end="${classInfo.info_avgstar">
<!--                                     	<img src="Content/Images/star.jfif"> -->
                                    </c:forEach>
                                </a>
                            </div>
                            <div class="info">
                                <ul>
                                    <li>
                                        <div>
                                            <img src="Content/Images/map-location.png">
                                        </div>
                                        위치
                                    </li>
                                    <li>
                                        <div>
                                            <img src="Content/Images/south-korean-won.png">
                                        </div>
                                        ${classInfo.info_price }원
                                    </li>
                                    <li>
                                        <div>
                                            <img src="Content/Images/group.png">
                                        </div>
                                        ${classInfo.info_maxperson }명
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div id="tutorinfo" class="class_detail">
                        <h3>튜터정보(쪽지기능)</h3>
                        <div>${classInfo.info_intro }</div>
                    </div>
                    <div id="introduction" class="class_detail">
                        <h3>수업소개</h3>
                        <div>${classInfo.info_explain }</div>
                    </div>
                    <div id="place" class="class_detail">
                        <h3>위치(지도확대축소 드래그 추가가능)</h3>
                        <div>
                            <div id="map" style="width:100%;height:300px;"></div>
                        </div>
                    </div>
                    <div id="review" class="class_detail">
                        <h3>후기</h3>
                        <div>
                        	<iframe src="http://localhost:8081/index.review?classId=${classInfo.info_classid}" id="the_iframe" onload="calcHeight();" name="WrittenPublic" title="게시판뷰" frameborder="0" scrolling="no" style="overflow-x:hidden; overflow:auto; width:100%; min-height:500px;"></iframe>
                        </div>
                    </div>
                    <!--                    여기까지 mainContent   -->
                </div>
                <div id="sideContent">
                    <div id="sideFixed">
                        <div id="sideTop" class="d-flex">
                            <span><b>옵션선택</b></span>
                            <span class="ml-auto calendar">달력에서 보기</span>
                        </div>
                        <div class="d-flex">
                            <span>일정</span><span class="ml-auto pr-2">V</span>
                        </div>
                        <!--여기가 달력 추가될 위치-->
                        <div id="datepicker"></div>
                        <!--/달력 추가될 위치-->
                        <div id="schedule">
                        	<button type="button" id="scdBtn">
                        	<div id="scdWrapper">
                        		<div id="checkDate"></div>
                        		<div id="checkApplicable"></div>
                        	</div>
                        	</button>
                        </div>
                        <div id="select">
                        	<div>
                        		<div id="selectInfo" class="d-flex" flag="false">
                        			<span id="selectDate"></span><img class="ml-auto" id="closeImg" src="Content/Images/close.png">
                        		</div>
                        		<div>참가비 (1인)</div>
                        		<div id="selectPrice">${classInfo.info_price }원</div>
                        	</div>
                        </div>
                        <div id="purchase"><input id="purchaseBtn" type="button" value="구매하기"></div>
                    </div>
                </div>
            </div>
        </div>
        <div>Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" 		    title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" 		    title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
    </body> --%>
=======
								</div>
							</div>
						</c:if>
					</div>
					<c:if test="${classInfo.info_img2 !=null}">
						<a class="carousel-control-prev" href="#myCarousel1" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a>
						<a class="carousel-control-next" href="#myCarousel1" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</c:if>
				</div>
				<!--                캐러셀 이미지 끝-->
				<div id="classNavi">
					<ul id="clickNavi">
						<!--                           href에다가 해당위치 id넣어주기-->
						<li><a href="#sumary">요약</a></li>
						<li><a href="#tutorinfo">튜터정보</a></li>
						<li><a href="#introduction">수업소개</a></li>
						<li><a href="#place">위치</a></li>
						<li><a href="#review">후기</a></li>
					</ul>
				</div>
				<div id="sumary" class="class_detail">
					<!--                        요약부분-->
					<div id="sumary_wrapper row">
						<div class="class_name col-lg-4 col-md-4 col-sm-12 col-12">
							<div class="tutor">
								<span class="class_tuImg"> ${tutorImg} </span>
							</div>
							<div class="class_nickname">${tutorNickname}</div>
						</div>
						<div class="class_title col-lg-8 col-md-8 col-sm-12 col-12 row">
							<div class="title col-12">
								<h4><strong>${classInfo.info_title}</strong></h4>
							</div>
							<div class="star col-12">
								<c:choose>
									<c:when test="${classInfo.info_avgstar=='0'}">
										<span class="badge badge-info p-2">NEW</span>
									</c:when>
									<c:otherwise>
										<c:forEach var="i" begin="1" end="${classInfo.info_avgstar}">
											<img src="Content/Images/star.jfif">
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="info col-12">
								<ul>
									<li>
										<div>
											<img src="Content/Images/map-location.png" >
										</div> 
										<div id="simpleAddr"></div>
									</li>
									<li>
										<div>
											<img src="Content/Images/south-korean-won.png">
										</div> 
										<div>
										${classInfo.info_price }원
										</div>
									</li>
									<li>
										<div>
											<img src="Content/Images/group.png">
										</div> 
										<div>
										${classInfo.info_maxperson }명
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div id="tutorinfo" class="class_detail">
					<h3>튜터정보</h3>
					<div>${classInfo.info_intro }</div>
				</div>
				<div id="introduction" class="class_detail">
					<h3>수업소개</h3>
					<div>${classInfo.info_explain }</div>
				</div>
				<div id="place" class="class_detail">
					<h3>위치</h3>
					<div>
						<div id="map" style="width: 100%; height: 300px;"></div>
						<br>
						<div id="map_addr">수업장소 : ${classInfo.info_addr2 }</div>
						<br>
					</div>
				</div>
				<div id="review" class="class_detail">
					<h3>후기</h3>
					<div>
						<iframe src="index.review?classId=${classInfo.info_classid}"
							id="the_iframe" onload="" name="WrittenPublic" title="게시판뷰"
							frameborder="0" scrolling="no"
							style="overflow-x: hidden; overflow: auto; width: 100%; min-height: 700px;"></iframe>
					</div>
				</div>
				<!--                    여기까지 mainContent   -->
			</div>
			<div id="sideContent">
				<div id="sideFixed">
					<div id="sideTop" class="d-flex">
						<span><b>옵션선택</b></span> <span class="ml-auto calendar">달력에서
							보기</span>
					</div>

					<!--여기가 달력 추가될 위치-->
					<div id="datepicker"></div>
					<!--/달력 추가될 위치-->
					<div id="schedule">
						<button type="button" id="scdBtn">
							<div id="scdWrapper">
								<div id="checkDate"></div>
								<div id="checkApplicable"></div>
							</div>
						</button>
					</div>
					<div id="selectScd">
						<span>선택 일정</span><span class="ml-auto pr-2">V</span>
					</div>
					<div id="select">
						<div>
							<div id="selectInfo" class="d-flex">
								<span id="selectDate"></span><img class="ml-auto" id="closeImg"
									src="Content/Images/close.png">
							</div>
							<div>참가비 (1인)</div>
							<div id="selectPrice">${classInfo.info_price }원</div>
						</div>
					</div>
					<div id="purchase">
						<input id="purchaseBtn" type="button" value="구매하기">
					</div>
				</div>
			</div>
		</div>
		<div id="footer" class="row">
			<div class="col-12 col-md-8"></div>
			<div class="col-12 col-md-4" id=sns>
				<img src="https://img.icons8.com/ios/48/000000/facebook.png">
				<img src="https://img.icons8.com/ios/48/000000/twitter.png"> 
				<img src="https://img.icons8.com/ios/48/000000/instagram-new.png">
				<img src="https://img.icons8.com/ios/48/000000/github.png">
			</div>
			<div id="footerMsg">(주)꿀단지 | 서울특별시 중구 남대문로 120 대일빌딩 3층<br> © Ggooldanji. all rights reserved.
			</div>
		</div>
	</div>
	<div>
		Icons made by <a href="https://www.flaticon.com/authors/smashicons"
			title="Smashicons">Smashicons</a> from <a
			href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
		is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"
			title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a>
	</div>
</body>
</html>