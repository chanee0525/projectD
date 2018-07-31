<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>


<body>
<head>

<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/skel.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>

</head>
<body>

<style>
* {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body { .
	gallery_content: hover .overlay .right top: 0;
}

.pic img {
	width: 200px;
	height: 200px;
}

.pic {
	width: 100%;

	justify-content: center;
	align-items: center;
}

.pic:after {
	content: "";
	display: block;
	clear: both;
}

.gallery_content {
	position: relative;
	float: left;
	width: 33.3333333%;
	overflow: hidden;
}

.gallery_content img {
	width: 100%;
	height: 300px;
	display: block;
	margin: 0 auto;
	transition: all 1s ease-in-out;
}

.content {
	z-index: 1;
	display: none;
	color: #fff;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.content h1 {
	font-size: 1.2em;
	text-transform: uppercase;
	text-align: center;
}

.content p {
	padding: 2px 0;
	font-size: 0.8em;
	text-align: center;
}

.gallery_content:hover .content {
	display: block;
	transition: all 1s ease-in-out;
}

.gallery_content:hover img {
	transform: scale(1.2);
	transition: all 1s ease-in-out;
}

.overlay {
	display: none;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	transition: top 0.3s, right 0.3s, bottom 0.3s, left 0.3s;
}

/* overlay color */
.overlay.darkBlue {
	background-color: rgba(31, 50, 99, 0.6);
}

.overlay.gold {
	background-color: rgba(216, 177, 126, 0.5);
}

.overlay.pink {
	background-color: rgba(255, 113, 181, 0.7);
}

.overlay.black {
	background-color: rgba(0, 0, 0, 0.5);
}

.overlay.yellow {
	background-color: rgba(103, 58, 183, 0.5);
}

.overlay.red {
	background-color: rgba(244, 67, 54, 0.5);
}

/*  .gallery_content:hover .overlay {
        display: block;
        transition: all 0.5s ease-in-out;
    }
*/
</style>




<style>
#bg {
	width: 100%;
	height: 600px;
	height: 300px;
	background-color: rgba(0, 0, 0, 0.5);
	position: absolute;
	top: 0;
	left: 0;
	/*display: flex;*/
	justify-content: center;
	align-items: center;
	/*z-index: 100;*/
}

#bg img {
	width: 600px;
	height: 600px;
}

.show {
	display: flex;
}

.hide {
	display: none;
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
				
			<div class="pic" height="1000px">
				<div class="gallery_content">
					<img src="/resources/img/1.jpg" alt="1.jpg">
					<div class="content">
						<h1>당신을</h1>
					</div>
					<div class="overlay darkBlue"></div>
				</div>
				<div class="gallery_content top">
					<img src="/resources/img/2.jpg" alt="2.jpg">
					<div class="content">
						<h1>기어이</h1>
					</div>
					
				</div>
				<div class="gallery_content">
					<img src="/resources/img/3.jpg" alt="3.jpg">
					<div class="content">
						<h1>사랑해서</h1>
					</div>
					
				</div>
				
				<div class="gallery_content">
					<img src="/resources/img/4.jpg" alt="4.jpg">
					<div class="content">
						<h1>오늘도</h1>
					</div>
					
				</div>
				
				<div class="gallery_content">
					<img src="/resources/img/5.jpg" alt="5.jpg">
					<div class="content">
						<h1>밤이</h1>
					</div>
					
				</div>
				
				<div class="gallery_content">
					<img src="/resources/img/6.jpg" alt="6.jpg">
					<div class="content">
						<h1>깊다</h1>
					</div>
					
				</div>
				
			</header>

		



				<div id="bg" class="hide">
					
				</div>

			</div>
		</section>

	</div>






</body>
</html>
<script>
	var w = document.documentElement.clientWidth;
	var h = document.documentElement.clientHeight;
	var bg = document.querySelector("#bg");
	console.log(w);
	console.log(h);

	var pic = document.querySelector(".pic");
	pic.setAttribute("style", "height: " + h + "px;");

	console.log(pic);

	bg.addEventListener("click", function(e) {
		console.log("e1" + e);
		console.log(this);
		console.log(e);
		this.setAttribute("class", "hide");
	}, false);

	pic.addEventListener("click", function(e) {

		var target = e.target;

		if (target.tagName !== 'IMG') {
			return;
		}
		console.dir(target);
		bg.setAttribute("style", "height: " + h + "px;");
		bg.setAttribute("class", "show");
		bg.innerHTML = target.outerHTML;
		//  bg.innerHTML = "<div><img src=" + this.target + "></div>";

		//   bg.appendChild(target);

	}, false);
</script>


</body>
</html>
</body>


</html>

<%@ include file="../includes/footer.jsp"%>
