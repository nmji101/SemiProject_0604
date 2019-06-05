<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>exit</title>

<style>
.box {
	text-align: center;
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
<link rel="shortcut icon" href="favicon.ico">
<script>
        
        $(function()
        {
			$("#input_file").on("change", function()
			{
				var obj = this;
				var file_kind = obj.value.lastIndexOf('.');
				var file_name = obj.value.substring(file_kind+1,obj.length);
				var file_type = file_name.toLowerCase();
				
				check_file_type=['jpg','gif','png','jpeg','bmp'];

				if(check_file_type.indexOf(file_type)==-1)
				{
					alert('이미지 파일만 선택할 수 있습니다.');
					$("#input_file").val("");					
				}
			});
        });
        
        onload = function()
        {
              
        };
    </script>


</head>
<body>
	<form action="img.mypage" method="post" enctype="multipart/form-data">

		<div class="box">

			<input id="input_file" class="btn my-3" name="item" type="file"><br>
			<input class="btn btn-warning" type="submit" value="수정">

		</div>

	</form>
</body>
</html>