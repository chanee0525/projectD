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
				<h2>SEND ME</h2>
				<form method="post">
					<div class="row uniform">
						<div class="12u 12u$(medium)">
							<input type="text" name="title" id="demo-name" value=""
								placeholder="Write title" />
						</div>


						<div class="12u$">
							<textarea name="content" id="demo-message" 
								placeholder="Enter your message" rows="6"></textarea>
						</div>
						<div class="12u$">
							<ul class="actions">
								<li><input type="submit" value="SEND" class="send" /></li>
								<li><a class="button" href="/board/listAll">BACK</a></li>
							</ul>
						</div>
					</div>
				</form>
			</section>



		</div>
	</section>


<%@ include file="../includes/footer.jsp"%>


