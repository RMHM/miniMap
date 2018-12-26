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
							<input type="button" value="요청하기"
								onclick="location.href='/myPage/rePermissionClick.do'" />
							<table class="table table-hover">
								<thead>
									<tr>
										<th>분류</th>
										<th>작성자</th>
										<th>요청날짜</th>
										<th>승인여부</th>
									</tr>
								</thead>
								<tbody>
									<%-- ${list.size() }--%>
									<%-- ${list } --%>
									<%-- ${list.aId } --%>
									<%--   ${list.size() } --%>
									<c:if test="${!empty list }">
										<c:forEach var="a" begin="0" end="${list.size()-1 }" step="1">
										<%-- 	<c:out value="${ a}" /> --%>

											<tr>
												<td>${list.get(a).getAId()}</td>
												<td>${list.get(a).getMName()}</td>
												<td>${list.get(a).getRequest_date()}</td>
												<c:if test="${!empty l.getGrant_date()}">
													<td>승인</td>
												</c:if>
												<c:if test="${empty l.getGrant_date()}">
													<td>요청중</td>
												</c:if>


											</tr>
										</c:forEach>
										<%--  <c:forEach begin="0" end ="${list.size()} step="1" var="l">
									 <c:out value="asd"/>
									
									  <tr>
									  <td>${list.get(0).getAId()} </td>
									  <td></td>
									  <td></td>
									  <td></td>
									  </tr>
								${l.get(0).getAId()}
										<tr>
											<td>${l.getAId()}</td>
											<td>${l.getMName()}</td>
											<td>${l.getRequest_date()}</td>
											<c:if test="${empty l.getGrant_date()}"><td>승인</td>
											</c:if>
											<c:if test="${!empty l.getGrant_date()}"><td>요청중</td>
											</c:if>
											
										</tr> 
									</c:forEach>  --%>
									</c:if>

									<c:if test="${empty list }">
										<tr>
											<td colspan="4" align="center">요청글이 없습니다.
										</tr>

									</c:if>
								</tbody>
							</table>



						</div>
					</div>
				</div>
			</div>

			<!-- 	<script>
			$('input[type=button]').click(function{
				location.href="/myPage/rePermissionClick.do";
			});
			</script> -->


		</div>
		<c:import url="../common/footer.jsp" />
	</div>
</body>
</html>
