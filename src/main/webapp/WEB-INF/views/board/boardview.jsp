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
      <div class="">
			<div class="col-md-2" align="center">
				&nbsp;&nbsp;
				<h4>--게시판 목록--</h4>
				<ul>
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					<li class="">자유 게시판</li> &nbsp;
					<li class="">정보공유 게시판</li> &nbsp;
					<li class="">여행후기 게시판</li> &nbsp;
					<li class="">질문 게시판</li>
				</ul>
			</div>			
			<div class="col-md-10" overflow:auto >				
					<!-- 게시판 고유 번호 -->
					<input type="hidden" name="boardNo" value="" /> 
					<!-- 게시판 제목 -->
					<input type="text" placeholder="제목" name="boardTitle" id="boardTitle" 
					<%-- value="${board.bTitle }" --%> required>
					<!-- 게시판 작성자 -->
					<input type="text" class="form-control" name="boardWriter" 
					<%-- value="${board.boardWriter}" --%> readonly required>
					<div>${requestScope.result}</div>
					&nbsp;&nbsp;&nbsp;
					<input type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardmain.do'"
					value="리스트로"/>
					<%-- <c:if test="${member.userId eq board.boardWriter}">  </c:if>--%>
					<input type="button" name="modify" value="수정">
					<input type="button" name="delete" value="삭제">				
			</div>
			
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-10"></div>
				</div>
			</div>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>	
</body>
</html>