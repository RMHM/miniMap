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
<title>광고게시판 - ${b.BTitle}</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		
		<div class="container">
			<div class="col-md-10 col-md-offset-1">
				<input type="hidden" name="BNo" value="${b.BNo }" />
				<input type="hidden" name="MNo" value="${b.MNo }" />
				<input type="hidden" name="BId" value="${b.BId }" />
				<!-- 게시판 제목 -->
				<label id="bTitle" style="font-size:2em; font-weight:bold">${b.BTitle }</label><br>
				<!-- 게시판 작성자 -->
				<label id="info">작성자 : ${b.mnick} 작성일 : ${b.BDate}</label>
				<table border=0>
					<thead>
						<tr>
							<th>작성자</th>
							<th>${b.mnick}</th>
						</tr>
						<tr>
							<th>작성일</th>
							<th>${b.BDate}</th>
						</tr>
						<tr>
							<th>방문수</th>
							<th>${b.BCount}</th>
						</tr>
					</thead>
				</table>
				<textarea id="content" style="display: none;">${b.BContent}</textarea>
				<div id="BContent" style="width: 100%; height: auto; background-color: aliceblue; overflow:hidden"> ${b.BContent}</div>
				&nbsp;&nbsp;&nbsp;
				
				<div align="right" style="margin-top:-15px">
					<!-- 회원번호와 작성자 번호가 일치하면.. -->
					<c:if test="${member.mno eq b.MNo}">
						<input type="button" class="btn btn-warning btn-large" name="modify" value="수정"
							onclick="location.href='${pageContext.request.contextPath}/board/adBoardUpdate.go?bid=${b.BId }'">
					</c:if>
					<!-- 회원번호와 작성자 번호가 일치하거나 회원이 관리자 일 경우 -->
					<c:if test="${member.mno eq b.MNo or member.mtype eq 'A'}">
						<input type="button" class="btn btn-danger btn-large" name="delete" value="삭제"
							onclick="location.href='${pageContext.request.contextPath}/board/adBoardRemove.do?bid=${b.BId }'">
					</c:if>
					<input type="button" class="btn btn-theme btn-large" onclick="location.href='${pageContext.request.contextPath}/board/adBoard.go'" value="이전 항목으로" />
				</div>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>