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
	src="<%=request.getContextPath()%>/Boardeditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>


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
				<form action="/submit" method="post" id="frm" enctype="multipart/form-data">
					<input type="hidden" name="bId" value="" />
					<input type="text" placeholder="제목" name="bTitle" id="bTitle" required>
					<input type="hidden" name="bContent" id="bContent">
					<textarea name="boardcontent" id="boardcontent"></textarea>
					<input type="button" id="insertBoard" onclick="submitContents(this);" value="등록"/>
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
var obj = [];  

$(function(){
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
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
            var content = obj.getById["boardcontent"].getIR();         
           
            var inputcontent = obj.getById["boardcontent"].exec("UPDATE_CONTENTS_FIELD", []);
            $("#boardcontent").val(obj.getById["boardcontent"].getIR());
            //폼 submit
            alert($("#boardcontent").val());
            console.log('게시물내용 값: ' + content);
            console.log('textarea boardcontent 값 :' + $("textarea[name=boardcontent]").val());
            $("#bContent").val($("#boardcontent").val());
        	 $("#frm").submit();
           
        }); */
        
    });    
   
    function submitContents(elClickedObj) {
    	obj.getById["boardcontent"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
    	
    	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
    	console.log(obj);
    	console.log(obj[0].getContents());
    	
    	try {
    		elClickedObj.form.submit();
    	} catch(e) {}
    }

</script>




</html>