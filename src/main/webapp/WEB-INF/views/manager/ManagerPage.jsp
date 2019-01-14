<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />

<title>관리자 페이지</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/manager/manager.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager/manager.css">

</head>
<body>
	<!-- 외부 파일 설정 -->
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	
	<div id="container">
	
	<p style="font-size: 25px; font-weight: 600;">관리자 페이지</p>
	
	<br>
	<div class="searchArea">
		<select id="searchCondition" name="searchCondition">
			<option value="mid">ID</option>
			<option value="mnick">닉네임</option>
			<option value="email">이메일</option>
		</select> 
		<input type="search" id="keyword" placeholder="키워드를 입력하세요:)">
		<button id="searchBtn">검색하기</button>
		<button id="resetBtn" onclick="window.location.reload()">리셋</button>
	</div>
	
	<div id="resultArea">
		<table id="resultTable">
			<thead>
				<tr>
					<th><b>구분</b></th>
					<th><b>회원번호</b></th>
					<th><b>ID</b></th>
					<th><b>이름</b></th>
					<th><b>닉네임</b></th>
					<th><b>이메일</b></th>
					<th><b>성별</b></th>
					<th><b>연령대</b></th>
					<th><b>가입일</b></th>
					<th><b>상태</b></th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	
	<div id="listArea">
	<ul id="tabs">
	    <li><a href="#" value="s" name="1" title="tab1">통계</a></li>
	    <li><a href="#" value="m" name="2" title="tab2">일반회원</a></li>
	    <li><a href="#" value="c" name="3" title="tab3">기업회원</a></li>
	    <li><a href="#" value="b" name="4" title="tab4">블랙리스트</a></li>   
	</ul>
	
	<div id="content"> 
		<div id="tab1" align="center">
			<div id="chart1"></div>
			<div id="chart2"></div>
			<div id="chart3"></div>
			<div id="chart4"></div>
			<div id="chart5"></div>
		</div>
		
	    <div id="tab2">
			<table id="mTable">
				<thead>
					<tr>
						<th><b>회원번호</b></th>
						<th><b>ID</b></th>
						<th><b>이름</b></th>
						<th><b>이메일</b></th>
						<th><b>성별</b></th>
						<th><b>연령대</b></th>
						<th><b>가입일</b></th>
						<th><b>상태</b></th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>				
			</table>
		</div>
	    <div id="tab3">
			<table id="cTable">
				<thead>
					<tr>
						<th><b>회원번호</b></th>
						<th><b>ID</b></th>
						<th><b>기업명</b></th>
						<th><b>이메일</b></th>
						<th><b>권한</b></th>
						<th><b>가입일</b></th>
						<th><b>상태</b></th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	    <div id="tab4">
			<table id="bTable">
				<thead>
					<tr>
						<th><b>회원번호</b></th>
						<th><b>ID</b></th>
						<th><b>이름</b></th>
						<th><b>이메일</b></th>
						<th><b>성별</b></th>
						<th><b>연령대</b></th>
						<th><b>상태</b></th>
						<th><b>기간</b></th>
						<th><b>사유</b></th>
						<th><b>해제</b></th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>	
			</table>
		</div>
	</div>

	</div>
	</div>
	<!-- <script>
		
	</script> -->
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>