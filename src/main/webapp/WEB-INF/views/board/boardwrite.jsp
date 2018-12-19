<%@
   page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/Boardeditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>


</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<div class="container">
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
			<!-- 에디터 넣어야됨. -->
			<div class="col-md-10">
				<form>
					<input type="hidden" class="form-control" name="boardNo" value="" />
					<input type="text" class="form-control" placeholder="제목"
						name="boardTitle" id="boardTitle" value="" required>
					<textarea id="ir1" name="ir1" rows="10" cols="100" value=""></textarea>
					<input type="button" id="writebtn" name="writebtn" value="작성">
				</form>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-10"></div>
				</div>
			</div>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
</body>
<script type="text/javascript"> 
var oEditors = []; 
$(function(){ 
	nhn.husky.EZCreator.createInIFrame({ 
		oAppRef: oEditors, 
		elPlaceHolder: "ir1",
		sSkinURI: "/Boardeditor/SmartEditor2Skin.html",
		htParams : { bUseToolbar : true,
					 bUseVerticalResizer : true,
					 bUseModeChanger : true,
					 fOnBeforeUnload : function(){
						 
					 }
		}, 
		
		fOnAppLoad : function(){ 
			 oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
			 }, 
			 fCreator: "createSEditor2" 
		}); 
	});
</script>



</html>