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
<title>지도테스트</title>
<!-- daum map api key로 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43311a367cc4345f1ad5c5f8115c6c5e&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		<h1>mapTest</h1>
		<div id="map" style="width:1024px;height:720px;"></div>
		<input type="button" value="마커보이기" id="btShow">
		<input type="button" value="마커숨기기" id="btHide">
		<input type="button" value="되돌리기" id="btBack">
		<input type="button" value="위경도 출력" id="btPrintLatLon">
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
	
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/testMap.js"></script>
</html>