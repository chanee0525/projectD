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
				<h2></h2>
				<h2>LETTERS</h2>
				<h2></h2>


				<form role="form" method="post">

					<input type='hidden' name='bno' value="${boardVO.bno}">
					
					</form>
					
					<div class="row uniform">
						<div class="12u 12u$(medium)">
							<input type="text" id="demo-name" value="${boardVO.title}" readonly="readonly" />
						</div>


						<div class="12u$">
							<textarea id="demo-message" rows="6" readonly="readonly">${boardVO.content}</textarea>
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
	
						console.log(" modify check");
						//alert("AAAAAAAAAAAAAAAAAAAAAAAAAA");
						formObj.attr("action", "/board/modify");
						console.log("check check")
						formObj.attr("method", "get");
						formObj.submit();
					});

					$(".remove").on("click", function(e) {
						
						e.preventDefault(); 

						console.log(" remove check");
						//formObj.submit();
						formObj.attr("action", "/board/remove");
						formObj.submit();
					});

					$(".list").on("click", function(e) {
						
						//alert("AAAAAAAAAAAAAAAAAAAAAAAAAA");
						
						self.location = "/board/listAll";
						//formObj.submit();
						
						
						
					});

				});
			</script>

			<%@ include file="../includes/footer.jsp"%>