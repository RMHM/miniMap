<%@
	page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>miniMap에 오신걸 환영합니다.</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />

</head>

<body>
	<!-- 외부파일 선언 -->

	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<!-- header 선언 -->
		<c:import url="../common/header.jsp" />
		<div class="container">
			<c:import url="../common/myPageNav.jsp" />

			<div class="col-md-10">

				<div class="container-fluid">
					<div class="row">
						<div class="list">

							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>분류</th>
										<th>제목</th>
										<th>작성자</th>
										<th>조회수</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
								${list.size() } 
								${list.get(0)} 
								
									<%--  <c:out value="${list.size() gt 0 }"></c:out>  --%>
									<%-- <c:if test="${list.size() gt 0"> --%>
									<c:forEach items="${list } " var="l">
									
									<%-- <c:out value="${list }"></c:out> --%>
											<%-- ${l.bNo} --%>
											<%-- <tr id="${b.boardNo}"> --%>
											<tr>
										<%-- 	<td>${l.bNo}</td>
											<td>${l.bCode}</td>
											<td>${l.bTitle}</td>
											<td>${l.mNo}</td>
											<td>${l.bCount}</td>
											<td>${l.bDate}</td> --%> 
										</tr>

									</c:forEach>
									<%-- </c:if> --%>

									<%-- 	<c:if test="${list.size() eq 0} ">
							aaaaaaaaaaaa
										<tr>
											<td colspan="6">작성한 글이 없습니다.</td>
										</tr>
									</c:if>  --%>
								</tbody>
							</table>

							<c:out value="${pageBar}" escapeXml="false" />

						</div>
					</div>
				</div>
			</div>




		</div>
		<c:import url="../common/footer.jsp" />
	</div>
</body>
</html>
