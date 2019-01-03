<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행사 달력</title>
<c:import url="/WEB-INF/views/common/exFile.jsp" />
</head>
<body>

	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<div class="col-md-10 col-md-offset-1" id='calDiv'>
				
				<img src="/resources/img/loading.gif" id="loading" style="width : 250px;height : 250px;">
				<div id='calendar'></div>
				
			</div>
		</div>

		<br>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script src="/resources/js/api/contents.js"></script>
</html>