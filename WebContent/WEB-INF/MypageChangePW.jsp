<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>exit</title>
    
    <style>
        #btn_div
        {
            text-align: center;
        }
    </style>
    
    <script src="https://code.jquery.com/jquery-3.4.0.min.js">
    </script>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <script>
        
        $(function()
        {
            $("#pw_text ,#pwc_text").on("input", function() 
            {
            	var pw = $("#pw_text").val();
            	var pwc = $("#pwc_text").val();
                if (((pw !== "") && (pwc !== "")) && (pw == pwc)) 
                {
                	var regex = /^[A-Za-z0-9]{6,12}$/g
                	if(regex.exec(pw) != null)
                    {
                		$("#pwc_label").text("사용 가능한 비밀번호");
                        $("#pwc_label").css("color","green");
                    }
                	else
                    {
                        $("#pwc_label").text("사용 불가능한 비밀번호");
                        $("#pwc_label").css("color","red");
                    }
                }
                else
                {
                    $("#pwc_label").text("사용 불가능한 비밀번호");
                    $("#pwc_label").css("color","red");
                }
            });
            
            $("#submit_btn").on("click", function()
			{
            	if($("#pwc_label").text() == "사용 가능한 비밀번호")
            	{
            		$("#pw_form").submit();
            	}
            	else
            	{
            		alert("입력란을 확인하세요");
            	}
			});
        });
        
        onload = function()
        {
              
        };
    </script>
    
    
</head>
<body>
    <form id="pw_form"action="pw.mypage" method="post">
        <h3>비밀번호</h3>
        <input id="pw_text" class="form-control my-1" name="pw" type="password" placeholder="비밀번호">
        <h3>비밀번호 확인</h3>
        <input id="pwc_text" class="form-control my-1" name="pwc" type="password" placeholder="비밀번호 확인">
        <label id="pwc_label"></label><br>
        
        <div id="btn_div">
            
            <input id="submit_btn" class="btn btn-primary" type="button" value="수정">
            
        </div>
        
    </form>
</body>
</html>