<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>



<!-- Form -->


<form role="form" method="post">
	<input type='hidden' name='bno' value="${boardVO.bno}"> <input
		type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">


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
</div>







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
			formObj.attr("action", "/board/modifyPage");
			console.log("check check")
			formObj.attr("method", "get");

			formObj.submit();

		});
		$(".remove").on("click", function(e) {
			e.preventDefault();
			console.log(" remove check");
			//formObj.submit();
			formObj.attr("action", "/board/removePage");
			formObj.submit();
		});
		$(".list").on("click", function(e) {
			//alert("AAAAAAAAAAAAAAAAAAAAAAAAAA");
			e.preventDefault();

			formObj.attr("method", "get");
			formObj.attr("action", "/board/listPage");
			formObj.submit();
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>