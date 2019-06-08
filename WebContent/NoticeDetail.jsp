<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR|Acme&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>공지사항</title>
    
<style>
	
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
	
	#btn_div
	{
		text-align: right;
	}
	#header_row > div
	{
		text-align: center;
		border: 1px solid #ffba00;
	}
.header_row
{
	justify-content: center;
}
	
</style>
    
<script src="https://code.jquery.com/jquery-3.4.0.min.js">
</script>
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
<script>
        
	$(function()
	{
		
		$("#back_btn").on("click", function()
		{
			location.href = "list.notice?page=1";
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
		        
	});
        
	onload = function()
	{
		
		
              
	};
        
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
	
		<div id="header_row" class="row my-5 justify-content-center">
		
			<div class="col-10">
			
				<div class="row">
				
					<div class="col-1">
				
						${ dto.no_seq }
						
					</div>
					
					<div class="col-6">
						
						${ dto.no_title }
						
					</div>
					
					<div class="col-3">
						
						${ dto.no_writer }
						
					</div>
					
					<div class="col-2">
						
						${ dto.no_time }
						
					</div>
				
				</div>
			
			</div>
			
		</div>
		
		
		<div class="row my-5 py-5 justify-content-center">
		
			<div class="col-10">
				
				<c:set var="contents" value="${ dto.no_contents }"/>
<%-- 				<p id="html" class="my-5">${fn:substring(contents,1,fn:length(contents)-1)}</p> --%>
				<p id="html" class="my-5">${contents}</p>
			</div>
		
		</div>
		
		
		
			<div class="row justify-content-center">
			
				<div id="btn_div" class="col-10">
					<c:if test="${ type == 'admin' }">
						<input id="update_btn" class="btn btn-info" type="button" value="수정">
						<input id="delete_btn" class="btn btn-info" type="button" value="삭제">
					</c:if>
						<input id="back_btn" class="btn btn-info" type="button" value="목록으로">
				</div>
			
			</div>
		
		
	
	</div>


</body>
<c:if test="${ type == 'admin' }">
<script>

	$("#delete_btn").on("click", function()
	{
		location.href = "delete.notice?seq=" + "${ dto.no_seq }";
	});
	
	$("#update_btn").on("click", function()
	{
		var form = $('<form></form>');
	    form.attr('action', 'passon.notice');
	    form.attr('method', 'POST');
	    form.appendTo('body');
	
	    var text = $("#html").html();
	    
	    var seq = $('<input type="hidden" value='+"${ dto.no_seq }"+' name="seq">');
		var title = $('<input type="hidden" value="${ dto.no_title }" name="title">');
		var contents = $('<input type="hidden" id="contents_hidden" name="contents">');
		
	    form.append(title).append(contents).append(seq);
	    $("#contents_hidden").val(text);
	    
	    form.submit();
	});
	
</script>
</c:if>
</html>