<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>



<!-- Form -->
<h2>Form</h2>

<form method="post" action="#" class="alt">
	<div class="row uniform">
		<div class="12u 12u$(xsmall)">
			<input type="text" name="title" id="title" value=""
				placeholder="Title" />
		</div>

		<!-- Break -->
		<div class="12u$">
			<textarea name="content" id="content"
				placeholder="Enter your message" rows="6"></textarea>
		</div>
		<!-- Break -->
		<div class="12u$">
			<ul class="actions">
				<li><input type="submit" value="Send Message" class="send" /></li>
				<li><a class="button" href="/board/listPage">BACK</a></li>
			</ul>
		</div>
	</div>
</form>




<%@ include file="../includes/footer.jsp"%>

