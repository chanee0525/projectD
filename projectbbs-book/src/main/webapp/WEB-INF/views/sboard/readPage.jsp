<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>

<!-- Form -->


<form role="form" method="post" style="width:100%">
	<input type='hidden' name='bno' value="${boardVO.bno}"> 
	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}"> 
	<input type='hidden' name='searchType' value="${cri.searchType}"> 
	<input type='hidden' name='keyword' value="${cri.keyword}">
	



	<h2>Form</h2>
	<h2>${boardVO.bno}</h2>

</form>

<div class="row uniform">
	<div class="12u 12u$(medium)">
		<input type="text" id="demo-name" value="${boardVO.title}"
			readonly="readonly" />
	</div>

	<!-- Break -->
	<div class="12u$">
		<textarea name="content" id="content" rows="6" readonly="readonly">${boardVO.content}</textarea>


	</div>




	<!-- Break -->
	<div class="12u$">
		<ul class="actions">
			<li><input type="submit" value="MODIFY" class="modify" /></li>
			<li><input type="submit" value="LIST" class="list" /></li>
			<li><input type="submit" value="REMOVE" class="remove" /></li>
		</ul>
	</div>

	<style>
.
</style>

	<div class="row" style="width:100%">
		<div class="col-md-12" style="width:100%">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD REPLY</h3>
				</div>
				<div class="box-body">
					<label for="newReplyWriter">writer</label> <input
						class="form-control" type="text" placeholder="USER ID"
						id="newReplyWriter"> <label for="newReplyText">ReplyText</label>
					<input class="form-control" type="text" placeholder="reply Text"
						id="newReplyText">
				</div>

				<div align="right"  class="box-footer" >
					<button type="submit" class="btn btn-primary" id="replyAddBtn" >ADD
						REPLY</button>
				</div>

			</div>
		</div>

	</div>



	<ul class="timeline">
		<li class="time-lable" id="repliesDiv"><span class="bg-green">
				Replies List</span></li>
	</ul> 

	<div class='text-center'>
		<ul id="pagination" class="pagination pagination-sm no-margin">

		</ul>
	</div>

	<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
<div class="timeline-item">
<span class="time">
<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
</span>
<h3 class="timeline-header"><strong>{{rno}}</strong> -{{replayer}}</h3>
<div class="timeline-body">{{replytext}}</div>
<div class="timeline-footer">
<a class="btn btn-primary btn-xs"
data-toggle="modal" data-target="#modifyModal">Modify</a>
</div>
</div>
</li>
{{/each}}
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

		var printData = function(replyArr, target, templateObject) {

			var template = Handlebars.compile(templateObject.html());
			var html = template(replyArr);
			$(".replyLi").remove();
			target.after(html);
		}

		var bno = ${boardVO.bno};
		var replyPage = 1;

		function getPage(pageInfo) {

			$.getJSON(pageInfo, function(data) {
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.PageMaker, $(".pagination"));

				/* $("#modifyModal").modal('hide'); */

			});

		}

		var printPaging = function(pageMaker, target) {
			var str = "";
			if (pageMaker.prev) {
				str += "<li><a href='" + (pageMaker.startPage - 1)
						+ "'> << </a></li>";
			}
			for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
				var strClass = pageMaker.cri.page == i ? 'class=active' : '';
				str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}

			if (pageMaker.next) {
				str += "<li><a href='" + (pageMaker.endPage + 1)+"'> >> </a></li>";
			}

			target.html(str);
		};
		
		$("#repliesDiv").on("click", function() {
			if($(".timeline li").size() > 1) {
				return;
			}
			getPage("/replies/"+bno+"/1");
		});
		
		
		$(".pagination").on("click", "li a", function(event) {
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPage("/replies/"+bno+"/"+replyPage);
		});
	</script>

	<%@ include file="../includes/footer.jsp"%>