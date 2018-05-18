<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>




	<!-- Introduction -->
	<section id="intro" class="main">

		<!-- Table -->
		<section>
			<h2>HELLO, </h2>
			<h2>STRANGER</h2>
			<h2>　</h2>
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
			<script>
				var result = '${msg}';
				if (result == "success") {
					alert("저장이 완료되었습니다");
				}
			</script>

			<%@ include file="../includes/footer.jsp"%>