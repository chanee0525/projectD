<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../includes/header.jsp"%>



<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: solid 2px;
	background-color: #5E5A5A;
	margin: auto;
	padding:0.75rem 1rem;
	display: inline-block;
	
}


li{

display : inline-block;

}

.box-footer{
width: 100%;

}



</style>




<!-- Form -->

<form role="form" method="post" style="width: 100%">
	<input type='hidden' name='bno' value="${boardVO.bno}"> <input
		type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
		type='hidden' name='searchType' value="${cri.searchType}"> <input
		type='hidden' name='keyword' value="${cri.keyword}">




	
	<h2>LETTER NO.${boardVO.bno}</h2>

</form>
	<form method="post" action="#" class="alt" id="registerForm">
		<div class="row uniform">
		<div class="12u 12u$(medium)">
			<input type="text" id="title" name="title" value="${boardVO.title}" />
		</div>

		<!-- Break -->
		<div class="12u$">
			<textarea name="content" id="content" name="content" rows="6">${boardVO.content}</textarea>
		</div>
		
			<div class="form-group" style="width:100%">
				<label for="fileDrop"><h3>File DROP Here▼</h3></label>
			<div class="fileDrop" id="fileDrop"></div>
		</div>
		</div>
				
		<div class="box-footer" >
				<hr>
				 <label for="uploadedlist"><h3>UPLOADED LIST▼</h3></label> 
			 <div class="uploadedlistdiv" id="uploadedlistdiv"></div> 
		<ul class="mailbox-attachments clearfix uploadedList" style="list-style-type : none">
		</ul>
			
				<hr>
				
		<!-- Break -->
		<div class="12u$">
			<ul class="actions">
				<li><button type="submit" value="Send Message" class="send" id="send">SUBMIT</button></li>
				<li><input type="submit" value="LIST" class="list" /></li>
			</ul>
		</div>
	</div>
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script id="templateAttach" type="text/x-handlebars-template">

<li data-src='{{fullName}}'>
<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
<div class="mailbox-attachments-info">
<a href="{{getLink}}" class="mailbox-attachments-name">{{fileName}}</a>
<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
</span>
</div>
</li>
</script>

<script>

var bno = ${boardVO.bno};
var template = Handlebars.compile($("#templateAttach").html());

$.getJSON("/sboard/getAttach/"+bno, function(list) {
	$(list).each(function() {
		
		var fileInfo = getFileInfo(this);
		var html = template(fileInfo);
		
		$(".uploadedList").append(html);
		
		
	});
	
});

$(".fileDrop").on("dragenter dragover", function(event) {
	 event.preventDefault();
	 /* console.log(event); */
	
});

$(".fileDrop").on("drop", function(event) {
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	console.dir(files);
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
			
			console.log("fileinfo................."+fileInfo);
			
			
			$(".uploadedList").append(html);
			console.log("Html.............."+html);
		}
	
		
	});
	
});
	
    $("#registerForm").submit(function (event) {
        event.preventDefault();
		
        var that = $(this);
        var str = "";
        console.dir($(".uploadedList"));
        $(".uploadedList .delbtn").each(function (index) {
            str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'> ";
        });
        
        that.append(str);
        console.log(str);
        that.get(0).submit();

});


    
  
</script>


<script>
	$(document).ready(function() {
						var formObj = $("form[role='form']");
						console.log(formObj);
						$("input[type='submit']").on("click", function(e) {
							e.preventDefault();
						});
						$(".modify").on("click", function(e) {
							
							e.preventDefault();

							formObj.submit();

						});
						$(".list").on("click",function(e) {
							
							e.preventDefault();
							self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
								+"&searchType=${cri.searchType}&keyword=${cri.keyword}";
							//formObj.submit();
						});
			
				
					});
	
	
</script>





<script type="text/javascript" src="/resources/js/upload.js"></script>
<%@ include file="../includes/footer.jsp"%>