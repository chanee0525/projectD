<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>


<body>

	<style>
div.gallery {
	margin: 5px;
	border: 1px solid #ccc;
	float: left;
	width: 180px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 15px;
	text-align: center;
}
</style>



	<div id="main">

		<!-- Post -->
		<section class="post">
			<header class="major">
				<span class="date">HELLO, STRANGER</span>
				<h1>
					GALLERY<br /> UNIVERSE
				</h1>
				<div class="images">
					<div class="gallery">

						<a target="_blank" href="fjords.jpg"> <img
							src="/resources/img/1.jpg" alt="Fjords" width="300" height="200">

						</a>

						<div class="desc">Add a description of the image here</div>

					</div>



					<div class="gallery">

						<a target="_blank" href="forest.jpg"> <img
							src="/resources/img/2.jpg" alt="Forest" width="300" height="200">

						</a>

						<div class="desc">Add a description of the image here</div>

					</div>



					<div class="gallery">

						<a target="_blank" href="lights.jpg"> <img
							src="/resources/img/3.jpg" alt="Northern Lights" width="300"
							height="200">

						</a>

						<div class="desc">Add a description of the image here</div>

					</div>



					<div class="gallery">

						<a target="_blank" href="mountains.jpg"> <img
							src="/resources/img/4.jpg" alt="Mountains" width="300"
							height="200">

						</a>

						<div class="desc">Add a description of the image here</div>

					</div>
				</div>

			</header>
		</section>
	</div>
</body>
</html>
<%@ include file="../includes/footer.jsp"%>