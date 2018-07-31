<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->



<h2>
	HELLO, STRANGER<br> > JOIN
</h2>
<form action="/user/joinPost" method="post" style="width: 100%">

	<div class="joinform" style="width: 100%; text-align: center;">

		<div class="idpw" style="display: inline-block;">
			<div class="id">
				<div class="idform" style="width: 100%">
					<h3 style="display: inline;">ID</h3>
					<input type="text" name="uid" id="uid" class="uidform" id="uidform"
						style="width: 250px; display: inline;">
				</div>
			</div>

			<div class="pwform" style="width: 100%">
				<h3 style="display: inline;">PW</h3>
				<input type="text" name="upw" id="upw" class="upwform" id="upwform"
					style="width: 250px; display: inline;">
			</div>

		</div>

		<div class="nameform" style="width: 100%">
			<h3 style="display: inline;">NAME</h3>
			<input type="text" name="uname" id="uname" class="unameform"
				id="nameform" style="width: 250px; display: inline;">

		</div>


		<div class="emailform" style="width: 100%">
			<h3 style="display: inline;">E-MAIL</h3>
			<input type="text" name="email" id="email" class="emailform"
				id="emailform" style="width: 250px; display: inline;">

		</div>


		<br>


		<div class="loginfooter">
			<div class="loginfooterdiv">

			</div>
			<div class="btns">
				<button type="submit" class="join" id="join">JOIN</button>
				<button type="submit" class="login" id="login">LOGIN</button>
			</div>
		</div>
	</div>
</form>
	<%@ include file="../includes/footer.jsp"%>