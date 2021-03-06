<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>


	<!-- Form -->

<h2>Form</h2>
	<form role="form" method="post">
		<input type='hidden' name='bno' value="${boardVO.bno}">
			

	<div class="row uniform">
		<div class="12u 12u$(medium)">
			<input type="text" id="title" name="title" value="${boardVO.title}" />
		</div>

		<!-- Break -->
		<div class="12u$">
			<textarea name="content" id="content" name="content" rows="6">${boardVO.content}</textarea>
		</div>
		<!-- Break -->
		<div class="12u$">
			<ul class="actions">
				<li><input type="submit" value="MODIFY" class="modify" /></li>
				<li><input type="submit" value="LIST" class="list" /></li>
			</ul>
		</div>
	</div>
</form>


<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");
		console.log(formObj);

		$("input[type='submit']").on("click", function(e) {

			e.preventDefault();

		});

		$(".modify").on("click", function(e) {

			e.preventDefault();

			formObj.attr("action", "/board/modify");
			
			formObj.submit();
			formObj.attr("method", "get");
			
			//formObj.submit();

		})

		$(".list").on("click", function(e) {

			e.preventDefault();

			self.location = "/board/listCri";
			//formObj.submit();
		})

	})
</script>


<%@ include file="../includes/footer.jsp"%>


