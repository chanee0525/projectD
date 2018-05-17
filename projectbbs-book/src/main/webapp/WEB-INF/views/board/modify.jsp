<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>



<!-- Main -->
<div id="main">

	<!-- Introduction -->
	<section id="intro" class="main">

		<div class="content">

			<!-- Form -->

			<section>
				<h2>MODIFY</h2>
				<h2>YOUR MESSAGE</h2>
				<h2></h2>


				<form role="form" method="post">
					<input type='hidden' name='bno' value="${boardVO.bno}">
					<form>
					

						<div class="row uniform">
							<div class="12u 12u$(medium)">
								<input type="text" name="title" id="demo-name"
									value="${boardVO.title}"/>
							</div>


							<div class="12u$">
								<textarea name="content" id="demo-message" rows="6">${boardVO.content}</textarea>
							</div>
							<div class="12u$">
								<ul class="actions">
									<li><input type="submit" value="MODIFY" class="modify" /></li>
									<!-- <li><a class="button" href="/board/list">BACK</a></li> -->
									<li><input type="submit" value="LIST" class="list" /></li>
									<li><input type="submit" value="REMOVE" class="remove" /></li>

								</ul>
							</div>
						</div>
					</form>
			</section>

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
						
						self.location = "/board/listAll";
						//formObj.submit();
					})
					
					$(".remove").on("click", function(e) {
						
						e.preventDefault(); 
						formObj.attr("action", "/board/remove");
						formObj.submit();
						formObj.attr("method", "remove");
					})

				})
			</script>
			
			
			<%@ include file="../includes/footer.jsp"%>
			

			