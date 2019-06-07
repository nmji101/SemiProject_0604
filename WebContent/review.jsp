<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html lang="en">
            <head>
                <meta charset="UTF-8">
                <title>����</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
                <script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
                <script src="https://kit.fontawesome.com/6e8dd0d413.js"></script>
                <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
            </head>
            <style>
                div{
                    box-sizing: border-box;
                    /*border: 1px solid black*/
                }
                .center{
                    text-align: center;
                }
                .imgSize{
                    width:80%;
                    max-width: 100%;
                    max-height: 100px;
                    border-radius: 50%;
                }
                .btnLike{
                    width:100%;
                    max-width: 100%;
                    height: 100%;
                    padding:inherit;
                }
                .textArea{
                    max-height: 100%;
                    width: 100%;
                }
                .line{
                    border: 1px solid yellow
                }
                .vl {
                    border-right: 2px solid #ffc107;
                    height: 100%;
                    position: absolute;
                    left: 50%;
                    margin-right: -10px;
                    top: 0;
                }
                .icon{
                    font-size: 22px;
                }
            </style>
            <script>
                $(function(){
                    $(".btnLike0").on("click", function(){
                        $.ajax({
                        	url:"like.review",
                        	type:"post",
                        	
                         	data:{
                        		re_seq : $(".like0 script").text()
                        	} 
                        }).done(function(resp){
                        	alert(resp);
                        	location.reload();
                        });
                    });
                    $(".btnLike1").on("click", function(){
                        $.ajax({
                        	url:"like.review",
                        	type:"post",
                        	
                         	data:{
                        		re_seq : $(".like1 script").text()
                        	} 
                        }).done(function(resp){
                        	alert(resp);
                        	location.reload();
                        });
                    });
                    $(".btnLike2").on("click", function(){
                        $.ajax({
                        	url:"like.review",
                        	type:"post",
                        	
                         	data:{
                        		re_seq : $(".like2 script").text()
                        	} 
                        }).done(function(resp){
                        	alert(resp);
                        	location.reload();
                        });
                    });
                });
            </script>
            <body>
                <div class="card card-body">
                    <!------------------------------------------------------------------------------------------------------->
                    <c:forEach var="tmp" items="${list }" varStatus="status">
                        <div class="row">
                            <div class=" d-none d-sm-block col-sm-2 col-md-2 col-lg-2 col-xl-2 px-0">
                                <div class="row mx-0 center">
                                    <div class="col-10 col-sm-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 px-0 center">
                                        <div class="row mx-0">
                                            <div class="col-12 col-sm-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 px-0 center">
                                                <img class ="imgSize m-1 ml-3" src="�����̹���.PNG" class="rounded float-left" alt="...">
                                            </div>
                                        </div>
                                        <div class="row mx-0 center">
                                            <div class="col-12 col-sm-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 px-0 center">
                                                <!--�г���-->
                                                ${tmp.re_userId }
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-2 col-sm-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 px-0">
                                        <div class="vl"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-10 col-md-10 col-lg-10 col-xl-10 px-0 ">
                                <div class="row mx-0">
                                    <!-- ���� -->
                                    <div class="col-12 col-sm-12 col-sm-3 col-md-3 col-lg-3 col-xl-3 px-0 text-warning">
                                        ${tmp.star }
                                    </div>
                                    <!-- �ı������� -->
                                    <div class="col-8 col-sm-8 col-sm-6 col-md-6 col-lg-6 col-xl-6 px-0">
                                        ${tmp.re_writeDate }
                                    </div>
                                    <div class="col-4 col-sm-4 col-sm-3 col-md-3 col-lg-3 col-xl-3 px-0">
                                        <div class="row mx-0">
                                            <!-- ���ƿ� Ƚ�� -->
                                            <div class="col-6 col-sm-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 px-0 center like${status.index}">
													<script>
														${tmp.re_seq}
													</script>
                                                <span>${tmp.re_like }</span>
                                            </div>
                                            <div class="col-6 col-sm-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 p-0">
                                                <button type="button" class="btn btn-outline-warning btnLike${status.index}"><i class="far fa-thumbs-up icon"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mx-0 textArea">
                                    <!-- �ı� ���� -->
                                    ${tmp.re_review }
                                </div>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                    <!-- --------------------------------------------------------- Navi ------------------------------------------------------ -->
                    <p></p>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 px-0">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <p>${resultNavi }</p>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </body>
        </html>