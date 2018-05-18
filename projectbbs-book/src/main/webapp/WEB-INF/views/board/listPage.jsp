<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>








		<div class="pagination">
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
			</div> 
	</div>




</div>

<%@ include file="../includes/footer.jsp"%>