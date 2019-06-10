<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- dddddddddd -->
<title>클래스 수정페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<style>
.ui-datepicker-trigger {
   cursor: pointer;
}


.hasDatepicker {
   cursor: pointer;
}

.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #fff;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #5cb85c;
   cursor: pointer;
   border: 1px solid #4cae4c;
   border-radius: .25em;
   -webkit-transition: background-color 0.2s;
   transition: background-color 0.2s;
}

.filebox label:hover {
   background-color: #6ed36e;
}

.filebox label:active {
   background-color: #367c36;
}

.filebox input[type="file"] {
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   clip: rect(0, 0, 0, 0);
   border: 0;
}
</style>
<style>
body {
   margin: 10px;
}

.where {
   display: block;
   margin: 25px 15px;
   font-size: 11px;
   color: #000;
   text-decoration: none;
   font-family: verdana;
   font-style: italic;
}

.filebox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   preview-image clip: rect(0, 0, 0, 0);
   border: 0;
}

.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #999;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #fdfdfd;
   cursor: pointer;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
   display: inline-block;
   padding: .5em .75em;
   font-size: inherit;
   font-family: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #f5f5f5;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
   -webkit-appearance: none; /* 네이티브 외형 감추기 */
   -moz-appearance: none;
   appearance: none;
}

/* imaged preview */
.filebox .upload-display {
   margin-bottom: 5px;
}

@media ( min-width : 768px) {
   .filebox .upload-display {
      display: inline-block;
      margin-right: 5px;
      margin-bottom: 0;
   }
}

.filebox .upload-thumb-wrap {
   display: inline-block;
   width: 54px;
   padding: 2px;
   vertical-align: middle;
   border: 1px solid #ddd;
   border-radius: 5px;
   background-color: #fff;
}

.filebox .upload-display img {
   display: block;
   max-width: 100%;
   width: 100% \9;
   height: auto;
}

.filebox.bs3-primary label {
   color: #fff;
   background-color: #337ab7;
   border-color: #2e6da4;
}

</style>
<style>
body {
   padding: 20px;
   margin: auto;
}

.head, .send, .class {
   float: left;
}

.array {
   box-sizing: border-box;
   overflow: hidden;
}

.img {
   
   width: 150px;
   height: 150px;
<<<<<<< HEAD
   background-size: contain;
=======
>>>>>>> fe997f9d8a62429d45d7b2bafd0fdcc458fa7b9d
   float: left;
}

.img2 {
   width: 200px;
   height: 200px;
   background-size: contain;
   float: left;
}

.head {
   margin-right: 10px;
}

.input-group {
   width: 150px;
}

.list, .list2 {
   width: 680px;
   height: 200px;
   border: 1px solid black;
   overflow-y: auto;
   
<<<<<<< HEAD
   
=======
>>>>>>> fe997f9d8a62429d45d7b2bafd0fdcc458fa7b9d
}

#inputimg {
   clear: both;
   width: 500px;
}

.card-body {
   width: 680px;
   padding: 10px;
   box-sizing: border-box;
   overflow: hidden;
}

.clear {
   clear: both;
}

#datepicker, #datepicker2 {
   width: 130px;
   text-align: center;
}

.btm {
   margin-top: 10px;
}

.color {
   background-color: aqua;
}

.intro {
   height: 95px;
   overflow-y: auto;
   border: 1px ridge red;
   outline: none;
}

#id {
   height: 30px;
   border: 1px ridge red;
   outline: none;
}

.intro:empty:not (:focus ):before {
   content: attr(data-placeholder)
}

.cash:empty:not (:focus ):before {
   content: attr(data-placeholder)
}

.welcome {
   width: 200px;
   text-align: center;
}

.main {
   height: 200px;
   overflow-y: auto;
   border: 1px ridge red;
   outline: none;
}
.mains{
   height: 40x;
   overflow-y: auto;
   border: 1px ridge red;
   outline: none;
}


.cash {
   height: 34px;
   outline: none;
}

.inputcash {
   width: 100%;
   height: 100%;
   border: 1px solid #ffba00;
}

div:focus, cash:focus, input:focus, input[type]:focus, .inputcash:focus
   {
   border-color: rgba(229, 103, 23, 0.8);
   box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px
      rgba(229, 103, 23, 0.6);
   outline: 0 none;
   background: none;
}

.addr {
   width: 100%;
}

.searchaddr {
   width: 326px;
}
   
    .logo{
        background-image: url(로고.png);
        background-size: cover;
        height: 70px;

      
    }
    #home{
      cursor: pointer;
    }
    .tutorid{
    width:100%;
    }
    .text{
        height: 30px;
    }
    
    .red{
        background: red;
    }
    .makeclass{
        width: 100%;
        height: 30px;
        text-align: center;
    }

    .listtop{
    background-color: antiquewhite;
    }
    .target { 
    white-space: nowrap; overflow: hidden; text-overflow: ellipsis; 
    }


   #tutorImg>img{
      width:150px;
      height:150px;
   }
</style>
    
<script>
   
$(function(){


   $('#mytype li > a').on('click', function() {
   // 버튼에 선택된 항목 텍스트 넣기 
   $('#mystatus2').text($(this).text());
   });


    
   $("#register").on("click", function() { //클래스완료 버튼 클릭시
	   
	
      
      var max = /^[0-9]{1,2}$/;
       var price = /^[0-9]{1,6}$/;

        var String =$("input[name=startdate]").val();
      var Strings = $("input[name=enddate]").val();
      var regex = /..-..$/;
      var result=regex.exec(String);
      var results=regex.exec(Strings);
      var String2 = result[0];
      var String2s = results[0];
      var regex2= /^../;
      var result2=regex2.exec(String2);
      var result2s=regex2.exec(String2s);
//       document.write(result2[0]);
//       document.write(result2s[0]);
      var lastreg = /..$/;
      var last1 = lastreg.exec(String2);
      var last2 = lastreg.exec(String2s);
//       document.write(last1[0]);
//       document.write(last2[0]);


 	  $("input[name=info_classid]").val();
      $("input[name=down]").val($('#mystatus2').text());
      $("input[name=addr1]").val();
      $("input[name=addr2]").val();
      $("input[name=addr3]").val();
      $("input[name=addr4]").val();
      $("input[name=max]").val();
      $("input[name=cash]").val();
      $("input[name=startdate]").val();
      $("input[name=enddate]").val();
      $("input[name=explain]").val($('#cont').text());
      $("input[name=inputtitle]").val($('#title').text());



      //alert($("input[name=intro]").val());
  
        if($("input[name=down]").val()=="카테고리"){
            alert('카테고리를 등록해주세요');
            return false;
          }
       
         if(!max.test($('#max').val())){
            alert("인원을 확인해주세요 \n\r 100명 이상의 인원은 관리자에게 문의주세요");
            return false;
         }
         if(!price.test($('#price').val())){
               alert("가격을 확인해주세요 \n\r 100만원 이상의 금액은 관리자에게 문의주세요");
            return false;
         }  

         if($("#sample4_postcode").val()==""){
               alert('주소를 입력해주세요');
              return false;
         }
         if($("input[name=inputtitle]").val()==""){
               alert('제목이 없습니다');
               return false;
         }

         if($('#title').text().length>25){
            alert('제목은 25자까지 가능합니다');
            return false;
         }
         if(result2[0] > result2s[0] ){
            alert("'월'을 다시 입력해주세요");
            return false;
         }else  if(last1[0] > last2[0] ){
            alert(" '일'을 다시 입력해주세요");
            return false;
         }

         if($("input[name=explain]").val()==""){
               alert('class 소개가 없습니다');
               return false;
         }
       
         if($('#cont').text().length>100){
            alert('내용은 100자까지 가능합니다');
            return false;
         }
        
         else   {
        	 alert('수정되었습니다 \n메인으로 돌아갑니다');
        	 alert( $("input[name=info_classid]").val());
        	 $("form").submit();
         }
   
   });
   
    $("#back").on('click', function(){
       history.go(-1);
    })
    $("#home").on('click', function(){
       location.href="start.main";
    })
   

   
});


         
</script>
    
<body>

   <form action="edit.tutor" method="post"  enctype="multipart/form-data" accept-charset="utf-8" >
      <div class="container">
         
 <div class=row>
            <!-- 컨텐츠 부분-->
            <div class=" col-lg-12 col-md-12 col-sm-12 p-0 m-0"id="collapseExample">
               <div    class="card m-3 col-lg-12 col-md-12 col-sm-12 card-body array border-warning">
            
                    <h4><span class="badge makeclass badge-warning">Class 수정하기 (글번호 : ${dto.info_classid })</span></h4>
                   <input type="hidden" name="info_classid" value="${dto.info_classid }">
                  <!--Class등록 Show부분-->
                  <div class="pt-2 ">   
                     
                     <div class="mr-3   p-0 head col-3 btn-group">
                        <button type="button" id="mystatus2"class="btn btn-warning p-1 dropdown-toggle"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">${dto.info_category }</button>
                        <ul id="mytype" class="dropdown-menu" role="menu"
                           aria-labelledby="searchType">
                           <li><a class="dropdown-item" href="#">디자인</a></li>
                           <li><a class="dropdown-item" href="#">IT</a></li>
                           <li><a class="dropdown-item" href="#">언어</a></li>
                           <li><a class="dropdown-item" href="#">라이프스타일</a></li>
                           <li><a class="dropdown-item" href="#">재테크</a></li>
                        </ul>
                        <input type="hidden" name="down">
                     </div>         
                     <div class="mr-3   p-0 cash col-3 head cash form-group">
                        <input type="text" class="inputcash form-control" placeholder="희망인원" name=max id=max  value=${dto.info_maxperson }>
                     </div>
                     <div class="mr-3   p-0 cash col-3 head cash form-group">
                        <input type="text" class="inputcash form-control"   placeholder="희망금액" name=cash id=price value=${dto.info_price }>
                     </div>
                     <div class="head mr-3   p-0  head col-3 btn-group">
                        <button type="button" onclick="sample4_execDaumPostcode()"
                           class="btn addr btn-warning p-1"data-aria-haspopup="true"aria-expanded="false" id=hope>주소검색</button>
                            </div>
                            <div class="col-8 head  p-0 ">
                           <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                           <script>  <!--주소등록-->
                              //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                              function sample4_execDaumPostcode() {
                                 new daum.Postcode(
                                       {
                                          oncomplete : function(
                                                data) {
                                             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                             var roadAddr = data.roadAddress; // 도로명 주소 변수
                                             var extraRoadAddr = ''; // 참고 항목 변수

                                             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                             if (data.bname !== ''
                                                   && /[동|로|가]$/g
                                                         .test(data.bname)) {
                                                extraRoadAddr += data.bname;
                                             }
                                             // 건물명이 있고, 공동주택일 경우 추가한다.
                                             if (data.buildingName !== ''
                                                   && data.apartment === 'Y') {
                                                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                                      + data.buildingName
                                                      : data.buildingName);
                                             }
                                             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                             if (extraRoadAddr !== '') {
                                                extraRoadAddr = ' ('
                                                      + extraRoadAddr
                                                      + ')';
                                             }

                                             // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                             document
                                                   .getElementById('sample4_postcode').value = data.zonecode;
                                             document
                                                   .getElementById("sample4_roadAddress").value = roadAddr;
                                             document
                                                   .getElementById("sample4_jibunAddress").value = data.jibunAddress;

                                          }
                                       }).open();
                              }
                           </script>
                           <input  type="text" id="sample4_postcode"class="searchaddr inputcash zipcode text" placeholder="우편번호"name=addr1   value=${dto.info_addr1 } readonly > 
                           <input  type="text" id="sample4_roadAddress" class="inputcash searchaddr road text"   placeholder="도로명주소" name=addr2  value=${dto.info_addr2 } readonly> 
                           <input  type="text" id="sample4_jibunAddress" class="inputcash searchaddr road text" placeholder="지번주소" name=addr3  value=${dto.info_addr3 }   readonly> 
                           <input   type="text"id="sample4_detailAddress" class="inputcash searchaddr text"placeholder="상세주소 입력하기" name=addr4 value=${dto.info_addr4 } >
<!--                       <input type="button"  class="btn addr" value="주소저장" id=findaddr> -->
                     </div>
                  </div>
                  <br>

               

                  <div ><h3><span class="badge m-0 p-1 badge-warning">제목입력(최대25자)</span></h3>

                  <div contentEditable="true" class="mains p-0 m-0 col-12 border-warning " id=title>${dto.info_title }</div>
                     <input type="hidden" name="inputtitle">
                  </div>
                  
                  <input type="hidden" name="title">
                  <br>
                  <div class="array clear">
                     <!-- 날짜 고르는 부분 -->
                     <div class="head p-0 m-0 col-2">
                        <h3>
                           <span class="badge m-0 p-1 badge-warning">날짜선택</span>
                        </h3>
                     </div>
                     <div class="head pt-1 m-0 pick col-10">
                        <div class="head p-0 m-0 col-lg-6 col-md-6 col-sm-6">
                           시작: <input type="text" id="datepicker" name=startdate value=${dto.info_start } >
                        </div>
                        <div class="head p-0 m-0 col-lg-6 col-md-6 col-sm-6">
                           종료: <input type="text" id="datepicker2" name=enddate value=${dto.info_end }>
                        </div>
                        <script>
                           $(function() {
                              //모든 datepicker에 대한 공통 옵션 설정
                              $.datepicker
                                    .setDefaults({
                                       dateFormat : 'yy-mm-dd',
                                       showOtherMonths : true,
                                       showMonthAfterYear : true,
                                       changeYear : false,
                                       changeMonth : true,
                                       showOn : "both",
                                       buttonImage :"http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" ,
                                       buttonImageOnly : true,
                                       buttonText : "날짜 선택",
                                       yearSuffix : "년",
                                       monthNamesShort : [ '1',   '2', '3', '4', '5','6', '7', '8', '9','10', '11', '12' ],
                                       monthNames : [ '1월', '2월',   '3월', '4월', '5월',   '6월', '7월', '8월',   '9월', '10월', '11월',   '12월' ],
                                       dayNamesMin : [ '일', '월',   '화', '수', '목', '금','토' ],
                                       dayNames : [ '일요일', '월요일',
                                             '화요일', '수요일',
                                             '목요일', '금요일', '토요일' ],
                                       minDate : "-0M",
                                       maxDate : "+8M"
                                    });

                              $("#datepicker").datepicker();
                              $("#datepicker2").datepicker();
                              $('#datepicker').datepicker('setDate',   'today');
                              $('#datepicker2').datepicker('setDate',      '+1D');

                           });
                        </script>
                     </div>
                  </div><!-- 날짜 고르는 부분 끝-->
                  <br>   

                  <div class="array col-12 p-0 m-0">
                     <!-- 내용입력-->

                     <h3><span class="badge m-0 p-1 badge-warning">내용입력(최대100자)</span></h3>

                     <div contentEditable="true" class="main  p-0 m-0 col-12 border-warning " id=cont >${dto.info_explain }</div>
                     <input type="hidden" name="explain"><!-- Class 내용 등록-->   
                  </div><!-- 내용입력 끝--><br>
                  <!--  업로드 버튼 -->
                  
<!--                      <div class="input_wrap"> -->
<!--                      <input type="file" value="" name="img"><br> -->
<!--                            <input type="file" value="" name="img2"><br> -->
<!--                            <input type="file" value="" name="img3"> -->
<!--                        </div><br> -->
                  <div class="head btm m-0 p-0 col-12">
                     <button type="button" id="register" class="btn btn-warning">Class 수정하기</button>
                  </div>
               
                  <!--Class등록 Show부분 끝-->
               </div>
            </div>
         </div>
      
<!-- <br> -->
<!-- <button type="button" class="btn btn-warning" id=back>뒤로가기</button> -->

      </div>   
      
   
   </form>   
</body>



</html>