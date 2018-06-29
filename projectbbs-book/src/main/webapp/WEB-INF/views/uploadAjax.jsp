<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>

.fileDrop{
width: 100%;
height: 200px;
border: 1px dotted blue;

}

small {
margin-left: 3px;
font-weight: 200px;
color: gray;

}


</style>

<h3>Ajax File Upload</h3>
<div class='fileDrop'> </div>

<div class='uploadedList'> </div>

<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
  
<script type="text/javascript">
$(".fileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	var file=files[0];

	
});


$(".fileDrop").on("drop", function(event) {
	event.preventDefault();
	
	
	var files = event.originalEvent.dataTransfer.files;
	var file = files[0];
	console.log(file);
	
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
			/* alert(data) */
			
			var str = "";
			
			console.log(data);
			console.log(checkImageType(data));
			
			if(checkImageType(data)) {
				str = "<div>" + "<img src='displayFile?fileName="+data+"'/>" + data + "</div>";
				
			}else{
				str = "<div><a href='displayFile?fileName="+data+"'>" + getOriginalName(data)+"</a></div>";
			}
			$(".uploadedList").append(str);
			
			
		}
		
	});
});


function checkImageType(fileName) {
	var pattern = /jpg$|gif$|png$|jpeg$/i;
	return fileName.match(pattern);
	
}

function getOriginalName(fileName) {
	if(checkImageType(fileName)){
		return;
	}
	
	var idx = fileName.indexOf("_") + 1 ;
	return fileName.substr(idx);
	
}



</script>


</body>

</html>