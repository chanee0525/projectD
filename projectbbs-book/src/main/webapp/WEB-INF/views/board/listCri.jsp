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

 		
			 	<div class="pagination">
				<a href="#" class="previous">Prev</a>
				<a href="#" class="page active">1</a> <a href="#" class="page">2</a>
				<a href="#" class="page">3</a> <span class="extra">&hellip;</span> <a
					href="#" class="page">8</a> <a href="#" class="page">9</a> <a
					href="#" class="page">10</a> <a href="#" class="next">Next</a>
			</div> 

<%-- <%-- 		<div class="pagination">
				<c:if test="${pageMaker.prev}">
					<a href="listPage?page=${pageMaker.startPage-1}" class="previous">Prev</a>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<a href="listPage?page=${idx}"
						class="page <c:if test="${pageMaker.cri.page == idx}">active</c:if>">${idx}</a>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<a href="listPage?page=${pageMaker.endPage +1}" class="next">Next</a>
				</c:if>
			</div>  --%> 
	</div>
	







	<script>
		var result = '${msg}';
		if (result == "success") {
			alert("저장이 완료되었습니다");
		}
	</script>

	<%@ include file="../includes/footer.jsp"%>