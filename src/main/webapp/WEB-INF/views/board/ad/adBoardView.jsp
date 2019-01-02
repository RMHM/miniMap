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
<title>Insert title here</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		
		<div class="container">
			<div class="col-md-10 col-md-offset-1">
				<input type="hidden" name="BNo" value="${b.BNo }" />
				<input type="hidden" name="MNo" value="${b.MNo }" /> <input type="hidden" name="BId" value="${b.BId }" />
				<!-- 게시판 제목 -->
				<input type="text" name="boardTitle" id="boardTitle" value="${b.BTitle }" readonly>
				<!-- 게시판 작성자 -->
				<input type="text" class="form-control" name="boardWriter" value="${b.mnick}" readonly>
				<textarea id="content" style="display: none;">${b.BContent}</textarea>
				<div id="BContent" style="width: 90%; height: 500px; background-color: aliceblue"> ${b.BContent}</div>
				&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-theme btn-large" onclick="location.href='${pageContext.request.contextPath}/board/boardlist1.do'" value="리스트로" />
				<!-- 회원번호와 작성자 번호가 일치하면.. -->
				<c:if test="${member.mno eq b.MNo}">
					<input type="button" class="btn btn-theme btn-large" name="modify" value="수정"
						onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?BId=${b.BId }'">
				</c:if>
				<!-- 회원번호와 작성자 번호가 일치하거나 회원이 관리자 일 경우 -->
				<c:if test="${member.mno eq b.MNo or member.mtype eq 'A'}">
					<input type="button" class="btn btn-theme btn-large" name="delete" value="삭제"
						onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?BId=${b.BId }'">
				</c:if>
			</div>
		</div>]
		
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>