<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="../includes/header.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">
* {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body { .
	gallery_content: hover .overlay .right top: 0;
}

#gallery_layout {
	width: 960px;
	margin: 0 auto;
}

#gallery_layout:after {
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

.gallery_content:hover .overlay {
	display: block;
	transition: all 0.5s ease-in-out;
}

@media all and (min-width: 960px) {
	#gallery_layout {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
}

@media all and (max-width: 959px) {
	#gallery_layout {
		width: 100%;
	}
	.gallery_content {
		width: 50%;
	}
}

@media all and (max-width: 499px) {
	#gallery_layout {
		width: 100%;
	}
	.gallery_content {
		width: 100%;
	}
	@media all and (min-width: 960px) {
		#gallery_layout {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
	}
	@media all and (max-width: 959px) {
		#gallery_layout {
			width: 100%;
		}
		.gallery_content {
			width: 50%;
		}
	}
	@media all and (max-width: 499px) {
		#gallery_layout {
			width: 100%;
		}
		.gallery_content {
			width: 100%;
		}
	}
}
</style>




</head>




<div id="gallery_layout">
	<div class="gallery_content">
		<img src="../resources/img/1.jpg" alt="1.jpg">
		<div class="content">
			<h1>당신을</h1>
		</div>
		<div class="overlay darkBlue"></div>
	</div>
	<div class="gallery_content top">
		<img src="../resources/img/2.jpg" alt="2.jpg">
		<div class="content">
			<h1>기어이</h1>
		</div>
		<div class="overlay red"></div>
	</div>
	<div class="gallery_content">
		<img src="../resources/img/3.jpg" alt="3.jpg">
		<div class="content">
			<h1>사랑해서</h1>
		</div>
		<div class="overlay pink"></div>
	</div>
	<div class="gallery_content">
		<img src="../resources/img/4.jpg" alt="4.jpg">
		<div class="content">
			<h1>오늘도</h1>
		</div>
		<div class="overlay black"></div>
	</div>
	<div class="gallery_content">
		<img src="../resources/img/5.jpg" alt="5.jpg">
		<div class="content">
			<h1>밤이</h1>
		</div>
		<div class="overlay yellow"></div>
	</div>
	<div class="gallery_content">
		<img src="../resources/img/6.jpg" alt="6.jpg">
		<div class="content">
			<h1>깊다</h1>
		</div>
		<div class="overlay gold"></div>
	</div>

</div>




</body>


</html>
<%-- <%@ include file="../includes/footer.jsp"%> --%>