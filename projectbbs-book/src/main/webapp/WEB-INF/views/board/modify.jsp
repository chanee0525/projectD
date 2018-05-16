<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>

<!-- Nav -->
<nav id="nav">
	<ul>
		<li><a href="#intro" class="active">Introduction</a></li>
		<li><a href="#first">First Section</a></li>
		<li><a href="#second">Second Section</a></li>
		<li><a href="#cta">Get Started</a></li>
	</ul>
</nav>

<!-- Main -->
<div id="main">

	<!-- Introduction -->
	<section id="intro" class="main">

		<div class="content">

			<!-- Form -->




			<section>
				<h2>YOUR</h2>
				<h2>MESSAGE</h2>
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

			<%@ include file="../includes/footer.jsp"%>


			<script>
				$(document).ready(function() {

					var formObj = $("from[role='form']");
					console.log(formObj);

					$(".modify").on("click", function() {
						formObj.attr("action", "/board/modify");
						formObj.attr("method", "get");
						formObj.submit();
					})

					$(".remove").on("click", function() {
						formObj.attr("action", "/board/remove");
						formObj.submit();
					})
					$(".list").on("click", function() {
						self.location = "/board/listAll";
						formObj.submit();
					})

				})
			</script>