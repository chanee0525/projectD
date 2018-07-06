<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<h2>FROM YOUR UNIVERSE<br>
> SEND LETTER</h2>



<form method="post" action="#" class="alt" id="registerForm">
	
	

		<div class="writer">
			<input type="hidden" name="writer" id="writer" class="writer" value='${login.uid }' readOnly />
		</div>
	
	
	
	<div class="row uniform">
		<div class="12u 12u$(xsmall)">
			<input type="text" name="title" id="title"
				placeholder="Title" />
		</div>

		<!-- Break -->
		<div class="12u$">
			<textarea name="content" id="content"
				placeholder="Enter your message" rows="6"></textarea>
		</div>
		<!-- Break -->
<!--  		<div class="12u$">
			<ul class="actions">
				<li><input type="submit" value="Send Message" class="send" id="send" /></li>
				<li><a class="button" href="/board/listPage">BACK</a></li>
			</ul> 
 -->


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
		
		 		<div class="rgstbtns" align="right">
			<ul class="actions">
				<li><button type="submit" value="Send Message" class="send" id="send">SUBMIT</button></li>
				<li><a class="button" href="/board/listPage">BACK</a></li>
			</ul> 
			</div>
		</div>
</form>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>


	<script id="template" type="text/x-handlebars-template">
<li>
<span class="mailbox-attachments-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
<div class="filenamediv">
<a href="{{getLink}}" class="getLink">{{fileName}}</a>
<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn" id="filedelbtn"><i class="fa fa-fw fa-remove id="removebtn"></i></a>
</div>
</li>
</script>


<script>
var template = Handlebars.compile($("#template").html());

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
    


     $("#uploadedList").on("click", ".btn btn-default btn-xs pull-right delbtn", function (event) {
    	
    	event.preventDefault();
    	event.propagation();
    	console.log("click.................."+event);
    	
    	
    	
    	var that = $(this);
    	
    	$.ajax ({
    		
    		url:"deleteFile",
    		type: "post",
    		data: {fileName:$(this).attr("href")},
    		dataType:"text",
    		success: function(result) {
    			if(result == 'deleted'){
    				that.parent("li").remove();
    			}
				
			}
    		
    	}); 
    	
     
     });
  
   
</script>


<script type="text/javascript" src="/resources/js/upload.js"></script>
<%@ include file="../includes/footer.jsp"%>

