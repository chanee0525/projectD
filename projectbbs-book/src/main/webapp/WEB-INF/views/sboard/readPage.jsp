<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<%@ include file="../includes/header.jsp"%>




<style>
.active {
	background-color: #eeeeee
}
</style>

<!-- Form -->

<style>
input[type="submit"].small, input[type="reset"].small, input[type="button"].small,
	button.small, .button.small {
	font-size: 0.7rem;
	height: 2.0rem;
	line-height: 2.0rem;
	padding: 0 1.0rem;
}
#myModal {
	display: none;
	position: relative;
	background-color: #FFFFFF;
	position: absolute;
	padding: 10px;
	border: 2px solid #E2E2E2;
	z-Index: 1;
	padding-top: 100px;
}
</style>

<style type="text/css">
.popup {
	position: absolute;
}
.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}
.front {
	z-index: 1110;
	opacity: 1;
	border: 1px;
	margin: auto;
}
.show {
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}
.box-footer{
width: 100%;
}
#uploadedList{
display : inline-block;
list-style-type: none;
}
/* .timeline{
list-style-type: none;
} */
</style>






<form role="form" method="post" style="width: 100%">
	<input type='hidden' name='bno' value="${boardVO.bno}"> <input
		type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
		type='hidden' name='searchType' value="${cri.searchType}"> <input
		type='hidden' name='keyword' value="${cri.keyword}">




<h2>HELLO, STRANGER<br>
	> LETTER NO.${boardVO.bno}</h2>

</form>

<div class="row uniform">
		
		<div class="writer">
			<input type="hidden" name="writer" id="writer" class="writer" value='${login.uid }' readOnly />
		</div>
	

	<div class="12u 12u$(medium)">
		<input type="text" id="demo-name" value="${boardVO.title}"
			readonly="readonly" />
	</div>
	
	<div class='popup back' style="display:none" id="popup_back"></div>
	<div id="popup front" class='popup front' style="display:none">
	<img id="popup_img">
	</div>

	<!-- Break -->
	<div class="12u$">
		<textarea name="content" id="content" rows="6" readonly="readonly">${boardVO.content}</textarea>


	</div>

	<div class="box-footer">
		<hr>
		<label for="uploadedlist"><h3>UPLOADED LIST▼</h3></label>
		<div class="uploadedlist" id="uploadedlist"></div>

		<ul class="mailbox-attachments clearfix uploadedList" id="uploadedList">
		</ul>
		<hr>
	</div>


	<!-- Break -->
	<div align="right" class="12u$">
		<ul class="actions">
		<c:if test="${login.uid == boardVO.writer }">
			<li><input type="submit" value="MODIFY" class="modify" /></li>
			<li><input type="submit" value="REMOVE" class="remove" /></li>
			</c:if>
			<li><input type="submit" value="LIST" class="list" /></li>
		</ul>
	</div>






	<ul class="timeline" style="list-style-type: none;">
		<li class="time-lable" id="repliesDiv"><span class="bg-green">
				CLICK HERE! > <br> 
				REPLIES LIST <small id='replycntSmall'>[${boardVO.replycnt}]</small>
		</span></li>
	</ul>

	<form style="justify-content: center">
		<div class='pagination'></div>

	</form>


	<script id="template" type="text/x-handlebars-template">


{{#each .}} 
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
<div class="timeline-item">
<span class="time">
<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
</span>
<div class="timeline-header">{{rno}}</div>
<div class="timeline-replyer"><h4>{{replyer}}</h4></div>
<div class="timeline-body">{{replytext}}</div>
<div class="timeline-footer">
{{#eqReplyer replyer}}
<a class="6u 12u$(small) modShowBtn" data-toggle="modal" data-target=".modifyModal" id="ReplylistModBtn">MODIFY</a>
{{/eqReplyer}}
</div>
</div>
</li>
{{/each}}
</script>



	<div class="row" style="width: 100%">
		<div class="col-md-12" style="width: 100%">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD REPLY</h3>
				</div>
				<c:if test="${not empty login }">
				<div class="box-body">
					<label for="newReplyWriter">writer</label> <input
						class="form-control" type="text" value='${login.uid }'
						id="newReplyWriter" readonly="readonly"> <label for="newReplyText">ReplyText</label>
					<input class="form-control" type="text" placeholder="reply Text"
						id="newReplyText">
				</div>
				
				
				<div align="right" class="box-footer">
					<button type="submit" class="btn btn-primary" id="replyAddBtn">ADD
						REPLY</button>
				</div>
				</c:if>
				<c:if test="${empty login }">
				
				<div class=box-body">
				<div>
				<div><a href="javascript:goLogin();">LOGIN PLEASE</a></div>
				</div>
				
				</div>
				
				</c:if>
			</div>
		</div>
	</div>
	<!-- modal -->
	<div class="modifyModal" style="width: 100%" id="myModal">
		<div class="col-md-12" style="width: 100%">
			<div class="box box-success">
				<div class="modal fade" tabindex="-1" role="dialog"
					area-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div align="right" class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true" id="ModalCloseBtn">&times;</button>
							</div>
							<h3 class="modal-title" id="myModalLabel">MODIFY MODAL</h3>
						</div>
						<div class="modal-body" data-rno>
							<div class="form-group">
								<label>REPLY</label> <input class="form-control" id="replytext"
									name='relply' value='new reply' style="width: 100%">
							</div>
							<div class="form-group">
								<label>REPLYER</label> <input class="form-control" id="replyer"
									name='relplyer' value='relplyer' readOnly="readOnly">
							</div>
						</div>
					</div>
				</div>
				<div align="right" class="modal-footer">
					<button id='modalModBtn' type="button" class="modalModBtn"
						id="replyModBtn">MODIFY</button>
					<button id='modalRemoveBtn' type="button" class="modalRemoveBtn"
						id="replyRmvBtn">REMOVE</button>
					<!-- <button id='modalRegisterBtn' type="button" class="modalRegisterBtn">REGISTER</button> -->
					<button id='modalcloseBtn' type="button" class="modalcloseBtn"
						data-dismiss="modal">BACK</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 			<div class="row" style="width: 100%">
				<div class="replyMod" style="width: 100%">
					<div class="box box-success">
						<div class="box-header">
							<h3 class="box-title">MODIFY REPLY</h3>
						</div>
						<div class="box-body" data-rno>
							<label for="ModReplyText">MODIFY</label> <input
								class="form-control" type="text" placeholder="reply Text"
								id="newReplyText">
						</div>
						<div align="right" class="box-footer">
							<button type="submit" class="btn btn-primary" id="replyModBtn">Mod
								REPLY</button>
							<button type="submit" class="btn btn-primary" id="replyDelBtn">Del
								REPLY</button>
							<button type="submit" class="btn btn-primary" id="replyDelBtn">Close</button>
						</div>
						</div>
	
	 -->
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$("input[type='submit']").on("click", function(e) {
			e.preventDefault();
		});
		$(".modify").on("click", function(e) {
			e.preventDefault();
			//alert("AAAAAAAAAAAAAAAAAAAAAAAAAA");
			console.log(" modify check");
			//alert("AAAAAAAAAAAAAAAAAAAAAAAAAA");
			formObj.attr("action", "/sboard/modifyPage");
			console.log("check check")
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".remove").on("click", function(e) {
			e.preventDefault();
			console.log(" remove check");
			//formObj.submit();
			
			var replyCnt = $("#replycntSmall").html().replace(/[^0-9]/g,"");
			
			if(replyCnt > 0){
				alert("댓글이 달린 게시물은 삭제할 수 없습니다.");
				return;
			}
			
			var arr = [];
			$(".uploadedList li").each(function(index) {
				arr.push($(this).attr("data-src"));
				
			});
			
			if(arr.length > 0){
				$.post("/deleteAllFiles", {files:arr}, function() {
					
				});
			}
			
			
			formObj.attr("action", "/sboard/removePage");
			formObj.submit();
		});
		
		$(".list").on("click", function(e) {
			//alert("AAAAAAAAAAAAAAAAAAAAAAAAAA");
			e.preventDefault();
			formObj.attr("method", "get");
			formObj.attr("action", "/sboard/list");
			formObj.submit();
		});
	});
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum = '';
		if(replyer == '${login.uid}'){
			accum += block.fn();
		}
		return accum;
		
	});
	var printData = function(replyArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
	
	
	var bno = ${boardVO.bno};
	var replyPage = 1;
	var replyUL = $(".timeline")
	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.PageMaker, $(".pagination"));
			console.log("----------------pagination")
			$(".modifyModal").hide('slow');
			console.log("----------------modal hide")
			$("#replycntSmall").html("[ " + data.PageMaker.totalCount + "]");
		});
	}
	var printPaging = function(pageMaker, target) {
		var str = "";
		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}
		console.log("----------------------")
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}
		console.log("----------------------active")
		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		target.html(str);
	};
	$("#repliesDiv").on("click", function() {
		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + bno + "/1");
	});
	$(".pagination").on("click", "li a", function(event) {
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPage("/replies/" + bno + "/" + replyPage);
	});
	var replyObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	$("#replyAddBtn").on("click", function() {
		console.log("add btn click......................");
		console.log(replyObj);
		console.log(replyObj.val());
		var replyer = replyObj.val();
		console.log(replytextObj.val());
		$.ajax({
			type : 'post',
			url : '/replies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				replyer : replyer,
				replytext : replytextObj.val()
			}),
			success : function(result) {
				if (result == 'SUCCESS') {
					console.log("result:" + result);
					alert("등록되었습니다.");
					ReplyPage = 1;
					getPage("/replies/" + bno + "/" + replyPage);
					replyObj.val("");
					replytextObj.val("");
				}
				console.log("end ajax......................");
			}
		});
	});
	$(".timeline").on("click", ".replyLi", function(event) {
		var reply = $(this);
		/* 		console.dir("reply........",reply);
		 console.log("dir..........",reply.parent("dir").parent("dir"));
		
		 */
		$("#replytext").val(reply.find('.timeline-body').text());
		$("#replyer").val(reply.find('.timeline-replyer').text());
		$(".modal-title").html(reply.attr("data-rno"));
		//$(".modifyModal").show('slow');
		console.log("...........modifyModal click........")
		console.log(this)
	});
	$(".timeline")
			.on(
					"click",
					".modShowBtn",
					function(event) {
						var reply = $(this);
						/* 		console.dir("reply........",reply);
						 console.log("dir..........",reply.parent("dir").parent("dir"));
						
						 */
						$("#replytext")
								.val(reply.find('.timeline-body').text());
						$("#replyer").val(
								reply.find('.timeline-replyer').text());
						$(".modal-title").html(reply.attr("data-rno"));
						$(".modifyModal").show('slow');
						console
								.log("...........custom ..............modifyModal click........")
						console.log(this)
					});
	var modal = $(".modifyModal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalcloseBtn = $("#modalcloseBtn");
	$(".modalModBtn").on("click", function(e) {
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		$.ajax({
			type : 'put',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				replytext : replytext
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result:" + result);
				if (result == 'SUCCESS') {
					alert("수정되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});
	/* modalRegisterBtn.show();
	
	$(".replymod").modal("show"); */
	$("#ModalCloseBtn").click(function() {
		$(".modifyModal").hide('slow');
	});
	$(".modalRemoveBtn").on("click", function() {
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result:" + result);
				if (result == 'SUCCESS') {
					alert("삭제되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});
	

</script>

<script id="templateAttach" type="text/x-handlebars-template">

<li data-src='{{fullName}}'>
<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
<div class="mailbox-attachments-info">
<a href="{{getLink}}" class="mailbox-attachments-name">{{fileName}}</a>
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
$(".uploadedList").on("click",  "a" , function(event) {
	event.preventDefault();
	console.log("clicked");
	var fileLink = $(this).attr("href");
	
			if (checkImageType(fileLink)) {
				
				
				
				var imgTag = $("#popup_img");
				imgTag.attr("src", fileLink);
				
				console.log("test",imgTag.attr("src"));
				
				$(".popup").show('slow');
				imgTag.addClass("show");
			}
		});
$("#popup_img").on("click", function() {
	$(".popup").hide('slow');
});
</script>



<script type="text/javascript" src="/resources/js/upload.js"></script>
<%@ include file="../includes/footer.jsp"%>