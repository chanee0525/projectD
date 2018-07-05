<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>




<!-- Table -->


	<h2>HELLO, STRANGER<br>
	> LETTERS</h2>
<div class="table-wrapper">
	<table>
		<thead>
			<tr>
				<th>no</th>
				<th>title</th>
				<th>regdate</th>
				<th>viewcnt</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="boardVO">
				<%-- <tr data-bno="${boardVO.bno}"> --%>
				<tr>
					<td>${boardVO.bno}</td>
					<td><a
						href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page )}&bno=${boardVO.bno}'>${boardVO.title}<strong>[${boardVO.replycnt}]</strong></a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${boardVO.regdate}" /></td>
					<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>


</div>


<%-- <span>PAGE MAKER...................${pageMaker }</span> --%>


<!-- Break -->

<div class="row uniform">
	<div class="4u 12u$(xsmall)">
		<div class="select-wrapper">
			<select name="searchType" id="searchType" id="sbtn">
				<option value="n"
					<c:out value="${cri.searchType == null?'selected':'' }" />>---</option>
				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':'' }" />>title</option>
				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected':'' }" />>content</option>
				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected':''}" />>title
					+ content</option>
			</select>
		</div>
	</div>

	<div class="4u 12u$(xsmall)">
		<input type="text" name="keyword" id="keywordInput"
			placeholder="Keyword" value="${cri.keyword}" />
	</div>
	<div class="2u 12u$(xsmall)">
		<button class="button special icon fa-search" id="sbtn">Search</button>

	</div>
	<div class="2u 12u$(xsmall)">
		<button class="button" id="rbtn">register</button>
	</div>
</div>


<!-- Break -->

<form style="justify-content: center; width: 100%;">
	<div class="pagination" >
		<c:if test="${pageMaker.prev}">
			<a href="list${pageMaker.makeQuery(pageMaker.startPage-1)}"
				class="previous">Prev</a>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			var="idx">
			<a href="/sboard/list${pageMaker.makeSearch(idx)}" 
			class="page 
			<c:if test="${pageMaker.cri.page == idx}">active</c:if>">${idx}</a>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage>0}">
			<a href="list${pageMaker.makeSearch(pageMaker.endPage +1)}"
				class="next">Next</a>
		</c:if>
	</div>
</form>

<script>
	$(document).ready(

			function(e) {

				$('#sbtn').on(
						"click",
						function() {
							self.location = "/sboard/list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
							console.log("event check....")
							console.log("search check..........")
							console.log("${pageMaker.makeQuery(1)}")
						});

				$('#rbtn').on("click", function() {

					self.location = "/sboard/register";
					console.log("click event....");
				});

			});

	var result = '${msg}';
	if (result == "success") {
		alert("글 작성이 완료되었습니다.");
	}
</script>

<%@ include file="../includes/footer.jsp"%>