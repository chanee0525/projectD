<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>




<!-- Table -->
<section>

	<h2></h2>
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
						<td><a href='/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${boardVO.regdate}" /></td>
						<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
					</tr>
				</c:forEach>
			</tbody>


			<tfoot>


			</tfoot>
		</table>





	</div>



	<%-- <span>PAGE MAKER...................${pageMaker }</span> --%>

 	<div class="pagination">
		<c:if test="${pageMaker.prev}">
			<a href="/board/listPage?page=${pageMaker.startPage-1}"
				class="previous">Prev</a>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			var="idx">
			<a href="/board/listPage?page=${idx}"
				class="page <c:if test="${pageMaker.cri.page == idx}">active</c:if>">${idx}</a>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="/board/listPage?page=${pageMaker.endPage +1}" class="next">Next</a>
		</c:if>
	</div>
 

<%-- 
	<ul class="pagination">
		<!--<a href="" class="previous">Prev</a>-->
		<li><a href="1" class="page active">1</a> <a href="#" class="page">2</a></li> 
		<li><a href="3" class="page">3</a> <span class="extra">&hellip;</span></li> 
			<li><a href="8" class="page">8</a> <a href="#" class="page">9</a></li> 
			<li><a href="10" class="page">10</a> <a href="#" class="next">Next</a></li>
	</ul>
	
	
	<form id="pagination">
	<input type='hidden' name="page" value=${pageMaker.cri.perPageNum }>
	<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum }>
	
	$(".pagigation li a").on("click", function(event){
	
	event.preventDefault();
	
	var targetPgate = $(this).attr("href");
	
	var jobForm = ${"#jobForm" };
	
	jobForm.find("[name='page']").val(targetPage);
	jobForm.attr("action","/board/listPage").attr("method","get");
	jobForm.submit();
	
	</form> --%>




	<%@ include file="../includes/footer.jsp"%>