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
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/Boardeditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper container">
		<c:import url="/WEB-INF/views/common/header.jsp" />
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
			<!-- 에디터 넣어야됨. -->
			<div class="col-md-10">
				<form action="/board/boardview2.do" method="post" id="frm" enctype="multipart/form-data">
					<input type="hidden" name="bId" value="" />
					<input type="text" placeholder="제목" name="bTitle" id="bTitle" required>
					<input type="hidden" name="bContent" id="bContent">
					<textarea name="boardcontent" id="boardcontent" style="display:none;"></textarea>
					<input type="button" id="insertBoard" onclick="submitContents(this);" value="등록"/>
					<input type="button" onclick="pasteHTML();" value="본문에 내용 넣기" />
					<input type="button" onclick="showHTML();" value="본문 내용 가져오기" />					
				</form>
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
<script type="text/javascript">
//전역변수
var oEditors = [];  

$(function(){
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "boardcontent",
            sSkinURI: "<%=request.getContextPath()%>/Boardeditor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
       /*  $("#insertBoard").click(function(){
            //id가 boardcontent인 textarea에 에디터에서 대입
            var content = oEditors.getById["boardcontent"].getIR();         
           
            var inputcontent = oEditors.getById["boardcontent"].exec("UPDATE_CONTENTS_FIELD", []);
            $("#boardcontent").val(oEditors.getById["boardcontent"].getIR());
            //폼 submit
            alert($("#boardcontent").val());
            console.log('게시물내용 값: ' + content);
            console.log('textarea boardcontent 값 :' + $("textarea[name=boardcontent]").val());
            $("#bContent").val($("#boardcontent").val());
        	 $("#frm").submit();
           
        }); */
        
    });    
   
function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["boardcontent"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["boardcontent"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedoEditors) {
	oEditors.getById["boardcontent"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("contents").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedoEditors.form.submit();
	} catch(e) {}
}

</script>




</html>