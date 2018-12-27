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

			<div class="col-md-10">
			
			<p style=" font-size: 25px; font-weight: 600;">승인 페이지</p>
				
				<br>

				<div class="container-fluid">
					<div class="row">
						<div class="list">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>분류</th>
										<th>작성자</th>
										<th>주소</th>
										<th>요청날짜</th>
										<th>승인</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${!empty list }">
										<c:forEach var="a" begin="0" end="${list.size()-1 }" step="1">
											<tr>
												<td>${list.get(a).getAId()}</td>
												<td>${list.get(a).getMName()}</td>
												<td>${list.get(a).getAddress() }</td>
												<td>${list.get(a).getRequest_date()}</td>
												<td>
													<button onclick="grantOk();">승인</button>
												</td>
											</tr>
										</c:forEach>
									</c:if>

									<c:if test="${empty list }">
										<tr>
											<td colspan="5" align="center">요청글이 없습니다.
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
		<c:import url="../common/footer.jsp" />
	</div>
	
	<script>
		function grantOk(){
			location.href="/mypage/grantAuthority.do"
		}
	
	</script>
	
</body>
</html>
