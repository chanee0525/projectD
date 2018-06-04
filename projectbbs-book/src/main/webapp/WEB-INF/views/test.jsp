<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<body>

	<h2>Ajax Test Page</h2>
	
	<ul id="replies">
	
	</ul>



	<div>
		<div>
			REPLYER <input type="text" name='replyer' id='newReplyWriter'>
		</div>
		<div>
			REPLY TEXT <input type='text' name='replytext' id='newReplyText'>
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>



	<script>
	getAllList();
	
		$("#replyAddBtn").on("click", function() {
			
			var bno = 5071;

			var replyer = $("#newReplyWriter").val();
			var replytext = $("#newReplyText").val();

			$.ajax({
				type : 'post',
				url : '/replies',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result) {

					if (result == 'SUCCESS') {

						alert("등록되었습니다.");
						getAllList();
					}
				}

			});

		});


		function getAllList() {
			
			var bno = 5071;

			$
					.getJSON(
							"/replies/all/" + bno,
							function(data) {
								var str = "";

								console.log(data.length);

								$(data)
										.each(
												function() {
													str += "<li data-rno='"+this.rno+"' class='replyLi'>"
															+ this.rno
															+ ":"
															+ this.replytext
															+ "</li>";

												});

								$("#replies").html(str);

							});
		}
		</script>
</body>
</html>