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
<title>게시글 수정하기</title>
<c:import url="/WEB-INF/views/common/exFile.jsp"/>
</head>
<body>
	
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		
			<div class="container">
				<div class="col-md-10 col-md-offset-1">
			        <form action="/board/adBoardUpdate.do" method="post" id="boardfrm" enctype="multipart/form-data">
       					<input type="hidden" name="MNo" value="${b.MNo }" /> <input type="hidden" name="BId" value="${b.BId }" />
						<input type="hidden" id="mNo" name="mNo" value="${member.mno}"/><!-- 작성자 회원번호  -->
						<div class="form-group">
							<input type="text" placeholder="제목을 입력하세요" name="bTitle" id="bTitle" class="form-control" value="${b.BTitle}" required>
						</div>
						<div id="daumeditor" class="edit" style="width:100%; height:100%;"></div>
						<textarea name=bContent id="bContent" style="display:none;"></textarea>
						<div align="right">
							<input type="button" value="수정하기" class="btn btn-warning" id="btnModify"
								onclick="javascript:Editor.save()">
							<input type="button" value="삭제하기" id="btnDelete" class="btn btn-danger" 
								onclick="location.href='${pageContext.request.contextPath}/board/adBoardRemove.do?bid=${b.BId }'">
							<input type="button" value="이전으로" id="btnBack" class="btn btn-theme"
								onclick="location.href='${pageContext.request.contextPath}/board/adBoardView.do?bid=${b.BId}'">
						</div>
					</form>
				</div>
			</div>
			<br>
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
<link rel="stylesheet" href="/daumeditor/css/editor.css" type="text/css"/>
<script src="/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
<script src="/resources/js/board/daumEditorLoad.js"></script>
<script>
	$(function(){
		Editor.modify({
			'content' : '${b.BContent}'
		})
	})
</script>
</html>