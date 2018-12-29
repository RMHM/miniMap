<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주도 api 테스트으으으으으으으으으으으으</title>
<c:import url="/WEB-INF/views/common/exFile.jsp" />
</head>
<body>

	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<div class="col-md-10" id='calDiv'>

				<div id='calendar'></div>

			</div>
		</div>

		<br>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script src="/resources/js/api/contents.js"></script>
</html>