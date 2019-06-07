<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR|Acme&display=swap"
	rel="stylesheet">
<title>공지사항</title>
    
<style>
.container {
	text-align: center;
	margin-top: 5%;
}

img {
	width: 500px !important;
	height: auto;
}        
</style>
    
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

    
<script>
$(function()
  {
	    $("#summernote").summernote
	    ({
	        height : 400,
	        
	        minHeight : null,
	        
	        maxHeight : null,
	        
	        focus : true,
	        
	        lang : 'ko-KR',
	        
	        callbacks :
	        {
		        onImageUpload : function(files, editor, welEditable)
		        {
			        for(var i = files.length - 1 ; i >= 0 ; i--)
			        {
				        sendFile(files[i], this);
			        }
		        }
	        }
	    });
	    
	    function sendFile(file, editor)
	    {
		    var data = new FormData();
		    
		    data.append('file', file);
		    
		    $.ajax(
		    {
		        data : data,
		        
		        type : "POST",
		        
		        url : 'upload.notice',
		        
		        cache : false,
		        
		        contentType : false,
		        
		        enctype : 'multipart/form-data',
		        
		        processData : false
		    
		    }).done(function(data)
		    {
			    $(editor).summernote('editor.insertImage', "files/" + data);
			    
		    }).fail(function(data)
		    {
			    alert("error");
		    });
		    
	    }
	    
	    function sendFile(file, editor)
	    {
		    var data = new FormData();
		    
		    data.append('file', file);
		    
		    $.ajax(
		    {
		        data : data,
		        
		        type : "POST",
		        
		        url : 'upload.notice',
		        
		        cache : false,
		        
		        contentType : false,
		        
		        enctype : 'multipart/form-data',
		        
		        processData : false
		    
		    }).done(function(data)
		    {
			    $(editor).summernote('editor.insertImage', "files/" + data);
			    
		    }).fail(function(data)
		    {
			    alert("error");
		    });
		    
	    }
	  
	    $('#regNotice').on("click", function(e)
		{
	    	var form = $('<form></form>');
		    form.attr('action', 'write.notice');
		    form.attr('method', 'POST');
		    form.appendTo('body');
		
		    var text = $(".note-editable").children("p").html();
		    
			var writer = $('<input type="hidden" value='+"${ loginId }"+' name="writer">');
			var title = $('<input type="hidden" value='+$("#title_text").val()+' name="title">');
			var contents = $('<input type="hidden" id="contents_hidden" name="contents">');
		 	
			
			
		    form.append(writer).append(title).append(contents);
		    $("#contents_hidden").val("`"+text+"`");
		    
		    form.submit();
		});
	    
  });
  
  onload = function()
  {
	    
  };   
</script>
</head>
<body>

	<div class="container">

		<label>제목</label><br> 
		<input type="text" id="title_text" class="form-control" name="title" required><br> 
		
		<label>내용</label><br>
		<div id="summernote" contenteditable="true"></div><br> 
		
		<input id="regNotice" class="btn btn-warning" type="button" value="작성 완료">

	</div>
	
</body>
</html>