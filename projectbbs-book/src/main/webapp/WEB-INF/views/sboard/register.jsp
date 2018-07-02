<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>



<!-- Form -->
<h2>Form</h2>

<form method="post" action="#" class="alt">
	<div class="row uniform">
		<div class="12u 12u$(xsmall)">
			<input type="text" name="title" id="title" value=""
				placeholder="Title" />
		</div>

		<!-- Break -->
		<div class="12u$">
			<textarea name="content" id="content"
				placeholder="Enter your message" rows="6"></textarea>
		</div>
		<!-- Break -->
		<div class="12u$">
			<ul class="actions">
				<li><input type="submit" value="Send Message" class="send" /></li>
				<li><a class="button" href="/board/listPage">BACK</a></li>
			</ul>


			<div class="row uniform">
				<label for="exampleInputEmail1"><h3>
						>>> File DROP Here
						<h3></label>
			</div>
			<div class="filedrop"></div>
		</div>

		<div class="box-footer" style="width: 100%" align="right">
		<div>
		<hr>
		</div>
		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>
<!-- button............... -->
		</div>
	</div>


</form>

<style>
.filedrop {
	width: 100%;
	height: 100px;
	border: 1px dotted gray;
	background-color: #5E5A5A;
	margin: auto;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>


<script id="template" type="text/x-handlebars-template">
<li>
<span class="mailbox-attachments-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
<div class="mailbox-attachments-info">
<a href="{{getLink}}" class="mailbox-attachments-name">{{fileName}}</a>
<a href="{{fullName}}" class="btn btn-default btn-xs full-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
</div>
</li>
</script>


<script>
var template = Handlebars.comfile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
	
	
});

$(".fileDrop").on("drop", function(event) {
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];
	
	var formData = new FormData();
	
	formData.append("file", file);
	
	$.ajax({
		url: '/uploadAjax',
		data: formData,
		dataType: 'text',
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(data) {
			var fileInfo = getFileInfo(data);
			var html = template(fileInfo);
			
			$(".uploadedList").append(html);
			
		}
		
	});
	
	
});


</script>






<%@ include file="../includes/footer.jsp"%>

