<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
<style>
	
	#btn_div
	{
		text-align: right;
	}
	#header_row > div
	{
		text-align: center;
		border: 1px solid #ffba00;
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
		        
	});
        
	onload = function()
	{
		
		
              
	};
        
</script>
</head>
<body>


	<div class="container">
	
		<div id="header_row" class="row my-5">
		
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
		
		
		<div class="row my-5 py-5">
		
			<div class="col-12">
				
				<c:set var="contents" value="${ dto.no_contents }"/>
				<p id="html" class="my-5">${fn:substring(contents,1,fn:length(contents)-1)}</p>
			
			</div>
		
		</div>
		
		
		
			<div class="row">
			
				<div id="btn_div" class="col-12">
					<c:if test="${ type == 'admin' }">
						<input id="update_btn" class="btn btn-primary" type="button" value="수정">
						<input id="delete_btn" class="btn btn-primary" type="button" value="삭제">
					</c:if>
						<input id="back_btn" class="btn btn-primary" type="button" value="목록으로">
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