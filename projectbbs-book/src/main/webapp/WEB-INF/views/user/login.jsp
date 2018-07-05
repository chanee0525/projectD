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
	HELLO, STRANGER<br> > LOGIN
</h2>
<form action = "/user/loginPost" method = "post" style="width:100%">
	
	<div class = "loginform" style="width:100%; text-align:center;">
		
		<div class="idform" style="width:100%">
		<h3 style="display:inline;">ID</h3>
		<input type="text" name="uid" id="uid" class="uidform" id="uidform" placeholder="USER ID" style="width:250px; display:inline;"  >
		</div>
		
		<div class="pwform"style="width:100%">
		<h3 style="display:inline;">PW</h3>
		<input type="text" name="upw" id="upw" class="upwform" id="upwform" placeholder="PASSWORD" style="width:250px; display:inline; " >
		
		</div>
		
		<br>
		
		<button type="submit" class="sign" id="sign">SIGN IN</button>
		<button type="submit" class="login" id="login">LOGIN</button>
		
		
	</div>
	
	
</form>
<%@ include file="../includes/footer.jsp"%>

	
