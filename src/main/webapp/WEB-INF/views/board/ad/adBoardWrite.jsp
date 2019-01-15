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
<title>게시글 작성하기</title>
<c:import url="/WEB-INF/views/common/exFile.jsp"/>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		
		<div class="container">
			<div class="col-md-10 col-md-offset-1">
				<h4>게시글 작성</h4>
				<c:if test="${not empty member}">
			        <form action="/board/imgBaordAdd.do" method="post" id="boardfrm" enctype="multipart/form-data">
						<input type="hidden" id="mNo" name="mNo" value="${member.mno}"/><!-- 작성자 회원번호  -->
						<div class="form-group">
							<input type="text" placeholder="제목을 입력하세요" name="bTitle" id="bTitle" class="form-control" required>	
						</div>
						<div id="daumeditor" class="edit" style="width:100%; height:100%;"></div>				
						<textarea name="bContent" id="bContent" style="display:none;"></textarea>
					</form>
				</c:if>	
				<c:if test="${empty member}">
					<!-- 로그인 하지 않고 접근하였을 때 처리 -->
					<c:out value="로그인 하지않고 접근 하셨습니다."/>
				</c:if>
				<input type="button" value="작성하기" id="btnAdd" class="btn btn-theme" onclick="javascript:Editor.save()">
				<input type="button" value="돌아가기" id="btnBack" class="btn btn-theme" onclick="javascript:location.href='/board/adBoard.go'">
				
			</div><br><br>
		</div>
		<br>
		
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
<link rel="stylesheet" href="/daumeditor/css/editor.css" type="text/css"/>
<script src="/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
<script src="/resources/js/board/daumEditorLoad.js"></script>
</html>