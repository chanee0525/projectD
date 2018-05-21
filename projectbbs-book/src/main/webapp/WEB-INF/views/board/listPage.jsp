<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>




<!-- Table -->


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
					<td><a
						href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page )}&bno=${boardVO.bno}'>${boardVO.title}</a></td>
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
		<a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1)}" class="previous">Prev</a>
	</c:if>

	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		<a href="/board/listPage${pageMaker.makeQuery(idx )}" class="page 
			<c:if test="${pageMaker.cri.page == idx}">active</c:if>">${idx}</a>
	</c:forEach>
	<c:if test="${pageMaker.next && pageMaker.endPage>0}">
		<a href="listPage${pageMaker.makeQuery(pageMaker.endPage +1)}" class="next">Next</a>
	</c:if> 
</div>

<%-- <div class="pagination">
	<c:if test="${pageMaker.prev}">
		<li><a
			href="listPage${pageMaker.makeQuery(pageMaker.startPage-1) }">Prev</a></li>
	</c:if>

	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
		var="idx">
		<li <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
			<a href="listPage&{pageMaker.makeQuery(pageMaker.endPage+1)}">${idx }</a>
		</li>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<li><a
			href="listPage${pageMaker.makeQuery(pageMaker.endPage +1)}">Next</a></li>
	</c:if>

</div> --%>



<%@ include file="../includes/footer.jsp"%>