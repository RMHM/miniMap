<%@
	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 게시판</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		
		<div class="container">
			<div class="col-md-10 col-md-offset-1">
				<h4>게시판 목록</h4>
				<br>
				<div class="raw"></div>
				<input type="button" value="글쓰기" id="adWrite" onclick="javascript:location.href='/board/adBoardWrite.go'">
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>