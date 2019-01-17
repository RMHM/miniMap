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
<title>회원정보 페이지</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	]
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />

		<section id="find">
			<div class="container">
				<div class="raw">
					<div class="col-lg-4 col-md-offset-4">
						<div class="btn-group">
							<input type="button" value="ID 찾기" id="idTap" class="btn btn-theme"> <input type="button" value="PW 찾기" id="pwTap" class="btn btn-theme">
						</div>
					</div>
					<div id="findDiv" class="col-lg-4 col-md-offset-4"></div>
				</div>
			</div>
		</section>

		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script src="/resources/js/member/infoFindPage.js"></script>
</html>